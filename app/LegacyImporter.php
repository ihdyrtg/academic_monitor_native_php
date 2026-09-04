<?php
declare(strict_types=1);

final class LegacyImporter
{
    public function __construct(
        private readonly PDO $pdo,
        private readonly Repository $repository
    ) {
    }

    public function import(array $state, ?int $userId = null): array
    {
        if (!isset($state['classes']) || !is_array($state['classes'])) {
            throw new InvalidArgumentException(
                'Format backup tidak dikenali. Gunakan file Backup JSON dari dashboard HTML v3.'
            );
        }

        $summary = [
            'programs' => 0,
            'courses' => 0,
            'classes' => 0,
            'students' => 0,
            'tasks' => 0,
            'attendance' => 0,
            'task_records' => 0,
            'events' => 0,
        ];

        Database::transaction(function () use ($state, $userId, &$summary): void {
            $this->importSettings($state['settings'] ?? []);

            $programMap = $this->importPrograms($state['programs'] ?? [], $summary);
            $courseMap = $this->importCourses($state['courses'] ?? [], $programMap, $summary);
            $classMap = $this->importClasses(
                $state['classes'] ?? [],
                $programMap,
                $courseMap,
                $summary
            );

            foreach ($classMap as $legacyClassId => $classId) {
                $legacyData = $state['classData'][$legacyClassId] ?? [];
                if (!is_array($legacyData)) {
                    continue;
                }

                $this->importClassData(
                    $classId,
                    $legacyData,
                    $userId,
                    $summary
                );
            }
        });

        return $summary;
    }

    private function importSettings(array $settings): void
    {
        $mapping = [
            'institution' => 'institution',
            'defaultLecturer' => 'default_lecturer',
            'defaultPassThreshold' => 'default_pass_threshold',
            'trendDropThreshold' => 'trend_drop_threshold',
            'siakadHeaders' => 'siakad_headers',
        ];

        $values = [];
        foreach ($mapping as $legacyKey => $dbKey) {
            if (array_key_exists($legacyKey, $settings)) {
                $values[$dbKey] = (string) $settings[$legacyKey];
            }
        }

        if ($values !== []) {
            $this->repository->saveSettings($values);
        }
    }

    private function importPrograms(array $programs, array &$summary): array
    {
        $map = [];

        foreach ($programs as $program) {
            if (!is_array($program)) {
                continue;
            }

            $code = trim((string) ($program['code'] ?? ''));
            $name = trim((string) ($program['name'] ?? ''));
            if ($name === '') {
                continue;
            }

            $stmt = $this->pdo->prepare(
                'SELECT id FROM programs
                 WHERE (code <> "" AND code = :code) OR name = :name
                 LIMIT 1'
            );
            $stmt->execute(['code' => $code, 'name' => $name]);
            $id = (int) ($stmt->fetchColumn() ?: 0);

            $payload = [
                'code' => $code,
                'name' => $name,
                'faculty' => trim((string) ($program['faculty'] ?? '')),
            ];

            $id = $this->repository->saveProgram($payload, $id > 0 ? $id : null);
            $legacyId = (string) ($program['id'] ?? $id);
            $map[$legacyId] = $id;
            $summary['programs']++;
        }

        return $map;
    }

    private function importCourses(
        array $courses,
        array $programMap,
        array &$summary
    ): array {
        $map = [];
        $programFallback = (int) ($this->repository->programs()[0]['id'] ?? 0);

        foreach ($courses as $course) {
            if (!is_array($course)) {
                continue;
            }

            $name = trim((string) ($course['name'] ?? ''));
            if ($name === '') {
                continue;
            }

            $programId = $programMap[(string) ($course['programId'] ?? '')]
                ?? $programFallback;
            if ($programId <= 0) {
                continue;
            }

            $code = trim((string) ($course['code'] ?? ''));
            $stmt = $this->pdo->prepare(
                'SELECT id FROM courses
                 WHERE program_id = :program_id
                   AND ((code <> "" AND code = :code) OR name = :name)
                 LIMIT 1'
            );
            $stmt->execute([
                'program_id' => $programId,
                'code' => $code,
                'name' => $name,
            ]);
            $id = (int) ($stmt->fetchColumn() ?: 0);

            $id = $this->repository->saveCourse(
                [
                    'program_id' => $programId,
                    'code' => $code,
                    'name' => $name,
                    'credits' => max(0, (int) ($course['credits'] ?? 0)),
                ],
                $id > 0 ? $id : null
            );

            $legacyId = (string) ($course['id'] ?? $id);
            $map[$legacyId] = $id;
            $summary['courses']++;
        }

        return $map;
    }

    private function importClasses(
        array $classes,
        array $programMap,
        array $courseMap,
        array &$summary
    ): array {
        $map = [];
        $settings = $this->repository->settings();
        $programFallback = (int) ($this->repository->programs()[0]['id'] ?? 0);
        $courseFallback = (int) ($this->repository->courses()[0]['id'] ?? 0);

        foreach ($classes as $class) {
            if (!is_array($class)) {
                continue;
            }

            $name = trim((string) ($class['name'] ?? ''));
            if ($name === '') {
                continue;
            }

            $programId = $programMap[(string) ($class['programId'] ?? '')]
                ?? $programFallback;
            $courseId = $courseMap[(string) ($class['courseId'] ?? '')]
                ?? $courseFallback;

            if ($programId <= 0 || $courseId <= 0) {
                continue;
            }

            $academicYear = trim((string) ($class['academicYear'] ?? ''));
            $stmt = $this->pdo->prepare(
                'SELECT id FROM classes
                 WHERE name = :name
                   AND course_id = :course_id
                   AND academic_year = :academic_year
                 LIMIT 1'
            );
            $stmt->execute([
                'name' => $name,
                'course_id' => $courseId,
                'academic_year' => $academicYear,
            ]);
            $id = (int) ($stmt->fetchColumn() ?: 0);

            $id = $this->repository->saveClass(
                [
                    'program_id' => $programId,
                    'course_id' => $courseId,
                    'name' => $name,
                    'semester' => trim((string) ($class['semester'] ?? '')),
                    'academic_year' => $academicYear,
                    'target' => max(1, (int) ($class['target'] ?? 30)),
                    'meetings' => max(1, min(32, (int) ($class['meetings'] ?? 16))),
                    'lecturer' => trim((string) (
                        $class['lecturer']
                        ?? $settings['default_lecturer']
                        ?? 'Dashboard monitoring dosen'
                    )),
                    'pass_threshold' => max(
                        0,
                        min(
                            100,
                            (float) (
                                $class['passThreshold']
                                ?? $settings['default_pass_threshold']
                                ?? 60
                            )
                        )
                    ),
                ],
                $id > 0 ? $id : null
            );

            $legacyId = (string) ($class['id'] ?? $id);
            $map[$legacyId] = $id;
            $summary['classes']++;
        }

        return $map;
    }

    private function importClassData(
        int $classId,
        array $legacyData,
        ?int $userId,
        array &$summary
    ): void {
        $studentMap = [];

        foreach (($legacyData['students'] ?? []) as $student) {
            if (!is_array($student)) {
                continue;
            }

            $nim = trim((string) ($student['nim'] ?? ''));
            if ($nim === '') {
                continue;
            }

            $existing = $this->repository->enrollmentByNim($classId, $nim);
            $payload = [
                'nim' => $nim,
                'name' => trim((string) ($student['name'] ?? '')),
                'email' => trim((string) ($student['email'] ?? '')),
                'phone' => trim((string) ($student['phone'] ?? '')),
                'registration_status' => trim((string) (
                    $student['registrationStatus'] ?? $student['status'] ?? 'Aktif'
                )),
                'payment_status' => trim((string) (
                    $student['paymentStatus'] ?? $student['payment'] ?? 'Lunas'
                )),
                'gpa' => ($student['gpa'] ?? '') === '' ? null : (float) $student['gpa'],
                'target_gpa' => ($student['targetGpa'] ?? '') === ''
                    ? null
                    : (float) $student['targetGpa'],
                'pc' => trim((string) ($student['pc'] ?? '')),
                'github_url' => valid_resource_url(
                    $student['github'] ?? $student['links']['github'] ?? null,
                    'github'
                ),
                'colab_url' => valid_resource_url(
                    $student['colab'] ?? $student['links']['colab'] ?? null,
                    'colab'
                ),
                'drive_url' => valid_resource_url(
                    $student['drive'] ?? $student['links']['drive'] ?? null,
                    'drive'
                ),
                'note' => trim((string) ($student['note'] ?? '')),
            ];

            try {
                $enrollmentId = $this->repository->saveStudentEnrollment(
                    $classId,
                    $payload,
                    $existing ? (int) $existing['enrollment_id'] : null
                );
            } catch (PDOException $exception) {
                // PC conflicts in legacy data should not block the rest of the import.
                $payload['pc'] = '';
                $enrollmentId = $this->repository->saveStudentEnrollment(
                    $classId,
                    $payload,
                    $existing ? (int) $existing['enrollment_id'] : null
                );
            }

            $legacyStudentId = (string) ($student['id'] ?? $nim);
            $studentMap[$legacyStudentId] = $enrollmentId;
            $summary['students']++;

            if (!empty($student['special']) && is_array($student['special'])) {
                $special = $student['special'];
                $this->repository->saveSpecialActivity(
                    $classId,
                    $enrollmentId,
                    [
                        'type' => trim((string) ($special['type'] ?? 'KKN')),
                        'status' => trim((string) ($special['status'] ?? 'Belum Mengikuti')),
                        'location' => trim((string) ($special['location'] ?? '')),
                        'supervisor' => trim((string) ($special['supervisor'] ?? '')),
                        'progress' => max(0, min(100, (int) ($special['progress'] ?? 0))),
                        'note' => trim((string) ($special['note'] ?? '')),
                    ]
                );
            }
        }

        $taskMap = [];
        $order = 10;

        foreach (($legacyData['tasks'] ?? []) as $task) {
            if (!is_array($task)) {
                continue;
            }

            $name = trim((string) ($task['name'] ?? 'Komponen Penilaian'));
            $find = $this->pdo->prepare(
                'SELECT id FROM tasks
                 WHERE class_id = :class_id AND name = :name LIMIT 1'
            );
            $find->execute(['class_id' => $classId, 'name' => $name]);
            $taskId = (int) ($find->fetchColumn() ?: 0);

            $taskId = $this->repository->saveTask(
                $classId,
                [
                    'name' => $name,
                    'type' => trim((string) ($task['type'] ?? 'Tugas Harian')),
                    'weight' => max(0, min(100, (float) ($task['weight'] ?? 0))),
                    'max_score' => max(1, (float) ($task['maxScore'] ?? 100)),
                    'meeting' => max(0, min(32, (int) ($task['meeting'] ?? 0))) ?: null,
                    'due_date' => trim((string) ($task['due'] ?? '')) ?: null,
                    'description' => trim((string) ($task['description'] ?? '')),
                    'sort_order' => $order,
                ],
                $taskId > 0 ? $taskId : null
            );

            $taskMap[(string) ($task['id'] ?? $taskId)] = $taskId;
            $summary['tasks']++;
            $order += 10;
        }

        $attendancePayload = [];
        foreach (($legacyData['attendance'] ?? []) as $meetingKey => $statuses) {
            if (!is_array($statuses)) {
                continue;
            }

            if (preg_match('/(\d+)/', (string) $meetingKey, $match) !== 1) {
                continue;
            }

            $meeting = (int) $match[1];
            $mapped = [];
            foreach ($statuses as $legacyStudentId => $status) {
                $enrollmentId = $studentMap[(string) $legacyStudentId] ?? null;
                if ($enrollmentId && in_array($status, ['H', 'I', 'S', 'A'], true)) {
                    $mapped[$enrollmentId] = $status;
                    $summary['attendance']++;
                }
            }
            if ($mapped !== []) {
                $this->repository->saveAttendance($classId, $meeting, $mapped);
            }
        }

        foreach (($legacyData['taskRecords'] ?? []) as $legacyTaskId => $records) {
            $taskId = $taskMap[(string) $legacyTaskId] ?? null;
            if (!$taskId || !is_array($records)) {
                continue;
            }

            $mapped = [];
            foreach ($records as $legacyStudentId => $record) {
                $enrollmentId = $studentMap[(string) $legacyStudentId] ?? null;
                if (!$enrollmentId || !is_array($record)) {
                    continue;
                }

                $mapped[$enrollmentId] = [
                    'status' => $record['status'] ?? 'pending',
                    'score' => $record['score'] ?? '',
                    'note' => $record['note'] ?? '',
                    'github_url' => $record['github'] ?? null,
                    'colab_url' => $record['colab'] ?? null,
                    'drive_url' => $record['drive'] ?? null,
                ];
                $summary['task_records']++;
            }

            if ($mapped !== []) {
                $this->repository->saveTaskRecords($classId, $taskId, $mapped);
            }
        }

        foreach (($legacyData['events'] ?? []) as $event) {
            if (!is_array($event) || trim((string) ($event['title'] ?? '')) === '') {
                continue;
            }

            $eventDate = trim((string) ($event['date'] ?? ''));
            if ($eventDate === '') {
                continue;
            }

            $find = $this->pdo->prepare(
                'SELECT id FROM events
                 WHERE class_id = :class_id AND title = :title AND event_date = :event_date
                 LIMIT 1'
            );
            $find->execute([
                'class_id' => $classId,
                'title' => trim((string) $event['title']),
                'event_date' => $eventDate,
            ]);
            $eventId = (int) ($find->fetchColumn() ?: 0);

            $this->repository->saveEvent(
                $classId,
                [
                    'title' => trim((string) $event['title']),
                    'type' => trim((string) ($event['type'] ?? 'Kegiatan')),
                    'event_date' => $eventDate,
                    'event_time' => trim((string) ($event['time'] ?? '')) ?: null,
                    'location' => trim((string) ($event['location'] ?? '')),
                    'description' => trim((string) ($event['description'] ?? '')),
                ],
                $eventId > 0 ? $eventId : null
            );
            $summary['events']++;
        }

        foreach (($legacyData['logs'] ?? []) as $log) {
            if (!is_array($log)) {
                continue;
            }
            $this->repository->log(
                $classId,
                $userId,
                trim((string) ($log['type'] ?? 'Sistem')),
                trim((string) ($log['text'] ?? 'Import log dashboard lama.'))
            );
        }

        $this->repository->log(
            $classId,
            $userId,
            'Sistem',
            'Data dashboard HTML/JSON lama berhasil dimigrasikan ke database.'
        );
    }
}
