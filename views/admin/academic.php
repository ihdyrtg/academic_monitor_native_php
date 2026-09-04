<div class="stack">
    <div class="card panel-form" id="program-form">
        <div class="section-title">
            <h4>Program Studi</h4>
            <?php if ($editProgram): ?>
                <a class="btn small" href="<?= e(app_url('admin.php?section=academic#program-form')) ?>">Batal Edit</a>
            <?php endif; ?>
        </div>

        <form method="post" action="<?= e(app_url('action.php')) ?>">
            <?= Csrf::field() ?>
            <input type="hidden" name="action" value="admin.program.save">
            <input type="hidden" name="id" value="<?= (int) ($editProgram['id'] ?? 0) ?>">
            <input type="hidden" name="return_to" value="admin.php?section=academic">

            <div class="form-grid">
                <div class="field">
                    <label>Kode Prodi</label>
                    <input name="code" value="<?= e($editProgram['code'] ?? '') ?>">
                </div>
                <div class="field">
                    <label>Nama Prodi</label>
                    <input name="name" value="<?= e($editProgram['name'] ?? '') ?>" required>
                </div>
                <div class="field full">
                    <label>Fakultas</label>
                    <input name="faculty" value="<?= e($editProgram['faculty'] ?? '') ?>">
                </div>
            </div>

            <div class="form-actions">
                <button class="btn primary" type="submit">Simpan Prodi</button>
            </div>
        </form>

        <div class="master-list" style="margin-top:14px;max-height:260px">
            <?php foreach ($programs as $programItem): ?>
                <div class="master-row">
                    <div>
                        <strong><?= e(trim(($programItem['code'] ? $programItem['code'] . ' — ' : '') . $programItem['name'])) ?></strong>
                        <small><?= e($programItem['faculty'] ?: 'Fakultas belum diisi') ?></small>
                    </div>

                    <div class="table-actions">
                        <a
                            class="btn small"
                            href="<?= e(app_url('admin.php?section=academic&edit_program=' . (int) $programItem['id'] . '#program-form')) ?>"
                        >Edit</a>

                        <form method="post" action="<?= e(app_url('action.php')) ?>">
                            <?= Csrf::field() ?>
                            <input type="hidden" name="action" value="admin.program.delete">
                            <input type="hidden" name="id" value="<?= (int) $programItem['id'] ?>">
                            <input type="hidden" name="return_to" value="admin.php?section=academic">
                            <button
                                class="btn small danger"
                                type="submit"
                                data-confirm="Hapus program studi ini? Penghapusan akan ditolak bila masih dipakai."
                            >Hapus</button>
                        </form>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <div class="card panel-form" id="course-form">
        <div class="section-title">
            <h4>Mata Kuliah</h4>
            <?php if ($editCourse): ?>
                <a class="btn small" href="<?= e(app_url('admin.php?section=academic#course-form')) ?>">Batal Edit</a>
            <?php endif; ?>
        </div>

        <form method="post" action="<?= e(app_url('action.php')) ?>">
            <?= Csrf::field() ?>
            <input type="hidden" name="action" value="admin.course.save">
            <input type="hidden" name="id" value="<?= (int) ($editCourse['id'] ?? 0) ?>">
            <input type="hidden" name="return_to" value="admin.php?section=academic">

            <div class="form-grid">
                <div class="field">
                    <label>Program Studi</label>
                    <select name="program_id" required>
                        <?php foreach ($programs as $programItem): ?>
                            <option
                                value="<?= (int) $programItem['id'] ?>"
                                <?= selected($editCourse['program_id'] ?? ($programs[0]['id'] ?? ''), $programItem['id']) ?>
                            >
                                <?= e(trim(($programItem['code'] ? $programItem['code'] . ' — ' : '') . $programItem['name'])) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="field">
                    <label>Kode MK</label>
                    <input name="code" value="<?= e($editCourse['code'] ?? '') ?>">
                </div>

                <div class="field">
                    <label>Nama Mata Kuliah</label>
                    <input name="name" value="<?= e($editCourse['name'] ?? '') ?>" required>
                </div>

                <div class="field">
                    <label>SKS</label>
                    <input type="number" min="0" name="credits" value="<?= e($editCourse['credits'] ?? 3) ?>">
                </div>
            </div>

            <div class="form-actions">
                <button class="btn primary" type="submit">Simpan Mata Kuliah</button>
            </div>
        </form>

        <div class="master-list" style="margin-top:14px;max-height:280px">
            <?php foreach ($courses as $courseItem): ?>
                <div class="master-row">
                    <div>
                        <strong><?= e(trim(($courseItem['code'] ? $courseItem['code'] . ' — ' : '') . $courseItem['name'])) ?></strong>
                        <small><?= (int) $courseItem['credits'] ?> SKS • <?= e($courseItem['program_code'] ?: $courseItem['program_name']) ?></small>
                    </div>

                    <div class="table-actions">
                        <a
                            class="btn small"
                            href="<?= e(app_url('admin.php?section=academic&edit_course=' . (int) $courseItem['id'] . '#course-form')) ?>"
                        >Edit</a>

                        <form method="post" action="<?= e(app_url('action.php')) ?>">
                            <?= Csrf::field() ?>
                            <input type="hidden" name="action" value="admin.course.delete">
                            <input type="hidden" name="id" value="<?= (int) $courseItem['id'] ?>">
                            <input type="hidden" name="return_to" value="admin.php?section=academic">
                            <button
                                class="btn small danger"
                                type="submit"
                                data-confirm="Hapus mata kuliah ini? Penghapusan akan ditolak bila masih dipakai kelas."
                            >Hapus</button>
                        </form>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <div class="card panel-form" id="class-form">
        <div class="section-title">
            <h4>Kelas</h4>
            <?php if ($editClass): ?>
                <a class="btn small" href="<?= e(app_url('admin.php?section=academic#class-form')) ?>">Batal Edit</a>
            <?php endif; ?>
        </div>

        <form method="post" action="<?= e(app_url('action.php')) ?>">
            <?= Csrf::field() ?>
            <input type="hidden" name="action" value="admin.class.save">
            <input type="hidden" name="id" value="<?= (int) ($editClass['id'] ?? 0) ?>">
            <input type="hidden" name="return_to" value="admin.php?section=academic">

            <div class="form-grid">
                <div class="field">
                    <label>Program Studi</label>
                    <select name="program_id" required>
                        <?php foreach ($programs as $programItem): ?>
                            <option
                                value="<?= (int) $programItem['id'] ?>"
                                <?= selected($editClass['program_id'] ?? ($programs[0]['id'] ?? ''), $programItem['id']) ?>
                            >
                                <?= e(trim(($programItem['code'] ? $programItem['code'] . ' — ' : '') . $programItem['name'])) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="field">
                    <label>Mata Kuliah</label>
                    <select name="course_id" required>
                        <?php foreach ($courses as $courseItem): ?>
                            <option
                                value="<?= (int) $courseItem['id'] ?>"
                                <?= selected($editClass['course_id'] ?? ($courses[0]['id'] ?? ''), $courseItem['id']) ?>
                            >
                                <?= e(trim(($courseItem['code'] ? $courseItem['code'] . ' — ' : '') . $courseItem['name'])) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="field">
                    <label>Nama Kelas</label>
                    <input name="name" value="<?= e($editClass['name'] ?? '') ?>" required>
                </div>

                <div class="field">
                    <label>Semester</label>
                    <input name="semester" value="<?= e($editClass['semester'] ?? '') ?>">
                </div>

                <div class="field">
                    <label>Tahun Akademik</label>
                    <input name="academic_year" value="<?= e($editClass['academic_year'] ?? '') ?>">
                </div>

                <div class="field">
                    <label>Target Mahasiswa</label>
                    <input type="number" min="1" name="target" value="<?= e($editClass['target'] ?? 30) ?>">
                </div>

                <div class="field">
                    <label>Jumlah Pertemuan</label>
                    <input type="number" min="1" max="32" name="meetings" value="<?= e($editClass['meetings'] ?? 16) ?>">
                </div>

                <div class="field">
                    <label>Ambang Lulus</label>
                    <input type="number" min="0" max="100" step="0.01" name="pass_threshold" value="<?= e($editClass['pass_threshold'] ?? 60) ?>">
                </div>

                <div class="field full">
                    <label>Dosen</label>
                    <input name="lecturer" value="<?= e($editClass['lecturer'] ?? ($settings['default_lecturer'] ?? 'Dashboard monitoring dosen')) ?>">
                </div>
            </div>

            <div class="form-actions">
                <button class="btn primary" type="submit">Simpan Kelas</button>
            </div>
        </form>

        <div class="master-list" style="margin-top:14px;max-height:320px">
            <?php foreach ($classes as $classItem): ?>
                <div class="master-row">
                    <div>
                        <strong><?= e($classItem['name']) ?></strong>
                        <small>
                            <?= e($classItem['course_name']) ?>
                            • <?= e($classItem['semester'] ?: '-') ?>
                            • <?= e($classItem['academic_year'] ?: '-') ?>
                        </small>
                    </div>

                    <div class="table-actions">
                        <a
                            class="btn small"
                            href="<?= e(app_url('dashboard.php?page=overview&class_id=' . (int) $classItem['id'])) ?>"
                        >Buka</a>

                        <a
                            class="btn small"
                            href="<?= e(app_url('admin.php?section=academic&edit_class=' . (int) $classItem['id'] . '#class-form')) ?>"
                        >Edit</a>

                        <form method="post" action="<?= e(app_url('action.php')) ?>">
                            <?= Csrf::field() ?>
                            <input type="hidden" name="action" value="admin.class.delete">
                            <input type="hidden" name="id" value="<?= (int) $classItem['id'] ?>">
                            <input type="hidden" name="return_to" value="admin.php?section=academic">
                            <button
                                class="btn small danger"
                                type="submit"
                                data-confirm="Hapus kelas <?= e($classItem['name']) ?> beserta presensi, tugas, nilai, agenda, dan enrollment?"
                            >Hapus</button>
                        </form>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>
