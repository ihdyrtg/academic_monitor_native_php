<?php
$attendanceCounts = $analyticsService->attendanceCounts(
    $students,
    $analytics['attendance_map'],
    $meeting
);
?>
<section class="page active">
    <div class="page-head">
        <div>
            <h3>Presensi Perkuliahan</h3>
            <p>Rekap Hadir, Izin, Sakit, dan Alpa untuk seluruh pertemuan kelas aktif.</p>
        </div>

        <div class="actions">
            <a
                class="btn"
                href="<?= e(app_url('export.php?type=attendance&class_id=' . $classId)) ?>"
            >↧ Rekap CSV</a>

            <form method="post" action="<?= e(app_url('action.php')) ?>">
                <?= Csrf::field() ?>
                <input type="hidden" name="action" value="attendance.mark_all">
                <input type="hidden" name="class_id" value="<?= (int) $classId ?>">
                <input type="hidden" name="meeting" value="<?= (int) $meeting ?>">
                <input
                    type="hidden"
                    name="return_to"
                    value="dashboard.php?page=attendance&class_id=<?= (int) $classId ?>&meeting=<?= (int) $meeting ?>"
                >
                <button
                    class="btn primary"
                    type="submit"
                    data-confirm="Tandai semua mahasiswa Hadir pada Pertemuan <?= (int) $meeting ?>?"
                >✓ Semua Hadir</button>
            </form>
        </div>
    </div>

    <div class="card section-card" style="margin-bottom:14px">
        <div class="form-grid">
            <div class="field">
                <label>Pertemuan</label>
                <form method="get">
                    <input type="hidden" name="page" value="attendance">
                    <input type="hidden" name="class_id" value="<?= (int) $classId ?>">
                    <select name="meeting" data-auto-submit>
                        <?php for ($index = 1; $index <= (int) $classContext['meetings']; $index++): ?>
                            <option value="<?= $index ?>" <?= selected($meeting, $index) ?>>
                                Pertemuan <?= $index ?>
                            </option>
                        <?php endfor; ?>
                    </select>
                </form>
            </div>

            <div class="field">
                <label>Pencarian</label>
                <input id="attendanceSearch" type="search" placeholder="Cari NIM / nama" autocomplete="off">
            </div>
        </div>

        <div id="attendanceSummary" class="attendance-filter-bar">
            <button
                type="button"
                class="attendance-filter-button all active"
                data-attendance-filter="all"
                aria-pressed="true"
                title="Tampilkan seluruh mahasiswa"
            >Semua <strong data-attendance-count="all"><?= count($students) ?></strong></button>

            <button
                type="button"
                class="attendance-filter-button ok"
                data-attendance-filter="H"
                aria-pressed="false"
                title="Tampilkan mahasiswa berstatus Hadir"
            >Hadir <strong data-attendance-count="H"><?= (int) $attendanceCounts['H'] ?></strong></button>

            <button
                type="button"
                class="attendance-filter-button info"
                data-attendance-filter="I"
                aria-pressed="false"
                title="Tampilkan mahasiswa berstatus Izin"
            >Izin <strong data-attendance-count="I"><?= (int) $attendanceCounts['I'] ?></strong></button>

            <button
                type="button"
                class="attendance-filter-button warn"
                data-attendance-filter="S"
                aria-pressed="false"
                title="Tampilkan mahasiswa berstatus Sakit"
            >Sakit <strong data-attendance-count="S"><?= (int) $attendanceCounts['S'] ?></strong></button>

            <button
                type="button"
                class="attendance-filter-button danger"
                data-attendance-filter="A"
                aria-pressed="false"
                title="Tampilkan mahasiswa berstatus Alpa"
            >Alpa <strong data-attendance-count="A"><?= (int) $attendanceCounts['A'] ?></strong></button>

            <button
                type="button"
                class="attendance-filter-button neutral"
                data-attendance-filter="blank"
                aria-pressed="false"
                title="Tampilkan mahasiswa yang belum diisi presensinya"
            >Belum <strong data-attendance-count="blank"><?= (int) $attendanceCounts['blank'] ?></strong></button>
        </div>
    </div>

    <form
        method="post"
        action="<?= e(app_url('action.php')) ?>"
        id="attendanceForm"
    >
        <?= Csrf::field() ?>
        <input type="hidden" name="action" value="attendance.save">
        <input type="hidden" name="class_id" value="<?= (int) $classId ?>">
        <input type="hidden" name="meeting" value="<?= (int) $meeting ?>">
        <input
            type="hidden"
            name="return_to"
            value="dashboard.php?page=attendance&class_id=<?= (int) $classId ?>&meeting=<?= (int) $meeting ?>"
        >

        <div class="attendance-grid">
            <?php foreach ($students as $student): ?>
                <?php
                $enrollmentId = (int) $student['enrollment_id'];
                $status = $analytics['attendance_map'][$enrollmentId][$meeting] ?? '';
                $searchText = strtolower(trim($student['nim'] . ' ' . $student['name']));
                ?>
                <div
                    class="att-card"
                    data-attendance-card
                    data-search="<?= e($searchText) ?>"
                >
                    <div class="att-head">
                        <div class="avatar">
                            <?= e(initials((string) $student['name'], (string) $student['nim'])) ?>
                        </div>
                        <div>
                            <div class="att-name"><?= e(display_name($student)) ?></div>
                            <div class="att-nim">
                                <?= e($student['nim']) ?>
                                • <?= e($student['pc'] ?: 'Tanpa PC') ?>
                            </div>
                        </div>
                    </div>

                    <input
                        type="hidden"
                        class="attendance-status-input"
                        name="statuses[<?= $enrollmentId ?>]"
                        value="<?= e($status) ?>"
                    >

                    <div class="att-buttons">
                        <?php foreach ([
                            'H' => ['Hadir', 'h'],
                            'I' => ['Izin', 'i'],
                            'S' => ['Sakit', 's'],
                            'A' => ['Alpa', 'a'],
                        ] as $value => [$label, $className]): ?>
                            <button
                                type="button"
                                class="attendance-status-button <?= e($className) ?><?= $status === $value ? ' active' : '' ?>"
                                data-attendance-status="<?= e($value) ?>"
                                aria-pressed="<?= $status === $value ? 'true' : 'false' ?>"
                            ><?= e($label) ?></button>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <div class="form-actions" style="position:sticky;bottom:14px;z-index:20">
            <button class="btn primary" type="submit">
                Simpan Presensi Pertemuan <?= (int) $meeting ?>
            </button>
        </div>
    </form>
</section>
