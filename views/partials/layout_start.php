<?php
/** @var string $page */
/** @var array $user */
/** @var array $classContext */
/** @var array $availableClasses */
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta name="theme-color" content="#0f766e">
    <title><?= e($title ?? 'Dashboard Monitoring Akademik') ?></title>
    <link rel="stylesheet" href="<?= e(app_url('assets/css/app.css')) ?>">
</head>
<body>
<div class="app">
    <?php require APP_ROOT . '/views/partials/sidebar.php'; ?>

    <main class="main">
        <header class="topbar">
            <button class="btn mobile-menu" id="mobileMenu" type="button">☰</button>

            <div class="context">
                <strong><?= e($classContext['name'] ?? 'Kelas') ?></strong>
                <small>
                    <?= e($classContext['course_name'] ?? 'Mata Kuliah') ?>
                    •
                    <?= e($classContext['program_name'] ?? 'Prodi') ?>
                </small>
            </div>

            <div class="top-spacer"></div>

            <?php if (($user['role'] ?? '') !== 'mahasiswa' && $availableClasses !== []): ?>
                <form method="get" action="<?= e(app_url('dashboard.php')) ?>" class="toolbar">
                    <input type="hidden" name="page" value="<?= e($page) ?>">
                    <select class="context-select" id="activeClassSelect" name="class_id">
                        <?php foreach ($availableClasses as $classOption): ?>
                            <option
                                value="<?= (int) $classOption['id'] ?>"
                                <?= selected($classOption['id'], $classContext['id'] ?? 0) ?>
                            >
                                <?= e($classOption['name']) ?> — <?= e($classOption['course_name']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </form>
            <?php endif; ?>

            <div class="top-user">
                <div class="avatar"><?= e(initials((string) ($user['username'] ?? ''), (string) ($user['id'] ?? ''))) ?></div>
                <div class="top-user-meta">
                    <strong><?= e($user['username'] ?? '') ?></strong>
                    <small><?= e(ucfirst((string) ($user['role'] ?? ''))) ?></small>
                </div>
            </div>

            <?php if (($user['role'] ?? '') === 'admin'): ?>
                <a class="btn" href="<?= e(app_url('admin.php')) ?>">Admin</a>
            <?php endif; ?>

            <a class="btn" href="<?= e(app_url('logout.php')) ?>">Keluar</a>
        </header>

        <div class="content">
            <?php require APP_ROOT . '/views/partials/flash.php'; ?>
