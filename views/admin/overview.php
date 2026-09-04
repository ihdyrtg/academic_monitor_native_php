<div class="stat-grid" style="margin-bottom:16px">
    <div class="stat-box"><strong><?= (int) $counts['users'] ?></strong><span>Pengguna</span></div>
    <div class="stat-box"><strong><?= (int) $counts['programs'] ?></strong><span>Program Studi</span></div>
    <div class="stat-box"><strong><?= (int) $counts['courses'] ?></strong><span>Mata Kuliah</span></div>
    <div class="stat-box"><strong><?= (int) $counts['classes'] ?></strong><span>Kelas</span></div>
    <div class="stat-box"><strong><?= (int) $counts['students'] ?></strong><span>Mahasiswa Global</span></div>
</div>

<div class="two-col">
    <div class="card section-card">
        <h4 style="margin-top:0">Arsitektur PHP Native</h4>
        <div class="metric-list">
            <div class="metric-row"><span>Database</span><strong>MySQL / MariaDB + PDO</strong></div>
            <div class="metric-row"><span>Autentikasi</span><strong>Session + password_hash()</strong></div>
            <div class="metric-row"><span>Otorisasi</span><strong>Admin / Dosen / Mahasiswa</strong></div>
            <div class="metric-row"><span>Keamanan Form</span><strong>CSRF + Prepared Statement</strong></div>
            <div class="metric-row"><span>Data Lama</span><strong>Importer Backup JSON</strong></div>
        </div>
    </div>

    <div class="card section-card">
        <h4 style="margin-top:0">Fitur yang Dipertahankan</h4>
        <p class="inline-help">
            Multi Prodi, mata kuliah, kelas, mahasiswa, status akademik/pembayaran,
            IPK dan target IPK, GitHub/Colab/Drive, presensi, tugas/nilai,
            kalender, prediksi kelulusan, tren pemahaman, KKN/MBKM,
            denah PC, portal mahasiswa, log aktivitas, CSV SIAKAD,
            backup dan import.
        </p>

        <div class="actions" style="margin-top:14px">
            <a class="btn" href="<?= e(app_url('admin.php?section=users')) ?>">Kelola Pengguna</a>
            <a class="btn" href="<?= e(app_url('admin.php?section=academic')) ?>">Kelola Akademik</a>
            <a class="btn" href="<?= e(app_url('import_legacy.php')) ?>">Migrasi Data Lama</a>
        </div>
    </div>
</div>
