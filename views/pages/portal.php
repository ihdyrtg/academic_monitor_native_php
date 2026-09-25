<?php
$portalStudent = null;

if (($user['role'] ?? '') === 'mahasiswa') {
    $portalStudent = $repository->enrollmentForStudent(
        $classId,
        (int) ($user['student_id'] ?? 0)
    );
} else {
    $portalNim = trim((string) ($_GET['nim'] ?? ''));
    if ($portalNim !== '') {
        $portalStudent = $repository->enrollmentByNim($classId, $portalNim);
    }
}
?>
<section class="page active">
    <div class="portal-shell">
        <div class="page-head">
            <div>
                <h3>Dashboard Terbatas Mahasiswa</h3>
                <p>
                    Menampilkan hanya data mahasiswa terkait pada kelas aktif:
                    profil, link pekerjaan, presensi, tugas, nilai, dan evaluasi dosen.
                </p>
            </div>
        </div>

        <?php if (($user['role'] ?? '') !== 'mahasiswa'): ?>
            <div class="notice warning">
                Untuk dosen/admin, masukkan NIM untuk melihat simulasi portal mahasiswa.
                Akun mahasiswa yang sebenarnya tetap dibatasi melalui role dan relasi akun ke NIM.
            </div>

            <div class="card portal-login" style="margin-bottom:16px">
                <form method="get">
                    <input type="hidden" name="page" value="portal">
                    <input type="hidden" name="class_id" value="<?= $classId ?>">

                    <div class="form-grid">
                        <div class="field full">
                            <label>NIM</label>
                            <input
                                name="nim"
                                placeholder="Masukkan NIM"
                                value="<?= e($_GET['nim'] ?? '') ?>"
                                required
                            >
                        </div>
                    </div>

                    <div class="actions" style="margin-top:12px">
                        <button class="btn primary" type="submit">Buka Dashboard Saya</button>
                    </div>
                </form>
            </div>
        <?php endif; ?>

        <?php if (($user['role'] ?? '') === 'mahasiswa' && !$portalStudent): ?>
            <div class="alert warning">
                Akun mahasiswa ini belum terhubung ke data mahasiswa pada kelas aktif.
                Hubungi administrator.
            </div>
        <?php elseif (($user['role'] ?? '') !== 'mahasiswa' && isset($_GET['nim']) && !$portalStudent): ?>
            <div class="alert warning">NIM tidak ditemukan pada kelas aktif.</div>
        <?php endif; ?>

        <?php if ($portalStudent): ?>
            <?php
            $enrollmentId = (int) $portalStudent['enrollment_id'];
            $studentAnalytics = $analytics['students'][$enrollmentId];
            $prediction = $studentAnalytics['prediction'];
            ?>

            <div class="portal-profile">
                <div class="card profile-card">
                    <div class="section-title">
                        <h4>Profil Saya</h4>
                        <span><?= e($classContext['name']) ?></span>
                    </div>

                    <dl class="profile-kv">
                        <dt>Link Pekerjaan</dt>
                        <dd><?= resource_links($portalStudent) ?></dd>

                        <dt>Nama</dt>
                        <dd><?= e(display_name($portalStudent)) ?></dd>

                        <dt>NIM</dt>
                        <dd><?= e($portalStudent['nim']) ?></dd>

                        <dt>Status</dt>
                        <dd><?= e($portalStudent['registration_status']) ?></dd>

                        <dt>Pembayaran</dt>
                        <dd><?= e($portalStudent['payment_status']) ?></dd>

                        <dt>IPK</dt>
                        <dd>
                            <?= $portalStudent['gpa'] === null
                                ? '—'
                                : e(number_format((float) $portalStudent['gpa'], 2)) ?>
                        </dd>

                        <dt>Target IPK</dt>
                        <dd>
                            <?= $portalStudent['target_gpa'] === null
                                ? '—'
                                : e(number_format((float) $portalStudent['target_gpa'], 2)) ?>
                        </dd>

                        <dt>Posisi Duduk</dt>
                        <dd><?= e($portalStudent['pc'] ?: 'Belum dijadwalkan') ?></dd>

                        <dt>Catatan Dosen</dt>
                        <dd><?= e($portalStudent['note'] ?: '—') ?></dd>
                    </dl>
                </div>

                <div class="card profile-card">
                    <div class="section-title">
                        <h4>Ringkasan Akademik</h4>
                        <span><?= e($classContext['course_name']) ?></span>
                    </div>

                    <div class="metric-list">
                        <div class="metric-row">
                            <span>Kehadiran</span>
                            <strong>
                                <?= $studentAnalytics['attendance_rate'] === null
                                    ? 'Belum ada'
                                    : (int) $studentAnalytics['attendance_rate'] . '%' ?>
                            </strong>
                        </div>

                        <div class="metric-row">
                            <span>Estimasi Nilai Akhir</span>
                            <strong>
                                <?= e(number_format((float) $prediction['estimated'], 1)) ?>
                                (<?= e($analyticsService->gradeLetter((float) $prediction['estimated'])) ?>)
                            </strong>
                        </div>

                        <div class="metric-row">
                            <span>Prediksi Kelulusan</span>
                            <strong><?= e($prediction['status']) ?></strong>
                        </div>

                        <div class="metric-row">
                            <span>Nilai minimal pada sisa bobot</span>
                            <strong>
                                <?php if ($prediction['needed'] === null): ?>
                                    —
                                <?php elseif ($prediction['needed'] > 100): ?>
                                    &gt;100%
                                <?php else: ?>
                                    <?= e(number_format(max(0, (float) $prediction['needed']), 1)) ?>%
                                <?php endif; ?>
                            </strong>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card table-card" style="margin-top:16px">
                <div class="table-tools"><strong>Presensi Saya</strong></div>

                <div class="table-wrap" style="max-height:300px">
                    <table style="min-width:700px">
                        <thead>
                        <tr>
                            <?php for ($index = 1; $index <= (int) $classContext['meetings']; $index++): ?>
                                <th>P<?= $index ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <?php for ($index = 1; $index <= (int) $classContext['meetings']; $index++): ?>
                                <?php
                                $status = $analytics['attendance_map'][$enrollmentId][$index] ?? null;
                                $statusLabel = match ($status) {
                                    'H' => 'Hadir',
                                    'I' => 'Izin',
                                    'S' => 'Sakit',
                                    'A' => 'Alpa',
                                    default => 'Belum',
                                };
                                ?>
                                <td><?= e($statusLabel) ?></td>
                            <?php endfor; ?>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="card table-card" style="margin-top:16px">
                <div class="table-tools">
                    <strong>Tugas & Nilai Saya</strong>
                    <span class="small muted">Predikat dan detail mengikuti rubrik penilaian dosen.</span>
                </div>

                <?php $practicumRubric = $analyticsService->practicumRubric(); ?>

                <div class="table-wrap">
                    <table class="student-rubric-table admin-student-rubric-table">
                        <thead>
                        <tr>
                            <th>Komponen</th>
                            <th>Bobot</th>
                            <th>Link</th>
                            <th>Status</th>
                            <th>Nilai</th>
                            <th>Predikat</th>
                            <th>Detail</th>
                            <th>Catatan Dosen</th>
                        </tr>
                        </thead>

                        <tbody>
                        <?php if ($tasks === []): ?>
                            <tr>
                                <td colspan="8" class="empty-state">Belum ada komponen penilaian.</td>
                            </tr>
                        <?php else: ?>
                            <?php foreach ($tasks as $task): ?>
                                <?php
                                $record = $analytics['task_records_map'][(int) $task['id']][$enrollmentId] ?? [
                                    'status' => 'pending',
                                    'score' => null,
                                    'note' => '',
                                    'github_url' => null,
                                    'colab_url' => null,
                                    'drive_url' => null,
                                ];
                                $resources = [
                                    'github_url' => $record['github_url'] ?: $portalStudent['github_url'],
                                    'colab_url' => $record['colab_url'] ?: $portalStudent['colab_url'],
                                    'drive_url' => $record['drive_url'] ?: $portalStudent['drive_url'],
                                ];

                                $recordStatus = strtolower(trim((string) ($record['status'] ?? 'pending')));
                                $statusLabel = match ($recordStatus) {
                                    'submitted' => 'Dikumpulkan',
                                    'graded' => 'Dinilai',
                                    'late' => 'Terlambat',
                                    default => 'Belum',
                                };
                                $statusTone = match ($recordStatus) {
                                    'submitted' => 'info',
                                    'graded' => 'ok',
                                    'late' => 'danger',
                                    default => 'neutral',
                                };

                                $score = $record['score'] ?? null;
                                $maxScore = isset($task['max_score']) && (float) $task['max_score'] > 0
                                    ? (float) $task['max_score']
                                    : 100.0;
                                $assessment = $score === null || $score === ''
                                    ? null
                                    : $analyticsService->practicumAssessment((float) $score, $maxScore);
                                $teacherNote = trim((string) ($record['note'] ?? ''));
                                ?>
                                <tr>
                                    <td><strong><?= e($task['name']) ?></strong></td>
                                    <td><?= e(number_format((float) $task['weight'], 2)) ?>%</td>
                                    <td><?= resource_links($resources, true) ?></td>
                                    <td>
                                        <span class="badge <?= e($statusTone) ?>"><?= e($statusLabel) ?></span>
                                    </td>
                                    <td>
                                        <?= !$assessment
                                            ? '—'
                                            : e(number_format((float) $score, 2)) . '/' . e(number_format($maxScore, 2)) ?>
                                    </td>
                                    <td>
                                        <?php if (!$assessment): ?>
                                            <span class="rubric-badge rubric-empty">—</span>
                                        <?php else: ?>
                                            <span class="rubric-badge rubric-<?= e($assessment['tone']) ?>">
                                                <?= e($assessment['icon'] . ' ' . $assessment['predicate']) ?>
                                            </span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?php if (!$assessment): ?>
                                            —
                                        <?php else: ?>
                                            <?php
                                            $assessmentPopoverId = 'assessment-popover-'
                                                . (int) $task['id']
                                                . '-'
                                                . $enrollmentId;
                                            ?>

                                            <button
                                                type="button"
                                                class="btn small assessment-trigger"
                                                popovertarget="<?= e($assessmentPopoverId) ?>"
                                                aria-haspopup="dialog"
                                            >
                                                Lihat Penilaian
                                            </button>

                                            <div
                                                id="<?= e($assessmentPopoverId) ?>"
                                                class="assessment-popover"
                                                popover="auto"
                                                role="dialog"
                                                aria-label="Detail penilaian <?= e($task['name']) ?>"
                                            >
                                                <div class="assessment-popover-inner">
                                                    <div class="assessment-popover-head">
                                                        <div>
                                                            <span class="assessment-popover-kicker">Detail Penilaian</span>
                                                            <h3><?= e($task['name']) ?></h3>
                                                        </div>

                                                        <button
                                                            type="button"
                                                            class="assessment-popover-close"
                                                            popovertarget="<?= e($assessmentPopoverId) ?>"
                                                            popovertargetaction="hide"
                                                            aria-label="Tutup detail penilaian"
                                                        >
                                                            &times;
                                                        </button>
                                                    </div>

                                                    <div class="assessment-score-panel">
                                                        <div>
                                                            <span>Nilai</span>
                                                            <strong>
                                                                <?= e(number_format((float) $assessment['normalized_score'], 0)) ?>/100
                                                            </strong>
                                                        </div>
                                                        <span class="rubric-badge rubric-<?= e($assessment['tone']) ?>">
                                                            <?= e($assessment['icon'] . ' ' . $assessment['predicate']) ?>
                                                        </span>
                                                    </div>

                                                    <div class="assessment-section">
                                                        <div class="assessment-section-title">Umpan Balik</div>
                                                        <p class="assessment-description">
                                                            <?= e($assessment['description']) ?>
                                                        </p>
                                                    </div>

                                                    <?php if ($teacherNote !== ''): ?>
                                                        <div class="assessment-section">
                                                            <div class="assessment-section-title">Catatan Dosen</div>
                                                            <div class="rubric-note assessment-teacher-note">
                                                                <?= nl2br(e($teacherNote)) ?>
                                                            </div>
                                                        </div>
                                                    <?php endif; ?>

                                                    <div class="assessment-section">
                                                        <div class="assessment-section-title">Rubrik Praktikum</div>
                                                        <div class="assessment-rubric-list">
                                                            <?php foreach ($practicumRubric as $criterion): ?>
                                                                <div class="rubric-criterion">
                                                                    <span><?= e($criterion['name']) ?></span>
                                                                    <strong><?= (int) $criterion['weight'] ?>%</strong>
                                                                </div>
                                                            <?php endforeach; ?>
                                                        </div>
                                                    </div>

                                                    <p class="rubric-disclaimer assessment-disclaimer">
                                                        Rubrik menjadi acuan dosen saat menetapkan nilai akhir.
                                                    </p>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                    </td>
                                    <td class="student-teacher-note">
                                        <?= $teacherNote !== '' ? nl2br(e($teacherNote)) : '—' ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        <?php endif; ?>
    </div>
</section>
