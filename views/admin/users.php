<?php
$userForm = $editUser ?: [
    'id' => 0,
    'username' => '',
    'email' => '',
    'role' => 'dosen',
    'student_id' => null,
    'is_active' => 1,
];
?>
<div class="two-col">
    <div class="card panel-form" id="user-form">
        <div class="section-title">
            <h4><?= $editUser ? 'Edit Pengguna' : 'Tambah Pengguna' ?></h4>
            <?php if ($editUser): ?>
                <a class="btn small" href="<?= e(app_url('admin.php?section=users')) ?>">Batal Edit</a>
            <?php endif; ?>
        </div>

        <form method="post" action="<?= e(app_url('action.php')) ?>">
            <?= Csrf::field() ?>
            <input type="hidden" name="action" value="admin.user.save">
            <input type="hidden" name="id" value="<?= (int) $userForm['id'] ?>">
            <input type="hidden" name="return_to" value="admin.php?section=users">

            <div class="form-grid">
                <div class="field">
                    <label>Username</label>
                    <input name="username" value="<?= e($userForm['username']) ?>" required>
                </div>

                <div class="field">
                    <label>Email</label>
                    <input type="email" name="email" value="<?= e($userForm['email']) ?>">
                </div>

                <div class="field">
                    <label>Role</label>
                    <select name="role">
                        <?php foreach (['admin', 'dosen', 'mahasiswa'] as $role): ?>
                            <option value="<?= e($role) ?>" <?= selected($userForm['role'], $role) ?>>
                                <?= e(ucfirst($role)) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="field">
                    <label>Hubungkan Mahasiswa</label>
                    <select name="student_id">
                        <option value="">Tidak terhubung</option>
                        <?php foreach ($allStudents as $student): ?>
                            <option
                                value="<?= (int) $student['id'] ?>"
                                <?= selected($userForm['student_id'] ?? '', $student['id']) ?>
                            >
                                <?= e($student['nim'] . ' — ' . ($student['name'] ?: 'Nama belum diisi')) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="field full">
                    <label>
                        Password
                        <?= $editUser ? '(kosongkan jika tidak diubah)' : '' ?>
                    </label>
                    <input type="password" name="password" <?= $editUser ? '' : 'required' ?>>
                </div>

                <div class="field full">
                    <label>Akses Kelas untuk Dosen</label>
                    <div class="master-list" style="max-height:180px">
                        <?php foreach ($classes as $classItem): ?>
                            <label class="master-row" style="cursor:pointer">
                                <span>
                                    <strong><?= e($classItem['name']) ?></strong>
                                    <small><?= e($classItem['course_name']) ?> • <?= e($classItem['academic_year']) ?></small>
                                </span>
                                <input
                                    type="checkbox"
                                    name="class_ids[]"
                                    value="<?= (int) $classItem['id'] ?>"
                                    <?= checked(in_array((int) $classItem['id'], $editUserClassIds, true)) ?>
                                >
                            </label>
                        <?php endforeach; ?>
                    </div>
                </div>

                <div class="field full">
                    <label>
                        <input
                            type="checkbox"
                            name="is_active"
                            value="1"
                            <?= checked((bool) $userForm['is_active']) ?>
                        >
                        Akun aktif
                    </label>
                </div>
            </div>

            <div class="form-actions">
                <button class="btn primary" type="submit">Simpan Pengguna</button>
            </div>
        </form>
    </div>

    <div class="card table-card">
        <div class="table-tools"><strong>Daftar Pengguna</strong></div>

        <div class="table-wrap">
            <table>
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Mahasiswa</th>
                    <th>Status</th>
                    <th>Login Terakhir</th>
                    <th>Aksi</th>
                </tr>
                </thead>

                <tbody>
                <?php foreach ($users as $account): ?>
                    <tr>
                        <td>
                            <strong><?= e($account['username']) ?></strong><br>
                            <small><?= e($account['email']) ?></small>
                        </td>

                        <td><span class="badge info"><?= e($account['role']) ?></span></td>

                        <td>
                            <?= $account['student_id']
                                ? e($account['student_nim'] . ' — ' . ($account['student_name'] ?: 'Nama belum diisi'))
                                : '—' ?>
                        </td>

                        <td>
                            <span class="badge <?= $account['is_active'] ? 'ok' : 'danger' ?>">
                                <?= $account['is_active'] ? 'Aktif' : 'Nonaktif' ?>
                            </span>
                        </td>

                        <td>
                            <?= $account['last_login_at']
                                ? e(date('d/m/Y H:i', strtotime((string) $account['last_login_at'])))
                                : 'Belum pernah' ?>
                        </td>

                        <td>
                            <div class="table-actions">
                                <a
                                    class="btn small"
                                    href="<?= e(app_url('admin.php?section=users&edit_user=' . (int) $account['id'] . '#user-form')) ?>"
                                >Edit</a>

                                <?php if ((int) $account['id'] !== (int) $user['id']): ?>
                                    <form method="post" action="<?= e(app_url('action.php')) ?>">
                                        <?= Csrf::field() ?>
                                        <input type="hidden" name="action" value="admin.user.delete">
                                        <input type="hidden" name="id" value="<?= (int) $account['id'] ?>">
                                        <input type="hidden" name="return_to" value="admin.php?section=users">
                                        <button
                                            class="btn small danger"
                                            type="submit"
                                            data-confirm="Hapus akun <?= e($account['username']) ?>?"
                                        >Hapus</button>
                                    </form>
                                <?php endif; ?>
                            </div>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
