<?php
declare(strict_types=1);

final class AnalyticsService
{
    public function build(
        array $class,
        array $students,
        array $tasks,
        array $taskRecords,
        array $attendance,
        array $settings = []
    ): array {
        $attendanceByStudent = [];
        foreach ($attendance as $row) {
            $attendanceByStudent[(int) $row['enrollment_id']][(int) $row['meeting']] = $row['status'];
        }

        $recordsByTaskStudent = [];
        foreach ($taskRecords as $row) {
            $recordsByTaskStudent[(int) $row['task_id']][(int) $row['enrollment_id']] = $row;
        }

        $threshold = (float) ($class['pass_threshold'] ?? $settings['default_pass_threshold'] ?? 60);
        $studentAnalytics = [];
        $estimatedTotal = 0.0;
        $riskCount = 0;

        foreach ($students as $student) {
            $enrollmentId = (int) $student['enrollment_id'];
            $attendanceRate = $this->attendanceRate(
                $attendanceByStudent[$enrollmentId] ?? []
            );
            $completion = $this->taskCompletion(
                $tasks,
                $recordsByTaskStudent,
                $enrollmentId
            );
            $prediction = $this->prediction(
                $tasks,
                $recordsByTaskStudent,
                $enrollmentId,
                $threshold
            );
            $reasons = $this->riskReasons(
                $student,
                $attendanceRate,
                $prediction,
                $tasks,
                $recordsByTaskStudent,
                $enrollmentId
            );

            if ($reasons !== []) {
                $riskCount++;
            }
            $estimatedTotal += $prediction['estimated'];

            $studentAnalytics[$enrollmentId] = [
                'attendance_rate' => $attendanceRate,
                'task_completion' => $completion,
                'prediction' => $prediction,
                'risk_reasons' => $reasons,
            ];
        }

        $trend = $this->classTrend(
            $tasks,
            $students,
            $recordsByTaskStudent,
            (float) ($settings['trend_drop_threshold'] ?? 10)
        );

        $totalWeight = array_reduce(
            $tasks,
            static fn (float $sum, array $task): float => $sum + (float) $task['weight'],
            0.0
        );

        return [
            'attendance_map' => $attendanceByStudent,
            'task_records_map' => $recordsByTaskStudent,
            'students' => $studentAnalytics,
            'trend' => $trend,
            'total_weight' => $totalWeight,
            'risk_count' => $riskCount,
            'average_estimated' => count($students) > 0
                ? $estimatedTotal / count($students)
                : null,
            'data_health' => $this->dataHealth($students),
        ];
    }

    public function attendanceCounts(array $students, array $attendanceMap, int $meeting): array
    {
        $counts = ['H' => 0, 'I' => 0, 'S' => 0, 'A' => 0, 'blank' => 0];

        foreach ($students as $student) {
            $enrollmentId = (int) $student['enrollment_id'];
            $status = $attendanceMap[$enrollmentId][$meeting] ?? null;
            if ($status !== null && isset($counts[$status])) {
                $counts[$status]++;
            } else {
                $counts['blank']++;
            }
        }

        return $counts;
    }


    /**
     * Rubrik acuan dosen untuk praktikum.
     *
     * Nilai aspek tidak dihitung otomatis dari nilai akhir karena
     * pembagian tersebut memerlukan observasi dosen per aspek.
     */
    public function practicumRubric(): array
    {
        return [
            [
                'name' => 'Ketepatan Hasil',
                'weight' => 35,
                'description' =>
                    'Program/hasil praktikum berjalan benar dan sesuai instruksi.',
            ],
            [
                'name' => 'Kelengkapan',
                'weight' => 25,
                'description' =>
                    'Seluruh komponen yang diminta tersedia.',
            ],
            [
                'name' => 'Kemandirian',
                'weight' => 20,
                'description' =>
                    'Kemampuan menyelesaikan tanpa banyak bantuan.',
            ],
            [
                'name' => 'Ketepatan Waktu',
                'weight' => 15,
                'description' =>
                    'Diselesaikan sesuai tenggat.',
            ],
            [
                'name' => 'Inisiatif & Kreativitas',
                'weight' => 5,
                'description' =>
                    'Ada pengembangan relevan di luar instruksi minimum.',
            ],
        ];
    }

    /**
     * Mengubah satu nilai numerik menjadi predikat dan feedback otomatis.
     *
     * Nilai dinormalisasi ke skala 0-100 sehingga tetap konsisten saat
     * komponen menggunakan nilai maksimum selain 100.
     */
    public function practicumAssessment(
        ?float $score,
        float $maxScore = 100.0
    ): ?array {
        if ($score === null) {
            return null;
        }

        $safeMaxScore = $maxScore > 0 ? $maxScore : 100.0;
        $normalized = max(
            0.0,
            min(
                100.0,
                ($score / $safeMaxScore) * 100.0
            )
        );

        $assessment = match (true) {
            $normalized >= 95 => [
                'predicate' => 'Unggul',
                'tone' => 'excellent',
                'icon' => '★',
                'description' =>
                    'Seluruh komponen praktikum diselesaikan dengan benar, lengkap, mandiri, dan tepat waktu. Mahasiswa juga menunjukkan inisiatif melalui pengembangan yang relevan melampaui persyaratan dasar praktikum.',
            ],
            $normalized >= 85 => [
                'predicate' => 'Sangat Baik',
                'tone' => 'very-good',
                'icon' => '●',
                'description' =>
                    'Praktikum diselesaikan dengan sangat baik dan seluruh komponen utama terpenuhi. Terdapat sedikit arahan dalam proses penyelesaian atau beberapa bagian minor yang masih dapat disempurnakan.',
            ],
            $normalized >= 75 => [
                'predicate' => 'Baik',
                'tone' => 'good',
                'icon' => '●',
                'description' =>
                    'Praktikum berhasil diselesaikan sesuai tujuan utama. Beberapa bagian masih membutuhkan arahan atau terdapat komponen minor yang perlu diperbaiki.',
            ],
            $normalized >= 65 => [
                'predicate' => 'Cukup',
                'tone' => 'fair',
                'icon' => '●',
                'description' =>
                    'Praktikum telah diselesaikan, tetapi masih memerlukan pendampingan dan terdapat beberapa komponen yang belum lengkap. Ketepatan waktu dan kemandirian perlu ditingkatkan.',
            ],
            $normalized >= 55 => [
                'predicate' => 'Perlu Perbaikan',
                'tone' => 'needs-improvement',
                'icon' => '●',
                'description' =>
                    'Praktikum telah dikerjakan, tetapi belum memenuhi seluruh komponen yang ditetapkan. Penyelesaian membutuhkan pendampingan intensif dan dapat melewati batas waktu yang ditentukan.',
            ],
            default => [
                'predicate' => 'Belum Memadai',
                'tone' => 'inadequate',
                'icon' => '●',
                'description' =>
                    'Sebagian besar komponen belum terpenuhi atau praktikum belum menunjukkan kompetensi minimum yang ditetapkan.',
            ],
        };

        return [
            ...$assessment,
            'normalized_score' => round($normalized, 2),
            'raw_score' => $score,
            'max_score' => $safeMaxScore,
        ];
    }


    public function gradeLetter(float $score): string
    {
        return match (true) {
            $score >= 85 => 'A',
            $score >= 80 => 'A-',
            $score >= 75 => 'B+',
            $score >= 70 => 'B',
            $score >= 65 => 'C+',
            $score >= 60 => 'C',
            $score >= 50 => 'D',
            default => 'E',
        };
    }

    public function typeAverage(
        array $tasks,
        array $recordsMap,
        int $enrollmentId,
        callable $matcher
    ): ?float {
        $weightedPoints = 0.0;
        $weight = 0.0;

        foreach ($tasks as $task) {
            if (!$matcher($task)) {
                continue;
            }

            $record = $recordsMap[(int) $task['id']][$enrollmentId] ?? null;
            $score = $this->normalizedScore($task, $record);
            if ($score === null) {
                continue;
            }

            $taskWeight = (float) $task['weight'];
            $weightedPoints += ($score / 100) * $taskWeight;
            $weight += $taskWeight;
        }

        return $weight > 0 ? ($weightedPoints / $weight) * 100 : null;
    }

    private function attendanceRate(array $attendance): ?int
    {
        if ($attendance === []) {
            return null;
        }

        $present = 0;
        $recorded = 0;
        foreach ($attendance as $status) {
            if (!in_array($status, ['H', 'I', 'S', 'A'], true)) {
                continue;
            }
            $recorded++;
            if ($status === 'H') {
                $present++;
            }
        }

        return $recorded > 0 ? (int) round(($present / $recorded) * 100) : null;
    }

    private function taskCompletion(
        array $tasks,
        array $recordsMap,
        int $enrollmentId
    ): int {
        if ($tasks === []) {
            return 0;
        }

        $done = 0;
        foreach ($tasks as $task) {
            $record = $recordsMap[(int) $task['id']][$enrollmentId] ?? null;
            if (
                $record
                && in_array($record['status'], ['submitted', 'graded', 'late'], true)
            ) {
                $done++;
            }
        }

        return (int) round(($done / count($tasks)) * 100);
    }

    private function prediction(
        array $tasks,
        array $recordsMap,
        int $enrollmentId,
        float $threshold
    ): array {
        $currentPoints = 0.0;
        $gradedWeight = 0.0;
        $remainingWeight = 0.0;
        $scores = [];

        foreach ($tasks as $task) {
            $weight = (float) $task['weight'];
            $record = $recordsMap[(int) $task['id']][$enrollmentId] ?? null;
            $score = $this->normalizedScore($task, $record);

            if ($score === null) {
                $remainingWeight += $weight;
                continue;
            }

            $currentPoints += ($score / 100) * $weight;
            $gradedWeight += $weight;
            $scores[] = $score;
        }

        $bestPossible = $currentPoints + $remainingWeight;
        $needed = null;
        if ($currentPoints >= $threshold) {
            $needed = 0.0;
        } elseif ($remainingWeight > 0) {
            $needed = (($threshold - $currentPoints) / $remainingWeight) * 100;
        }

        $averagePerformance = $scores !== []
            ? array_sum($scores) / count($scores)
            : 0.0;
        $estimated = max(
            0.0,
            min(100.0, $currentPoints + ($remainingWeight * ($averagePerformance / 100)))
        );

        $status = 'Belum cukup data';
        $tone = 'neutral';

        if ($currentPoints >= $threshold) {
            $status = 'Nilai aman';
            $tone = 'ok';
        } elseif ($remainingWeight <= 0) {
            $status = 'Tidak lulus';
            $tone = 'danger';
        } elseif ($needed !== null && $needed <= 100) {
            if ($needed <= 70) {
                $status = 'Peluang lulus baik';
                $tone = 'ok';
            } elseif ($needed <= 85) {
                $status = 'Perlu dijaga';
                $tone = 'warn';
            } else {
                $status = 'Berisiko tinggi';
                $tone = 'danger';
            }
        } elseif ($needed !== null) {
            $status = 'Secara bobot tidak mungkin mencapai batas';
            $tone = 'danger';
        }

        return [
            'threshold' => $threshold,
            'current_points' => $currentPoints,
            'graded_weight' => $gradedWeight,
            'remaining_weight' => $remainingWeight,
            'best_possible' => $bestPossible,
            'needed' => $needed,
            'estimated' => $estimated,
            'status' => $status,
            'tone' => $tone,
        ];
    }

    private function normalizedScore(array $task, ?array $record): ?float
    {
        if (
            !$record
            || $record['score'] === null
            || $record['score'] === ''
            || !is_numeric($record['score'])
        ) {
            return null;
        }

        $max = max(1.0, (float) $task['max_score']);
        $score = max(0.0, min($max, (float) $record['score']));

        return ($score / $max) * 100;
    }

    private function riskReasons(
        array $student,
        ?int $attendanceRate,
        array $prediction,
        array $tasks,
        array $recordsMap,
        int $enrollmentId
    ): array {
        $reasons = [];

        if ($attendanceRate !== null && $attendanceRate < 75) {
            $reasons[] = 'Presensi <75%';
        }
        if (($student['registration_status'] ?? 'Aktif') !== 'Aktif') {
            $reasons[] = 'Registrasi ' . $student['registration_status'];
        }
        if (($student['payment_status'] ?? 'Lunas') !== 'Lunas') {
            $reasons[] = 'Pembayaran ' . $student['payment_status'];
        }
        if (($prediction['tone'] ?? '') === 'danger') {
            $reasons[] = 'Prediksi nilai berisiko';
        }

        foreach ($tasks as $task) {
            $record = $recordsMap[(int) $task['id']][$enrollmentId] ?? null;
            if (($record['status'] ?? '') === 'late') {
                $reasons[] = 'Ada tugas terlambat';
                break;
            }
        }

        return $reasons;
    }

    private function classTrend(
        array $tasks,
        array $students,
        array $recordsMap,
        float $dropThreshold
    ): array {
        $points = [];

        foreach ($tasks as $task) {
            $scores = [];
            foreach ($students as $student) {
                $record = $recordsMap[(int) $task['id']][(int) $student['enrollment_id']] ?? null;
                $score = $this->normalizedScore($task, $record);
                if ($score !== null) {
                    $scores[] = $score;
                }
            }

            $points[] = [
                'task' => $task,
                'average' => $scores !== [] ? array_sum($scores) / count($scores) : null,
                'count' => count($scores),
            ];
        }

        $worstDrop = null;
        for ($index = 1, $count = count($points); $index < $count; $index++) {
            $previous = $points[$index - 1];
            $current = $points[$index];

            if ($previous['average'] === null || $current['average'] === null) {
                continue;
            }

            $drop = $previous['average'] - $current['average'];
            if (
                $drop >= $dropThreshold
                && ($worstDrop === null || $drop > $worstDrop['drop'])
            ) {
                $worstDrop = [
                    'index' => $index,
                    'drop' => $drop,
                    'from' => $previous,
                    'to' => $current,
                ];
            }
        }

        return [
            'points' => $points,
            'worst_drop' => $worstDrop,
        ];
    }

    private function dataHealth(array $students): array
    {
        $namesMissing = 0;
        $academicMissing = 0;
        $contactsMissing = 0;
        $pcMissing = 0;
        $resourceMissing = 0;

        foreach ($students as $student) {
            if (trim((string) $student['name']) === '') {
                $namesMissing++;
            }
            if ($student['gpa'] === null || $student['target_gpa'] === null) {
                $academicMissing++;
            }
            if (trim((string) $student['email']) === '' && trim((string) $student['phone']) === '') {
                $contactsMissing++;
            }
            if (trim((string) ($student['pc'] ?? '')) === '') {
                $pcMissing++;
            }
            if (
                trim((string) ($student['github_url'] ?? '')) === ''
                && trim((string) ($student['colab_url'] ?? '')) === ''
                && trim((string) ($student['drive_url'] ?? '')) === ''
            ) {
                $resourceMissing++;
            }
        }

        $fieldCount = count($students) * 5;
        $missing = $namesMissing + $academicMissing + $contactsMissing + $pcMissing + $resourceMissing;
        $completeness = $fieldCount > 0
            ? max(0, (int) round((($fieldCount - $missing) / $fieldCount) * 100))
            : 100;

        return [
            'names_missing' => $namesMissing,
            'academic_missing' => $academicMissing,
            'contacts_missing' => $contactsMissing,
            'pc_missing' => $pcMissing,
            'resource_missing' => $resourceMissing,
            'completeness' => $completeness,
        ];
    }
}
