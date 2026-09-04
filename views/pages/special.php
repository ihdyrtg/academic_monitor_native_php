<?php
$specialByEnrollment = [];
foreach ($specialActivities as $activity) {
    $specialByEnrollment[(int) $activity['enrollment_id']] = $activity;
}
$editSpecialId = filter_input(INPUT_GET, 'edit_special', FILTER_VALIDATE_INT) ?: 0;
$editSpecialStudent = $editSpecialId > 0 ? $repository->enrollment($classId, $editSpecialId) : null;
$editSpecial = $editSpecialStudent
    ? ($specialByEnrollment[$editSpecialId] ?? [
        'type' => 'KKN',
        'status' => 'Belum Mengikuti',
        'location' => '',
        'supervisor' => '',
        'progress' => 0,
        'note' => '',
    ])
    : null;
?>
<section class="page active">
    <div class="page-head">
        <div>
            <h3>Kegiatan KKN / MBKM / Luar Kampus</h3>
            <p>
                Monitor jenis program, lokasi, pembimbing, status, progres,
                dan catatan kegiatan mahasiswa.
            </p>
        </div>
    </div>

    <?php if ($editSpecialStudent && $editSpecial): ?>
        <div class="card panel-form" id="special-form" style="margin-bottom:16px">
            <div class="section-title">
                <h4>Kegiatan <?= e($editSpecialStudent['nim']) ?> — <?= e(display_name($editSpecialStudent)) ?></h4>
                <a
                    class="btn small"
                    href="<?= e(app_url('dashboard.php?page=special&class_id=' . $classId)) ?>"
                >Tutup</a>
            </div>

            <form method="post" action="<?= e(app_url('action.php')) ?>">
                <?= Csrf::field() ?>
                <input type="hidden" name="action" value="special.save">
                <input type="hidden" name="class_id" value="<?= $classId ?>">
                <input type="hidden" name="enrollment_id" value="<?= (int) $editSpecialStudent['enrollment_id'] ?>">
                <input type="hidden" name="return_to" value="dashboard.php?page=special&class_id=<?= $classId ?>">

                <div class="form-grid">
                    <div class="field">
                        <label>Program</label>
                        <select name="type">
                            <?php foreach (['KKN', 'MBKM', 'Magang', 'Studi Independen', 'Pertukaran', 'Lainnya'] as $type): ?>
                                <option <?= selected($editSpecial['type'], $type) ?>><?= e($type) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="field">
                        <label>Status</label>
                        <select name="status">
                            <?php foreach (['Belum Mengikuti', 'Persiapan', 'Berjalan', 'Selesai', 'Tertunda'] as $status): ?>
                                <option <?= selected($editSpecial['status'], $status) ?>><?= e($status) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="field full">
                        <label>Lokasi / Instansi</label>
                        <input name="location" value="<?= e($editSpecial['location']) ?>">
                    </div>

                    <div class="field full">
                        <label>Pembimbing / Mentor</label>
                        <input name="supervisor" value="<?= e($editSpecial['supervisor']) ?>">
                    </div>

                    <div class="field">
                        <label>Progres (%)</label>
                        <input
                            type="number"
                            name="progress"
                            min="0"
                            max="100"
                            value="<?= (int) $editSpecial['progress'] ?>"
                        >
                    </div>

                    <div class="field full">
                        <label>Catatan</label>
                        <textarea name="note"><?= e($editSpecial['note']) ?></textarea>
                    </div>
                </div>

                <div class="form-actions">
                    <button class="btn primary" type="submit">Simpan Kegiatan</button>
                </div>
            </form>
        </div>
    <?php endif; ?>

    <div class="card table-card">
        <div class="table-wrap">
            <table>
                <thead>
                <tr>
                    <th>Mahasiswa</th>
                    <th>Program</th>
                    <th>Lokasi</th>
                    <th>Pembimbing</th>
                    <th>Status</th>
                    <th>Progres</th>
                    <th>Catatan</th>
                    <th>Aksi</th>
                </tr>
                </thead>

                <tbody>
                <?php foreach ($students as $student): ?>
                    <?php
                    $special = $specialByEnrollment[(int) $student['enrollment_id']] ?? [
                        'type' => 'KKN',
                        'status' => 'Belum Mengikuti',
                        'location' => '',
                        'supervisor' => '',
                        'progress' => 0,
                        'note' => '',
                    ];
                    ?>
                    <tr>
                        <td>
                            <div class="student">
                                <div class="avatar">
                                    <?= e(initials((string) $student['name'], (string) $student['nim'])) ?>
                                </div>
                                <div>
                                    <strong><?= e(display_name($student)) ?></strong>
                                    <small><?= e($student['nim']) ?></small>
                                </div>
                            </div>
                        </td>

                        <td><?= e($special['type']) ?></td>
                        <td><?= e($special['location'] ?: '—') ?></td>
                        <td><?= e($special['supervisor'] ?: '—') ?></td>

                        <td>
                            <span class="badge <?= $special['status'] === 'Selesai' ? 'ok' : ($special['status'] === 'Berjalan' ? 'info' : 'neutral') ?>">
                                <?= e($special['status']) ?>
                            </span>
                        </td>

                        <td style="min-width:130px">
                            <div class="progress-row" style="margin:0">
                                <div class="progress-head">
                                    <span></span>
                                    <strong><?= (int) $special['progress'] ?>%</strong>
                                </div>
                                <div class="bar">
                                    <div style="width:<?= max(0, min(100, (int) $special['progress'])) ?>%"></div>
                                </div>
                            </div>
                        </td>

                        <td><?= e($special['note'] ?: '—') ?></td>

                        <td>
                            <a
                                class="btn small"
                                href="<?= e(app_url('dashboard.php?page=special&class_id=' . $classId . '&edit_special=' . (int) $student['enrollment_id'] . '#special-form')) ?>"
                            >Edit</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>
