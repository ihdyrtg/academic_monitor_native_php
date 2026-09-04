<section class="page active">
    <div class="page-head">
        <div>
            <h3>Pengaturan & Backup</h3>
            <p>
                Identitas institusi, ambang kelulusan, format ekspor SIAKAD,
                serta pemindahan seluruh data dashboard.
            </p>
        </div>
    </div>

    <div class="grid" style="grid-template-columns:1fr 1fr">
        <div class="card section-card">
            <h4 style="margin-top:0">Pengaturan Umum</h4>

            <?php if (($user['role'] ?? '') === 'admin'): ?>
                <form method="post" action="<?= e(app_url('action.php')) ?>">
                    <?= Csrf::field() ?>
                    <input type="hidden" name="action" value="settings.save">
                    <input type="hidden" name="class_id" value="<?= $classId ?>">
                    <input type="hidden" name="return_to" value="dashboard.php?page=settings&class_id=<?= $classId ?>">

                    <div class="form-grid">
                        <div class="field full">
                            <label>Institusi</label>
                            <input name="institution" value="<?= e($settings['institution'] ?? '') ?>">
                        </div>

                        <div class="field full">
                            <label>Dosen Default</label>
                            <input name="default_lecturer" value="<?= e($settings['default_lecturer'] ?? '') ?>">
                        </div>

                        <div class="field">
                            <label>Ambang Lulus Default</label>
                            <input
                                name="default_pass_threshold"
                                type="number"
                                min="0"
                                max="100"
                                step="0.01"
                                value="<?= e($settings['default_pass_threshold'] ?? 60) ?>"
                            >
                        </div>

                        <div class="field">
                            <label>Penurunan Tren untuk Peringatan</label>
                            <input
                                name="trend_drop_threshold"
                                type="number"
                                min="1"
                                max="100"
                                step="0.01"
                                value="<?= e($settings['trend_drop_threshold'] ?? 10) ?>"
                            >
                        </div>

                        <div class="field full">
                            <label>Header CSV SIAKAD</label>
                            <input
                                name="siakad_headers"
                                value="<?= e($settings['siakad_headers'] ?? 'nim,nama,tugas,uts,uas,nilai_akhir,nilai_huruf') ?>"
                            >
                        </div>
                    </div>

                    <button class="btn primary" type="submit" style="margin-top:12px">
                        Simpan Pengaturan
                    </button>
                </form>
            <?php else: ?>
                <div class="metric-list">
                    <div class="metric-row"><span>Institusi</span><strong><?= e($settings['institution'] ?? '—') ?></strong></div>
                    <div class="metric-row"><span>Dosen Default</span><strong><?= e($settings['default_lecturer'] ?? '—') ?></strong></div>
                    <div class="metric-row"><span>Ambang Lulus Default</span><strong><?= e($settings['default_pass_threshold'] ?? 60) ?>%</strong></div>
                    <div class="metric-row"><span>Peringatan Tren</span><strong><?= e($settings['trend_drop_threshold'] ?? 10) ?> poin</strong></div>
                </div>
            <?php endif; ?>
        </div>

        <div class="card section-card">
            <h4 style="margin-top:0">Backup & Pemindahan Data</h4>
            <p class="inline-help">
                Backup JSON database mencakup Prodi, Mata Kuliah, Kelas, mahasiswa,
                presensi, tugas, agenda, kegiatan, link, dan log yang dapat diakses akun.
            </p>

            <div class="actions" style="margin-top:14px">
                <a
                    class="btn"
                    href="<?= e(app_url('export.php?type=backup&class_id=' . $classId)) ?>"
                >↧ Backup JSON</a>

                <?php if (($user['role'] ?? '') === 'admin'): ?>
                    <a class="btn" href="<?= e(app_url('import_legacy.php')) ?>">
                        ↥ Migrasi Backup HTML Lama
                    </a>
                <?php endif; ?>
            </div>
        </div>

        <div class="card section-card">
            <h4 style="margin-top:0">Kelas Aktif</h4>

            <div class="metric-list">
                <div class="metric-row"><span>Kelas</span><strong><?= e($classContext['name']) ?></strong></div>
                <div class="metric-row"><span>Target mahasiswa</span><strong><?= (int) $classContext['target'] ?></strong></div>
                <div class="metric-row"><span>Pertemuan</span><strong><?= (int) $classContext['meetings'] ?></strong></div>
                <div class="metric-row"><span>Ambang lulus</span><strong><?= e($classContext['pass_threshold']) ?>%</strong></div>
            </div>

            <?php if (($user['role'] ?? '') === 'admin'): ?>
                <a
                    class="btn"
                    style="margin-top:12px"
                    href="<?= e(app_url('admin.php?section=academic&edit_class=' . $classId . '#class-form')) ?>"
                >Edit Kelas Aktif</a>
            <?php endif; ?>
        </div>

        <div class="card section-card">
            <h4 style="margin-top:0">Format Import Mahasiswa</h4>

            <p class="inline-help">
                CSV mendukung header:
                <code>nim,nama,status,pembayaran,ipk,target_ipk,pc,github,colab,drive,email,telepon,catatan</code>.
                Pemisah koma, titik koma, atau TAB dideteksi otomatis.
                NIM yang sudah ada akan diperbarui.
            </p>

            <a
                class="btn"
                style="margin-top:10px"
                href="<?= e(app_url('export.php?type=student_template&class_id=' . $classId)) ?>"
            >↧ Template CSV</a>
        </div>
    </div>
</section>
