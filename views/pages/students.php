<?php
$editEnrollmentId = filter_input(INPUT_GET, 'edit_student', FILTER_VALIDATE_INT) ?: 0;
$editStudent = $editEnrollmentId > 0
    ? $repository->enrollment($classId, $editEnrollmentId)
    : null;
$statusFilter = trim((string) ($_GET['status'] ?? ''));
$visibleStudents = array_values(array_filter(
    $students,
    static fn (array $student): bool =>
        $statusFilter === '' || $student['registration_status'] === $statusFilter
));
$pcOptions = [
    'PC01','PC02','PC03','PC04','PC05','PC06','PC07','PC08',
    'PC16','PC15','PC14','PC13','PC12','PC11','PC10','PC09',
    'PC17','PC18','PC19','PC20','PC21','PC22','PC23','PC24',
    'PC32','PC31','PC30','PC29','PC28','PC27','PC26','PC25',
    'PC33','PC34','PC35','PC36','PC37','PC38','PC39','PC40',
];
?>
<section class="page active">
    <div class="page-head">
        <div>
            <h3>Profil & Status Akademik Mahasiswa</h3>
            <p>
                Identitas, registrasi, pembayaran, IPK, target IPK,
                GitHub/Colab/Drive, posisi duduk, dan catatan dosen.
            </p>
        </div>

        <div class="actions">
            <a
                class="btn"
                href="<?= e(app_url('export.php?type=students&class_id=' . $classId)) ?>"
            >↧ CSV</a>

            <form
                method="post"
                action="<?= e(app_url('action.php')) ?>"
                enctype="multipart/form-data"
                class="inline-form"
            >
                <?= Csrf::field() ?>
                <input type="hidden" name="action" value="students.import_csv">
                <input type="hidden" name="class_id" value="<?= $classId ?>">
                <input type="hidden" name="return_to" value="dashboard.php?page=students&class_id=<?= $classId ?>">
                <label class="btn">
                    ↥ Import CSV
                    <input
                        type="file"
                        name="csv_file"
                        accept=".csv,text/csv,text/plain"
                        onchange="this.form.submit()"
                        hidden
                    >
                </label>
            </form>

            <a
                class="btn primary"
                href="<?= e(app_url('dashboard.php?page=students&class_id=' . $classId . '&edit_student=0#student-form')) ?>"
            >＋ Mahasiswa</a>
        </div>
    </div>

    <?php if (isset($_GET['edit_student'])): ?>
        <div class="card panel-form" id="student-form" style="margin-bottom:16px">
            <div class="section-title">
                <h4><?= $editStudent ? 'Edit Mahasiswa' : 'Tambah Mahasiswa' ?></h4>
                <a
                    class="btn small"
                    href="<?= e(app_url('dashboard.php?page=students&class_id=' . $classId)) ?>"
                >Tutup</a>
            </div>

            <form method="post" action="<?= e(app_url('action.php')) ?>">
                <?= Csrf::field() ?>
                <input type="hidden" name="action" value="student.save">
                <input type="hidden" name="class_id" value="<?= $classId ?>">
                <input type="hidden" name="enrollment_id" value="<?= (int) ($editStudent['enrollment_id'] ?? 0) ?>">
                <input type="hidden" name="return_to" value="dashboard.php?page=students&class_id=<?= $classId ?>">

                <div class="form-grid">
                    <div class="field">
                        <label>NIM</label>
                        <input
                            name="nim"
                            value="<?= e($editStudent['nim'] ?? '') ?>"
                            maxlength="50"
                            required
                        >
                    </div>

                    <div class="field">
                        <label>Nama</label>
                        <input name="name" value="<?= e($editStudent['name'] ?? '') ?>">
                    </div>

                    <div class="field">
                        <label>Status Registrasi</label>
                        <select name="registration_status">
                            <?php foreach (['Aktif', 'Cuti', 'Nonaktif', 'Lulus'] as $status): ?>
                                <option
                                    <?= selected($editStudent['registration_status'] ?? 'Aktif', $status) ?>
                                ><?= e($status) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="field">
                        <label>Status Pembayaran</label>
                        <select name="payment_status">
                            <?php foreach (['Lunas', 'Belum Lunas', 'Cicilan'] as $payment): ?>
                                <option
                                    <?= selected($editStudent['payment_status'] ?? 'Lunas', $payment) ?>
                                ><?= e($payment) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="field">
                        <label>IPK Sementara</label>
                        <input
                            type="number"
                            name="gpa"
                            min="0"
                            max="4"
                            step="0.01"
                            value="<?= e($editStudent['gpa'] ?? '') ?>"
                        >
                    </div>

                    <div class="field">
                        <label>Target / Harapan IPK</label>
                        <input
                            type="number"
                            name="target_gpa"
                            min="0"
                            max="4"
                            step="0.01"
                            value="<?= e($editStudent['target_gpa'] ?? '') ?>"
                        >
                    </div>

                    <div class="field">
                        <label>Posisi PC</label>
                        <select name="pc">
                            <option value="">Belum ditentukan</option>
                            <?php foreach ($pcOptions as $pc): ?>
                                <option
                                    value="<?= e($pc) ?>"
                                    <?= selected($editStudent['pc'] ?? '', $pc) ?>
                                ><?= e($pc) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="field">
                        <label>Email</label>
                        <input
                            type="email"
                            name="email"
                            value="<?= e($editStudent['email'] ?? '') ?>"
                        >
                    </div>

                    <div class="field">
                        <label>Telepon</label>
                        <input name="phone" value="<?= e($editStudent['phone'] ?? '') ?>">
                    </div>

                    <div class="field full">
                        <label>Link Pekerjaan / Repository</label>
                        <div class="form-grid">
                            <div class="field">
                                <label>GitHub</label>
                                <input
                                    type="url"
                                    name="github_url"
                                    placeholder="https://github.com/username/repository"
                                    value="<?= e($editStudent['github_url'] ?? '') ?>"
                                >
                            </div>

                            <div class="field">
                                <label>Google Colab</label>
                                <input
                                    type="url"
                                    name="colab_url"
                                    placeholder="https://colab.research.google.com/..."
                                    value="<?= e($editStudent['colab_url'] ?? '') ?>"
                                >
                            </div>

                            <div class="field full">
                                <label>Google Drive</label>
                                <input
                                    type="url"
                                    name="drive_url"
                                    placeholder="https://drive.google.com/..."
                                    value="<?= e($editStudent['drive_url'] ?? '') ?>"
                                >
                            </div>
                        </div>
                    </div>

                    <div class="field full">
                        <label>Catatan / Evaluasi Dosen</label>
                        <textarea name="note"><?= e($editStudent['note'] ?? '') ?></textarea>
                    </div>
                </div>

                <div class="form-actions">
                    <a
                        class="btn"
                        href="<?= e(app_url('dashboard.php?page=students&class_id=' . $classId)) ?>"
                    >Batal</a>
                    <button class="btn primary" type="submit">Simpan</button>
                </div>
            </form>
        </div>
    <?php endif; ?>

    <div class="card table-card">
        <div class="table-tools">
            <input
                id="studentSearch"
                placeholder="Cari NIM / nama / link..."
                style="min-width:230px"
            >

            <form method="get" class="inline-form">
                <input type="hidden" name="page" value="students">
                <input type="hidden" name="class_id" value="<?= $classId ?>">
                <select name="status" data-auto-submit>
                    <option value="">Semua status</option>
                    <?php foreach (['Aktif', 'Cuti', 'Nonaktif', 'Lulus'] as $status): ?>
                        <option value="<?= e($status) ?>" <?= selected($statusFilter, $status) ?>>
                            <?= e($status) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </form>

            <span style="margin-left:auto;color:var(--muted);font-size:10px">
                <?= count($visibleStudents) ?> dari <?= count($students) ?> mahasiswa
            </span>
        </div>

        <div class="table-wrap">
            <table>
                <thead>
                <tr>
                    <th>Mahasiswa</th>
                    <th>NIM</th>
                    <th>Status</th>
                    <th>IPK</th>
                    <th>Target</th>
                    <th>PC</th>
                    <th>Link</th>
                    <th>Presensi</th>
                    <th>Prediksi</th>
                    <th>Aksi</th>
                </tr>
                </thead>

                <tbody>
                <?php if ($visibleStudents === []): ?>
                    <tr>
                        <td colspan="10">
                            <div class="empty-state">Tidak ada data yang cocok.</div>
                        </td>
                    </tr>
                <?php endif; ?>

                <?php foreach ($visibleStudents as $student): ?>
                    <?php
                    $studentInfo = $analytics['students'][(int) $student['enrollment_id']];
                    $prediction = $studentInfo['prediction'];
                    $searchText = strtolower(implode(' ', [
                        $student['nim'],
                        $student['name'],
                        $student['email'],
                        $student['phone'],
                        $student['github_url'],
                        $student['colab_url'],
                        $student['drive_url'],
                    ]));
                    ?>
                    <tr data-student-row data-search="<?= e($searchText) ?>">
                        <td>
                            <div class="student">
                                <div class="avatar">
                                    <?= e(initials((string) $student['name'], (string) $student['nim'])) ?>
                                </div>
                                <div>
                                    <strong><?= e(display_name($student)) ?></strong>
                                    <small><?= e($student['email'] ?: $student['note']) ?></small>
                                </div>
                            </div>
                        </td>

                        <td><strong><?= e($student['nim']) ?></strong></td>

                        <td>
                            <span class="badge <?= $student['registration_status'] === 'Aktif' ? 'ok' : 'warn' ?>">
                                <?= e($student['registration_status']) ?>
                            </span>
                        </td>

                        <td>
                            <?= $student['gpa'] === null
                                ? '—'
                                : e(number_format((float) $student['gpa'], 2)) ?>
                        </td>

                        <td>
                            <?= $student['target_gpa'] === null
                                ? '—'
                                : e(number_format((float) $student['target_gpa'], 2)) ?>
                        </td>

                        <td><?= e($student['pc'] ?: '—') ?></td>
                        <td><?= resource_links($student, true) ?></td>

                        <td>
                            <?= $studentInfo['attendance_rate'] === null
                                ? '—'
                                : (int) $studentInfo['attendance_rate'] . '%' ?>
                        </td>

                        <td>
                            <span class="badge <?= e($prediction['tone']) ?>">
                                <?= e($prediction['status']) ?>
                            </span>
                        </td>

                        <td>
                            <div class="table-actions">
                                <a
                                    class="btn small"
                                    href="<?= e(app_url('dashboard.php?page=students&class_id=' . $classId . '&edit_student=' . (int) $student['enrollment_id'] . '#student-form')) ?>"
                                >Edit</a>

                                <form
                                    method="post"
                                    action="<?= e(app_url('action.php')) ?>"
                                    class="inline-form"
                                >
                                    <?= Csrf::field() ?>
                                    <input type="hidden" name="action" value="student.delete">
                                    <input type="hidden" name="class_id" value="<?= $classId ?>">
                                    <input type="hidden" name="enrollment_id" value="<?= (int) $student['enrollment_id'] ?>">
                                    <input type="hidden" name="return_to" value="dashboard.php?page=students&class_id=<?= $classId ?>">
                                    <button
                                        class="btn small danger"
                                        type="submit"
                                        data-confirm="Hapus <?= e($student['nim']) ?> dari kelas aktif?"
                                    >Hapus</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>
