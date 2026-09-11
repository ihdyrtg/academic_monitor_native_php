<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/app/bootstrap.php';

if (Auth::check()) {
    redirect('dashboard.php');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    Csrf::enforce();

    $username = post_string('username');
    $password = (string) ($_POST['password'] ?? '');

    if ($username === '' || $password === '') {
        flash('warning', 'Username dan password wajib diisi.');
    } elseif (Auth::attempt($username, $password)) {
        flash('success', 'Login berhasil.');
        redirect('dashboard.php');
    } else {
        flash('danger', 'Username/password salah atau akun tidak aktif.');
    }
}

$flashes = consume_flashes();
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Login - Academic Monitor</title>
    <link rel="stylesheet" href="<?= e(app_url('assets/css/app.css')) ?>">
    <link
    rel="icon"
    type="image/png"
    href="<?= e(app_url('assets/images/logo.png')) ?>"
>
</head>
<body class="auth-body">
    <div class="card auth-card">
        <div class="auth-logo">
    <img
        src="<?= e(app_url('assets/images/logo.png')) ?>"
        alt="Logo Academic Monitor"
    >
</div>
        <h1>Academic Monitor</h1>
        <p>
            Dashboard monitoring akademik multi kelas, mata kuliah, mahasiswa,
            presensi, tugas, nilai, analitik, KKN/MBKM, dan administrasi sistem.
        </p>

        <?php foreach ($flashes as $flashItem): ?>
            <div class="alert <?= e($flashItem['type']) ?>"><?= e($flashItem['message']) ?></div>
        <?php endforeach; ?>

        <form method="post">
            <?= Csrf::field() ?>

            <div class="field">
                <label>Username</label>
                <input name="username" autocomplete="username" required autofocus>
            </div>

            <div class="field" style="margin-top:12px">
                <label>Password</label>
                <div class="toolbar">
                    <input id="loginPassword" name="password" type="password" autocomplete="current-password" required style="flex:1">
                    <button class="btn" type="button" data-toggle-password="loginPassword">Lihat</button>
                </div>
            </div>

            <button class="btn primary" type="submit" style="width:100%;margin-top:18px">
                Masuk
            </button>
        </form>


        <div class="login-divider">
            <span>atau</span>
        </div>

        <a
            class="btn student-portal-login-button"
            href="<?= e(app_url('portal.php')) ?>"
        >
            🎓 Portal Mahasiswa
        </a>

        <p class="login-student-help">
            Mahasiswa tidak perlu login.
            Masukkan NIM untuk melihat progres akademik.
        </p>

    </div>

    <script src="<?= e(app_url('assets/js/app.js')) ?>"></script>
</body>
</html>
