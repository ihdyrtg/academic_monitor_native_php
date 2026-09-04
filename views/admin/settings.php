<div class="two-col">
    <div class="card panel-form">
        <h4 style="margin-top:0">Konfigurasi Dashboard</h4>

        <form method="post" action="<?= e(app_url('action.php')) ?>">
            <?= Csrf::field() ?>
            <input type="hidden" name="action" value="settings.save">
            <input type="hidden" name="return_to" value="admin.php?section=settings">

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
                        type="number"
                        min="0"
                        max="100"
                        step="0.01"
                        name="default_pass_threshold"
                        value="<?= e($settings['default_pass_threshold'] ?? 60) ?>"
                    >
                </div>

                <div class="field">
                    <label>Penurunan Tren untuk Peringatan</label>
                    <input
                        type="number"
                        min="1"
                        max="100"
                        step="0.01"
                        name="trend_drop_threshold"
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

            <div class="form-actions">
                <button class="btn primary" type="submit">Simpan Pengaturan</button>
            </div>
        </form>
    </div>

    <div class="stack">
        <div class="card section-card">
            <h4 style="margin-top:0">Migrasi Dashboard HTML Lama</h4>
            <p class="inline-help">
                File HTML asli tetap disimpan utuh pada folder <code>legacy/</code>.
                Jika browser lama Anda sudah memiliki data localStorage yang lebih baru,
                export Backup JSON dari HTML lama lalu import di sini.
            </p>
            <a class="btn" style="margin-top:12px" href="<?= e(app_url('import_legacy.php')) ?>">
                ↥ Migrasi Backup JSON
            </a>
        </div>

        <div class="card section-card">
            <h4 style="margin-top:0">Backup</h4>
            <p class="inline-help">
                Backup dapat diunduh dari dashboard per kelas/akses akun dan menghasilkan
                struktur JSON yang tetap dapat dimigrasikan kembali.
            </p>
            <?php if ($classId > 0): ?>
                <a
                    class="btn"
                    style="margin-top:12px"
                    href="<?= e(app_url('export.php?type=backup&class_id=' . $classId)) ?>"
                >↧ Backup JSON</a>
            <?php endif; ?>
        </div>
    </div>
</div>
