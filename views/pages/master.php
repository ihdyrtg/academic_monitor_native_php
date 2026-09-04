<section class="page active">
    <div class="page-head">
        <div>
            <h3>Master Akademik</h3>
            <p>
                Kelola banyak program studi, mata kuliah, dan kelas.
                Kelas aktif menentukan seluruh data monitoring yang sedang ditampilkan.
            </p>
        </div>

        <?php if (($user['role'] ?? '') === 'admin'): ?>
            <div class="actions">
                <a class="btn primary" href="<?= e(app_url('admin.php?section=academic')) ?>">Kelola Master</a>
            </div>
        <?php endif; ?>
    </div>

    <div class="grid master-grid">
        <div class="card master-card">
            <div class="section-title">
                <h4>Program Studi</h4>
                <span><?= count($programs) ?> data</span>
            </div>

            <div class="master-list">
                <?php foreach ($programs as $programItem): ?>
                    <div class="master-row">
                        <div>
                            <strong>
                                <?= e(
                                    trim(
                                        ($programItem['code'] ? $programItem['code'] . ' — ' : '')
                                        . $programItem['name']
                                    )
                                ) ?>
                            </strong>
                            <small><?= e($programItem['faculty'] ?: 'Fakultas belum diisi') ?></small>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        <div class="card master-card">
            <div class="section-title">
                <h4>Mata Kuliah</h4>
                <span><?= count($courses) ?> data</span>
            </div>

            <div class="master-list">
                <?php foreach ($courses as $courseItem): ?>
                    <div class="master-row">
                        <div>
                            <strong>
                                <?= e(
                                    trim(
                                        ($courseItem['code'] ? $courseItem['code'] . ' — ' : '')
                                        . $courseItem['name']
                                    )
                                ) ?>
                            </strong>
                            <small>
                                <?= (int) $courseItem['credits'] ?> SKS
                                • <?= e($courseItem['program_code'] ?: $courseItem['program_name']) ?>
                            </small>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        <div class="card master-card">
            <div class="section-title">
                <h4>Kelas</h4>
                <span><?= count($classes) ?> data</span>
            </div>

            <div class="master-list">
                <?php foreach ($classes as $classItem): ?>
                    <div class="master-row">
                        <div>
                            <strong>
                                <?= e($classItem['name']) ?>
                                <?php if ((int) $classItem['id'] === (int) $classContext['id']): ?>
                                    <span class="badge ok">Aktif</span>
                                <?php endif; ?>
                            </strong>
                            <small>
                                <?= e($classItem['course_name']) ?>
                                • <?= e($classItem['academic_year'] ?: '-') ?>
                            </small>
                        </div>

                        <?php if (in_array((int) $classItem['id'], $allowedClassIds, true)): ?>
                            <a
                                class="btn small"
                                href="<?= e(app_url('dashboard.php?page=overview&class_id=' . (int) $classItem['id'])) ?>"
                            >Buka</a>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>
