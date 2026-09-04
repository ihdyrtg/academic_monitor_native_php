<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/app/bootstrap.php';

Auth::requireRole('admin');

$pdo = Database::connection();
$repository = new Repository($pdo);
$user = Auth::user();
$availableClasses = $repository->classesForUser($user);

$preferredClassId = (int) ($repository->preference((int) $user['id'], 'active_class_id') ?? 0);
$classId = $preferredClassId;
$availableIds = array_map(static fn (array $class): int => (int) $class['id'], $availableClasses);
if (!in_array($classId, $availableIds, true)) {
    $classId = (int) ($availableClasses[0]['id'] ?? 0);
}

$classContext = $classId > 0 ? $repository->classContext($classId) : [
    'id' => 0,
    'name' => 'Academic Monitor',
    'course_name' => 'Administrasi Sistem',
    'program_name' => 'Administrator',
];

$page = 'admin';
$section = (string) ($_GET['section'] ?? 'overview');
if (!in_array($section, ['overview', 'users', 'academic', 'settings'], true)) {
    $section = 'overview';
}

$counts = $repository->counts();
$programs = $repository->programs();
$courses = $repository->courses();
$classes = $repository->classes();
$users = $repository->users();
$allStudents = $repository->allStudents();
$settings = $repository->settings();

$editUser = null;
$editUserClassIds = [];
if (($editUserId = filter_input(INPUT_GET, 'edit_user', FILTER_VALIDATE_INT))) {
    $editUser = $repository->user((int) $editUserId);
    if ($editUser) {
        $editUserClassIds = $repository->userClassIds((int) $editUser['id']);
    }
}

$editProgram = null;
if (($id = filter_input(INPUT_GET, 'edit_program', FILTER_VALIDATE_INT))) {
    foreach ($programs as $item) {
        if ((int) $item['id'] === (int) $id) {
            $editProgram = $item;
            break;
        }
    }
}

$editCourse = null;
if (($id = filter_input(INPUT_GET, 'edit_course', FILTER_VALIDATE_INT))) {
    foreach ($courses as $item) {
        if ((int) $item['id'] === (int) $id) {
            $editCourse = $item;
            break;
        }
    }
}

$editClass = null;
if (($id = filter_input(INPUT_GET, 'edit_class', FILTER_VALIDATE_INT))) {
    foreach ($classes as $item) {
        if ((int) $item['id'] === (int) $id) {
            $editClass = $item;
            break;
        }
    }
}

$title = 'Administrasi Sistem';
require APP_ROOT . '/views/partials/layout_start.php';
?>
<div class="page-head">
    <div>
        <h3>Administrasi Sistem</h3>
        <p>
            Manajemen akun dan role, master akademik, konfigurasi sistem,
            migrasi, serta fondasi pengembangan fitur dashboard berikutnya.
        </p>
    </div>

    <div class="actions">
        <a class="btn" href="<?= e(app_url('dashboard.php')) ?>">← Dashboard</a>
        <a class="btn primary" href="<?= e(app_url('import_legacy.php')) ?>">↥ Migrasi Backup Lama</a>
    </div>
</div>

<div class="admin-tabs">
    <a class="<?= $section === 'overview' ? 'active' : '' ?>" href="<?= e(app_url('admin.php?section=overview')) ?>">Ringkasan</a>
    <a class="<?= $section === 'users' ? 'active' : '' ?>" href="<?= e(app_url('admin.php?section=users')) ?>">Users & Roles</a>
    <a class="<?= $section === 'academic' ? 'active' : '' ?>" href="<?= e(app_url('admin.php?section=academic')) ?>">Master Akademik</a>
    <a class="<?= $section === 'settings' ? 'active' : '' ?>" href="<?= e(app_url('admin.php?section=settings')) ?>">Pengaturan</a>
</div>

<?php require APP_ROOT . '/views/admin/' . $section . '.php'; ?>

<?php require APP_ROOT . '/views/partials/layout_end.php'; ?>
