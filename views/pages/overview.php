<?php
$attendanceCounts = $analyticsService->attendanceCounts(
    $students,
    $analytics['attendance_map'],
    $meeting
);
$filledAttendance = $attendanceCounts['H'] + $attendanceCounts['I'] + $attendanceCounts['S'] + $attendanceCounts['A'];
$attendanceFilledPercent = count($students) > 0
    ? (int) round(($filledAttendance / count($students)) * 100)
    : 0;

$taskCompletionAverage = count($students) > 0
    ? (int) round(
        array_sum(array_map(
            static fn (array $student): int => (int) $analytics['students'][(int) $student['enrollment_id']]['task_completion'],
            $students
        )) / count($students)
    )
    : 0;

$upcoming = [];
foreach ($events as $event) {
    $upcoming[] = [
        'title' => $event['title'],
        'type' => $event['type'],
        'date' => $event['event_date'],
        'time' => $event['event_time'],
        'location' => $event['location'],
        'description' => $event['description'],
    ];
}
foreach ($tasks as $task) {
    if (!empty($task['due_date'])) {
        $upcoming[] = [
            'title' => 'Deadline: ' . $task['name'],
            'type' => 'Deadline',
            'date' => $task['due_date'],
            'time' => null,
            'location' => '',
            'description' => $task['description'],
        ];
    }
}
usort(
    $upcoming,
    static fn (array $a, array $b): int =>
        strcmp((string) $a['date'] . (string) $a['time'], (string) $b['date'] . (string) $b['time'])
);
$today = date('Y-m-d');
$upcoming = array_values(array_filter(
    $upcoming,
    static fn (array $event): bool => (string) $event['date'] >= $today
));
$upcoming = array_slice($upcoming, 0, 5);

$riskStudents = [];
foreach ($students as $student) {
    $risk = $analytics['students'][(int) $student['enrollment_id']]['risk_reasons'];
    if ($risk !== []) {
        $riskStudents[] = ['student' => $student, 'reasons' => $risk];
    }
}
usort(
    $riskStudents,
    static fn (array $a, array $b): int => count($b['reasons']) <=> count($a['reasons'])
);
$riskStudents = array_slice($riskStudents, 0, 8);

$health = $analytics['data_health'];
?>
<section class="page active">
    <div class="page-hero">
        <div>
            <h3><?= e($classContext['name']) ?> — <?= e($classContext['course_name']) ?></h3>
            <p>
                Pusat monitoring akademik: kehadiran, nilai, tugas, prediksi kelulusan,
                deadline, KKN/MBKM, dan tindak lanjut mahasiswa.
            </p>
            <div class="hero-meta">
                <span class="hero-pill">🎓 <?= e($classContext['program_name']) ?></span>
                <span class="hero-pill">📚 <?= e(trim($classContext['course_code'] . ' • ' . $classContext['course_name'], ' •')) ?></span>
                <span class="hero-pill">🗓 <?= e($classContext['semester']) ?> • <?= e($classContext['academic_year']) ?></span>
                <span class="hero-pill">👨‍🏫 <?= e($classContext['lecturer']) ?></span>
            </div>
        </div>

        <div class="actions">
            <a class="btn" href="<?= e(app_url('export.php?type=backup&class_id=' . (int) $classContext['id'])) ?>">↧ Backup</a>
            <a class="btn" href="<?= e(app_url('export.php?type=siakad&class_id=' . (int) $classContext['id'])) ?>">↧ SIAKAD</a>
            <a class="btn primary" href="<?= e(app_url('dashboard.php?page=attendance&class_id=' . (int) $classContext['id'] . '&meeting=' . $meeting)) ?>">✓ Isi Presensi</a>
        </div>
    </div>

    <div class="notice">
        Kelas aktif memiliki <strong><?= count($students) ?></strong> mahasiswa.
        Ambang lulus prediksi: <strong><?= e($classContext['pass_threshold']) ?>%</strong>.
        <?php if ((float) $analytics['total_weight'] === 100.0): ?>
            Bobot komponen penilaian sudah 100%.
        <?php else: ?>
            <strong>Perhatian:</strong> total bobot penilaian saat ini
            <?= e(number_format((float) $analytics['total_weight'], 2)) ?>%, idealnya 100%.
        <?php endif; ?>
    </div>

    <div class="grid kpis">
        <div class="card kpi info">
            <div class="label">Mahasiswa</div>
            <div class="value"><?= count($students) ?></div>
            <div class="sub">
                <?= (int) round((count($students) / max(1, (int) $classContext['target'])) * 100) ?>%
                dari target <?= (int) $classContext['target'] ?>
            </div>
        </div>

        <div class="card kpi ok">
            <div class="label">Hadir Pertemuan Ini</div>
            <div class="value"><?= (int) $attendanceCounts['H'] ?></div>
            <div class="sub">
                <?= $filledAttendance > 0
                    ? (int) round(($attendanceCounts['H'] / $filledAttendance) * 100) . '% dari presensi terisi'
                    : 'belum diisi' ?>
            </div>
        </div>

        <div class="card kpi info">
            <div class="label">Rata-rata Nilai</div>
            <div class="value">
                <?= $analytics['average_estimated'] === null
                    ? '—'
                    : e(number_format((float) $analytics['average_estimated'], 1)) ?>
            </div>
            <div class="sub">nilai akhir estimasi saat ini</div>
        </div>

        <div class="card kpi warn">
            <div class="label">Tugas Tuntas</div>
            <div class="value"><?= $taskCompletionAverage ?>%</div>
            <div class="sub">rata-rata pengumpulan</div>
        </div>

        <div class="card kpi danger">
            <div class="label">Berisiko</div>
            <div class="value"><?= (int) $analytics['risk_count'] ?></div>
            <div class="sub">akademik / presensi / administrasi</div>
        </div>

        <div class="card kpi">
            <div class="label">Bobot Nilai</div>
            <div class="value"><?= e(number_format((float) $analytics['total_weight'], 0)) ?>%</div>
            <div class="sub"><?= (float) $analytics['total_weight'] === 100.0 ? 'komposisi lengkap' : 'perlu penyesuaian' ?></div>
        </div>
    </div>

    <div class="grid overview-grid">
        <div class="card section-card">
            <div class="section-title">
                <h4>Presensi Pertemuan Aktif</h4>
                <span>Pertemuan <?= $meeting ?></span>
            </div>

            <form method="get" class="toolbar" style="margin-bottom:12px">
                <input type="hidden" name="page" value="overview">
                <input type="hidden" name="class_id" value="<?= (int) $classContext['id'] ?>">
                <select name="meeting" data-auto-submit>
                    <?php for ($index = 1; $index <= (int) $classContext['meetings']; $index++): ?>
                        <option value="<?= $index ?>" <?= selected($meeting, $index) ?>>Pertemuan <?= $index ?></option>
                    <?php endfor; ?>
                </select>
            </form>

            <div class="chart-wrap">
                <div
                    class="donut"
                    style="background:conic-gradient(var(--brand) <?= $attendanceFilledPercent * 3.6 ?>deg,#e8eef2 0deg)"
                >
                    <div class="donut-center">
                        <div><?= $attendanceFilledPercent ?>%<span>terisi</span></div>
                    </div>
                </div>

                <div class="legend">
                    <div class="legend-row"><span><i class="dot h"></i>Hadir</span><strong><?= $attendanceCounts['H'] ?></strong></div>
                    <div class="legend-row"><span><i class="dot i"></i>Izin</span><strong><?= $attendanceCounts['I'] ?></strong></div>
                    <div class="legend-row"><span><i class="dot s"></i>Sakit</span><strong><?= $attendanceCounts['S'] ?></strong></div>
                    <div class="legend-row"><span><i class="dot a"></i>Alpa</span><strong><?= $attendanceCounts['A'] ?></strong></div>
                </div>
            </div>
        </div>

        <div class="card section-card">
            <div class="section-title">
                <h4>Tren Pemahaman Kelas</h4>
                <span>rata-rata nilai per komponen</span>
            </div>

            <?php
            $trendPoints = array_values(array_filter(
                $analytics['trend']['points'],
                static fn (array $point): bool => $point['average'] !== null
            ));
            ?>
            <?php if ($trendPoints === []): ?>
                <div class="empty-state">Belum ada nilai untuk membentuk tren.</div>
            <?php else: ?>
                <?php foreach (array_slice($trendPoints, -6) as $point): ?>
                    <div class="progress-row">
                        <div class="progress-head">
                            <span><?= e($point['task']['name']) ?></span>
                            <strong><?= e(number_format((float) $point['average'], 1)) ?></strong>
                        </div>
                        <div class="bar"><div style="width:<?= max(0, min(100, (float) $point['average'])) ?>%"></div></div>
                    </div>
                <?php endforeach; ?>

                <?php if ($analytics['trend']['worst_drop']): ?>
                    <div class="notice danger-note" style="margin:12px 0 0">
                        Turun
                        <strong><?= e(number_format((float) $analytics['trend']['worst_drop']['drop'], 1)) ?> poin</strong>
                        pada
                        <strong><?= e($analytics['trend']['worst_drop']['to']['task']['name']) ?></strong>.
                        Pertimbangkan mengulang / mengevaluasi materi terkait.
                    </div>
                <?php endif; ?>
            <?php endif; ?>
        </div>

        <div class="card section-card">
            <div class="section-title">
                <h4>Deadline & Agenda Terdekat</h4>
                <a class="btn small" href="<?= e(app_url('dashboard.php?page=calendar&class_id=' . (int) $classContext['id'])) ?>">Kalender</a>
            </div>

            <div class="event-list">
                <?php if ($upcoming === []): ?>
                    <div class="empty-state">Belum ada agenda mendatang.</div>
                <?php else: ?>
                    <?php foreach ($upcoming as $event): ?>
                        <div class="event-item <?= $event['type'] === 'Ujian' ? 'exam' : ($event['type'] === 'Deadline' ? 'deadline' : '') ?>">
                            <div class="event-date">
                                <?= e(date('d/m/Y', strtotime((string) $event['date']))) ?>
                                <?= $event['time'] ? ' • ' . e(substr((string) $event['time'], 0, 5)) : '' ?>
                            </div>
                            <div class="event-title"><?= e($event['title']) ?></div>
                            <div class="event-meta">
                                <?= e($event['type']) ?>
                                <?= $event['location'] ? ' • ' . e($event['location']) : '' ?>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <div class="grid" style="grid-template-columns:1.15fr .85fr;margin-top:16px">
        <div class="card section-card">
            <div class="section-title">
                <h4>Mahasiswa yang Perlu Ditindaklanjuti</h4>
                <span>prioritas otomatis</span>
            </div>

            <div class="risk-list">
                <?php if ($riskStudents === []): ?>
                    <div class="empty-state">Tidak ada mahasiswa pada kategori perhatian.</div>
                <?php else: ?>
                    <?php foreach ($riskStudents as $riskItem): ?>
                        <?php $student = $riskItem['student']; ?>
                        <div class="risk-item">
                            <span>
                                <strong><?= e(display_name($student)) ?></strong><br>
                                <small><?= e($student['nim']) ?> • <?= e(implode(', ', $riskItem['reasons'])) ?></small>
                            </span>
                            <a
                                class="btn small"
                                href="<?= e(app_url('dashboard.php?page=students&class_id=' . (int) $classContext['id'] . '&edit_student=' . (int) $student['enrollment_id'])) ?>"
                            >Buka</a>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </div>

        <div class="card section-card">
            <div class="section-title">
                <h4>Kualitas Data</h4>
                <span><?= (int) $health['completeness'] ?>% lengkap</span>
            </div>

            <div class="health-grid">
                <div class="health-item <?= $health['names_missing'] ? 'warn' : 'good' ?>">
                    <div class="t">Nama belum diisi</div><div class="n"><?= (int) $health['names_missing'] ?></div>
                </div>
                <div class="health-item <?= $health['academic_missing'] ? 'warn' : 'good' ?>">
                    <div class="t">IPK / target kosong</div><div class="n"><?= (int) $health['academic_missing'] ?></div>
                </div>
                <div class="health-item <?= $health['contacts_missing'] ? 'warn' : 'good' ?>">
                    <div class="t">Kontak kosong</div><div class="n"><?= (int) $health['contacts_missing'] ?></div>
                </div>
                <div class="health-item <?= $health['pc_missing'] ? 'warn' : 'good' ?>">
                    <div class="t">PC belum ditetapkan</div><div class="n"><?= (int) $health['pc_missing'] ?></div>
                </div>
                <div class="health-item <?= $health['resource_missing'] ? 'warn' : 'good' ?>">
                    <div class="t">Link GitHub/Colab/Drive kosong</div><div class="n"><?= (int) $health['resource_missing'] ?></div>
                </div>
            </div>
        </div>
    </div>
</section>
