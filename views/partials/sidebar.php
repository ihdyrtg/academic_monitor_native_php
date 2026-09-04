<aside class="sidebar" id="sidebar">
    <div class="brand">
        <div class="brand-mark">AM</div>
        <div>
            <h1><?= e($classContext['name'] ?? 'Academic Monitor') ?></h1>
            <p><?= e($classContext['course_name'] ?? 'Multi kelas • multi mata kuliah') ?></p>
        </div>
    </div>

    <nav class="nav">
        <?php if (($user['role'] ?? '') === 'mahasiswa'): ?>
            <a class="<?= $page === 'portal' ? 'active' : '' ?>" href="<?= e(app_url('dashboard.php?page=portal')) ?>">
                <span class="ico">◉</span> Dashboard Saya
            </a>
        <?php else: ?>
            <?php
            $menu = [
                'overview' => ['⌂', 'Ringkasan'],
                'master' => ['▦', 'Prodi / MK / Kelas'],
                'students' => ['👥', 'Mahasiswa'],
                'attendance' => ['✓', 'Presensi'],
                'tasks' => ['▣', 'Tugas & Nilai'],
                'calendar' => ['📅', 'Kalender Akademik'],
                'analytics' => ['📈', 'Analitik & Prediksi'],
                'special' => ['◎', 'KKN / MBKM'],
                'seating' => ['⌘', 'Denah Duduk'],
                'portal' => ['◉', 'Portal Mahasiswa'],
                'activity' => ['↻', 'Aktivitas'],
                'settings' => ['⚙', 'Pengaturan'],
            ];
            ?>
            <?php foreach ($menu as $menuPage => [$icon, $label]): ?>
                <a
                    class="<?= $page === $menuPage ? 'active' : '' ?>"
                    href="<?= e(app_url('dashboard.php?page=' . $menuPage . '&class_id=' . (int) ($classContext['id'] ?? 0))) ?>"
                >
                    <span class="ico"><?= e($icon) ?></span> <?= e($label) ?>
                </a>
            <?php endforeach; ?>

            <?php if (($user['role'] ?? '') === 'admin'): ?>
                <a href="<?= e(app_url('admin.php')) ?>">
                    <span class="ico">◆</span> Administrasi Sistem
                </a>
            <?php endif; ?>
        <?php endif; ?>
    </nav>

    <div class="side-note">
        <strong>PHP Native + MySQL</strong><br>
        Data tersimpan di database dan dilindungi autentikasi, CSRF, prepared statement,
        serta pembatasan role. Backup JSON dashboard lama tetap dapat dimigrasikan.
    </div>
</aside>
