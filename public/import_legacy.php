<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/app/bootstrap.php';

Auth::requireRole('admin');

$pdo = Database::connection();
$repository = new Repository($pdo);
$importer = new LegacyImporter($pdo, $repository);
$user = Auth::user();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    Csrf::enforce();

    try {
        if (
            !isset($_FILES['backup_file'])
            || !is_uploaded_file($_FILES['backup_file']['tmp_name'])
            || (int) $_FILES['backup_file']['error'] !== UPLOAD_ERR_OK
        ) {
            throw new RuntimeException('Pilih file Backup JSON terlebih dahulu.');
        }

        if ((int) $_FILES['backup_file']['size'] > 10 * 1024 * 1024) {
            throw new RuntimeException('Ukuran backup maksimal 10 MB.');
        }

        $json = file_get_contents($_FILES['backup_file']['tmp_name']);
        if ($json === false) {
            throw new RuntimeException('File backup tidak dapat dibaca.');
        }

        $state = json_decode($json, true, 512, JSON_THROW_ON_ERROR);
        if (!is_array($state)) {
            throw new RuntimeException('Isi backup tidak valid.');
        }

        $summary = $importer->import($state, (int) $user['id']);

        flash(
            'success',
            sprintf(
                'Migrasi selesai: %d Prodi, %d MK, %d kelas, %d mahasiswa, %d tugas, %d presensi, %d nilai, %d agenda diproses.',
                $summary['programs'],
                $summary['courses'],
                $summary['classes'],
                $summary['students'],
                $summary['tasks'],
                $summary['attendance'],
                $summary['task_records'],
                $summary['events']
            )
        );
        redirect('admin.php?section=academic');
    } catch (Throwable $exception) {
        flash('danger', $exception->getMessage());
    }
}

$flashes = consume_flashes();
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Migrasi Dashboard Lama</title>
    <link rel="stylesheet" href="<?= e(app_url('assets/css/app.css')) ?>">
</head>
<body class="auth-body">
    <div class="card auth-card" style="width:min(760px,100%)">
        <div class="auth-logo">↥</div>
        <h1>Migrasi Backup Dashboard HTML</h1>
        <p>
            Gunakan file JSON dari tombol <strong>Backup</strong> pada dashboard HTML lama.
            Importer mempertahankan Prodi, mata kuliah, kelas, mahasiswa,
            status registrasi/pembayaran, IPK, posisi PC, GitHub/Colab/Drive,
            presensi, tugas, nilai, agenda, KKN/MBKM, dan log.
        </p>

        <?php foreach ($flashes as $flashItem): ?>
            <div class="alert <?= e($flashItem['type']) ?>"><?= e($flashItem['message']) ?></div>
        <?php endforeach; ?>

        <div class="alert warning">
            Buat backup database sebelum melakukan migrasi pada sistem produksi.
            Data dengan identitas yang sama akan diperbarui, bukan dibuat ulang.
        </div>

        <form method="post" enctype="multipart/form-data">
            <?= Csrf::field() ?>

            <div class="field">
                <label>Backup JSON dashboard lama</label>
                <input type="file" name="backup_file" accept="application/json,.json" required>
            </div>

            <div class="form-actions">
                <a class="btn" href="<?= e(app_url('admin.php')) ?>">Batal</a>
                <button class="btn primary" type="submit">Mulai Migrasi</button>
            </div>
        </form>
    </div>
</body>
</html>
