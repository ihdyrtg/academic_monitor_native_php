<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/app/bootstrap.php';

Auth::requireLogin();

$pdo = Database::connection();
$repository = new Repository($pdo);
$analyticsService = new AnalyticsService();
$user = Auth::user();
$availableClasses = $repository->classesForUser($user);

if ($availableClasses === []) {
    http_response_code(403);
    $title = 'Belum Ada Kelas';
    $page = 'overview';
    $classContext = [];
    require APP_ROOT . '/views/partials/layout_start.php';
    echo '<div class="card empty-state">Akun ini belum memiliki akses ke kelas mana pun. Hubungi administrator.</div>';
    require APP_ROOT . '/views/partials/layout_end.php';
    exit;
}

$allowedClassIds = array_map(
    static fn (array $class): int => (int) $class['id'],
    $availableClasses
);

$requestedClassId = filter_input(INPUT_GET, 'class_id', FILTER_VALIDATE_INT);
$preferredClassId = (int) ($repository->preference((int) $user['id'], 'active_class_id') ?? 0);

$classId = $requestedClassId ?: $preferredClassId;
if (!in_array($classId, $allowedClassIds, true)) {
    $classId = (int) $availableClasses[0]['id'];
}

if ($requestedClassId && in_array((int) $requestedClassId, $allowedClassIds, true)) {
    $repository->setPreference((int) $user['id'], 'active_class_id', (string) $classId);
}

$classContext = $repository->classContext($classId);
if (!$classContext) {
    http_response_code(404);
    exit('Kelas tidak ditemukan.');
}

$staffPages = [
    'overview',
    'master',
    'students',
    'attendance',
    'tasks',
    'calendar',
    'analytics',
    'special',
    'seating',
    'portal',
    'activity',
    'settings',
];
$page = (string) ($_GET['page'] ?? 'overview');

if (($user['role'] ?? '') === 'mahasiswa') {
    $page = 'portal';
} elseif (!in_array($page, $staffPages, true)) {
    $page = 'overview';
}

$settings = $repository->settings();
$students = $repository->studentsForClass($classId);
$attendance = $repository->attendanceForClass($classId);
$tasks = $repository->tasksForClass($classId);
$taskRecords = $repository->taskRecordsForClass($classId);
$events = $repository->eventsForClass($classId);
$specialActivities = $repository->specialActivitiesForClass($classId);
$logs = $repository->logsForClass($classId);
$programs = $repository->programs();
$courses = $repository->courses();
$classes = $repository->classes();

$analytics = $analyticsService->build(
    $classContext,
    $students,
    $tasks,
    $taskRecords,
    $attendance,
    $settings
);

$meeting = filter_input(INPUT_GET, 'meeting', FILTER_VALIDATE_INT) ?: 1;
$meeting = max(1, min((int) $classContext['meetings'], $meeting));

$titleMap = [
    'overview' => 'Ringkasan Kelas',
    'master' => 'Master Akademik',
    'students' => 'Mahasiswa',
    'attendance' => 'Presensi',
    'tasks' => 'Tugas & Nilai',
    'calendar' => 'Kalender Akademik',
    'analytics' => 'Analitik & Prediksi',
    'special' => 'KKN / MBKM',
    'seating' => 'Denah Duduk',
    'portal' => 'Portal Mahasiswa',
    'activity' => 'Aktivitas',
    'settings' => 'Pengaturan',
];
$title = ($titleMap[$page] ?? 'Dashboard') . ' - ' . $classContext['name'];

require APP_ROOT . '/views/partials/layout_start.php';
require APP_ROOT . '/views/pages/' . $page . '.php';
require APP_ROOT . '/views/partials/layout_end.php';
