<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/app/bootstrap.php';

header('Cache-Control: no-store, private, max-age=0');
header('Pragma: no-cache');
header('X-Robots-Tag: noindex, nofollow, noarchive');
header('Referrer-Policy: no-referrer');

$repository = new Repository(Database::connection());
$analyticsService = new AnalyticsService();

$errorMessage = '';

$_SESSION['portal_nim_attempt'] ??= [
    'count' => 0,
    'started_at' => time(),
];

if (time() - (int) $_SESSION['portal_nim_attempt']['started_at'] > 600) {
    $_SESSION['portal_nim_attempt'] = [
        'count' => 0,
        'started_at' => time(),
    ];
}

if (isset($_GET['logout'])) {
    unset($_SESSION['portal_student_id']);
    redirect('portal.php');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    Csrf::enforce();

    $nim = trim((string) ($_POST['nim'] ?? ''));

    if ((int) $_SESSION['portal_nim_attempt']['count'] >= 20) {
        $errorMessage =
            'Terlalu banyak percobaan. Silakan coba kembali beberapa menit lagi.';
    } elseif ($nim === '') {
        $errorMessage = 'NIM wajib diisi.';
    } elseif (preg_match('/^[A-Za-z0-9._-]{3,50}$/', $nim) !== 1) {
        $errorMessage = 'Format NIM tidak valid.';
    } else {
        $_SESSION['portal_nim_attempt']['count']++;

        $matchedStudentId = 0;

        foreach ($repository->classes() as $class) {
            $enrollment = $repository->enrollmentByNim(
                (int) $class['id'],
                $nim
            );

            if (!$enrollment) {
                continue;
            }

            $matchedStudentId = (int) $enrollment['student_id'];
            break;
        }

        if ($matchedStudentId <= 0) {
            $errorMessage = 'NIM tidak ditemukan.';
        } else {
            session_regenerate_id(true);

            $_SESSION['portal_student_id'] = $matchedStudentId;
            $_SESSION['portal_nim_attempt'] = [
                'count' => 0,
                'started_at' => time(),
            ];

            redirect('portal.php');
        }
    }
}

$portalStudentId = (int) ($_SESSION['portal_student_id'] ?? 0);
$availableEnrollments = [];
$portalData = null;

if ($portalStudentId > 0) {
    foreach ($repository->classes() as $class) {
        $classId = (int) $class['id'];

        $enrollment = $repository->enrollmentForStudent(
            $classId,
            $portalStudentId
        );

        if (!$enrollment) {
            continue;
        }

        $classContext = $repository->classContext($classId);

        if (!$classContext) {
            continue;
        }

        $availableEnrollments[] = [
            'class' => $classContext,
            'enrollment' => $enrollment,
        ];
    }

    if ($availableEnrollments !== []) {
        $requestedClassId = filter_input(
            INPUT_GET,
            'class_id',
            FILTER_VALIDATE_INT
        );

        $selected = $availableEnrollments[0];

        if ($requestedClassId) {
            foreach ($availableEnrollments as $candidate) {
                if ((int) $candidate['class']['id'] === (int) $requestedClassId) {
                    $selected = $candidate;
                    break;
                }
            }
        }

        $classContext = $selected['class'];
        $student = $selected['enrollment'];
        $classId = (int) $classContext['id'];
        $enrollmentId = (int) $student['enrollment_id'];

        $students = $repository->studentsForClass($classId);
        $attendance = $repository->attendanceForClass($classId);
        $tasks = $repository->tasksForClass($classId);
        $taskRecords = $repository->taskRecordsForClass($classId);
        $settings = $repository->settings();

        $analytics = $analyticsService->build(
            $classContext,
            $students,
            $tasks,
            $taskRecords,
            $attendance,
            $settings
        );

        $studentAnalytics = $analytics['students'][$enrollmentId] ?? null;

        if ($studentAnalytics) {
            $portalData = [
                'class' => $classContext,
                'student' => $student,
                'tasks' => $tasks,
                'analytics' => $analytics,
                'student_analytics' => $studentAnalytics,
                'enrollment_id' => $enrollmentId,
            ];
        }
    }
}

$settings = $repository->settings();
$institution = $settings['institution'] ?? 'Academic Monitor';
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="robots" content="noindex,nofollow,noarchive">
    <meta name="theme-color" content="#0f766e">
    <title>Portal Mahasiswa - Academic Monitor</title>

    <link
        rel="stylesheet"
        href="<?= e(app_url('assets/css/app.css')) ?>"
    >
    
    <link
    rel="icon"
    type="image/png"
    href="<?= e(app_url('assets/images/logo.png')) ?>"
>
</head>
<body class="student-portal-body">

<header class="student-portal-header">
    <div class="student-portal-header-inner">
        <div class="student-portal-brand">
            <div class="student-portal-logo">
    <img
        src="<?= e(app_url('assets/images/logo.png')) ?>"
        alt="Logo Academic Monitor"
    >
</div>

            <div>
                <strong><?= e($institution) ?></strong>
                <small>Portal Monitoring Mahasiswa</small>
            </div>
        </div>

        <?php if ($portalStudentId > 0): ?>
            <a
                class="btn"
                href="<?= e(app_url('portal.php?logout=1')) ?>"
            >
                Ganti NIM
            </a>
        <?php else: ?>

        <?php endif; ?>
    </div>
</header>

<main class="student-portal-main">

<?php if ($portalStudentId <= 0): ?>

    <section class="student-portal-welcome">
        <div class="student-portal-title">
            <span class="badge info">PORTAL MAHASISWA</span>

            <h1>Cek Progres Akademik</h1>

            <p>
                Masukkan NIM untuk melihat presensi,
                progres tugas, nilai, predikat, dan feedback akademik.
            </p>
        </div>

        <div class="card student-portal-login">
            <?php if ($errorMessage !== ''): ?>
                <div class="alert danger">
                    <?= e($errorMessage) ?>
                </div>
            <?php endif; ?>

            <form method="post">
                <?= Csrf::field() ?>

                <div class="field">
                    <label>NIM</label>
                    <input
                        type="text"
                        name="nim"
                        placeholder="Masukkan NIM"
                        autocomplete="off"
                        maxlength="50"
                        required
                        autofocus
                    >
                </div>

                <button
                    class="btn primary"
                    type="submit"
                    style="width:100%;margin-top:16px"
                >
                    Buka Dashboard Saya
                </button>
            </form>

            <p class="student-portal-security">
                Portal bersifat hanya-baca. Mahasiswa tidak dapat
                mengubah presensi, tugas, atau nilai.
            </p>
        </div>
    </section>

<?php elseif (!$portalData): ?>

    <div class="card empty-state">
        Data akademik mahasiswa tidak ditemukan.
    </div>

<?php else: ?>

<?php
$classContext = $portalData['class'];
$student = $portalData['student'];
$tasks = $portalData['tasks'];
$analytics = $portalData['analytics'];
$studentAnalytics = $portalData['student_analytics'];
$enrollmentId = (int) $portalData['enrollment_id'];

$prediction = $studentAnalytics['prediction'];
$attendanceRate = $studentAnalytics['attendance_rate'];
$taskProgress = (int) ($studentAnalytics['task_completion'] ?? 0);

$attendanceProgress = $attendanceRate === null
    ? 0
    : max(0, min(100, (int) $attendanceRate));

$gradeProgress = max(
    0,
    min(100, (int) round((float) $prediction['estimated']))
);
?>

<div class="portal-shell">
    <div class="student-portal-toolbar">
        <div>
            <span class="badge ok">DATA DITEMUKAN</span>

            <h2><?= e(display_name($student)) ?></h2>

            <p>
                <?= e($student['nim']) ?>
                •
                <?= e($classContext['course_name']) ?>
            </p>
        </div>
    </div>

    <?php if (count($availableEnrollments) > 1): ?>
        <div class="card section-card" style="margin-bottom:16px">
            <form method="get">
                <div class="field">
                    <label>Mata Kuliah / Kelas</label>

                    <select
                        name="class_id"
                        onchange="this.form.submit()"
                    >
                        <?php foreach ($availableEnrollments as $item): ?>
                            <?php $itemClass = $item['class']; ?>

                            <option
                                value="<?= (int) $itemClass['id'] ?>"
                                <?= selected($itemClass['id'], $classContext['id']) ?>
                            >
                                <?= e($itemClass['name']) ?>
                                —
                                <?= e($itemClass['course_name']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </form>
        </div>
    <?php endif; ?>

    <div class="student-progress-grid">
        <div class="card progress-card">
            <div class="progress-card-head">
                <span>Kehadiran</span>
                <strong><?= $attendanceProgress ?>%</strong>
            </div>

            <div class="portal-progress">
                <div
                    class="portal-progress-fill attendance"
                    style="width:<?= $attendanceProgress ?>%"
                ></div>
            </div>

            <small>Persentase presensi yang tercatat hadir.</small>
        </div>

        <div class="card progress-card">
            <div class="progress-card-head">
                <span>Tugas</span>
                <strong><?= $taskProgress ?>%</strong>
            </div>

            <div class="portal-progress">
                <div
                    class="portal-progress-fill task"
                    style="width:<?= $taskProgress ?>%"
                ></div>
            </div>

            <small>Progres komponen yang sudah dikumpulkan/dinilai.</small>
        </div>

        <div class="card progress-card">
            <div class="progress-card-head">
                <span>Estimasi Nilai</span>
                <strong><?= $gradeProgress ?>%</strong>
            </div>

            <div class="portal-progress">
                <div
                    class="portal-progress-fill grade"
                    style="width:<?= $gradeProgress ?>%"
                ></div>
            </div>

            <small><?= e($prediction['status']) ?></small>
        </div>
    </div>

    <div class="portal-profile" style="margin-top:16px">
        <div class="card profile-card">
            <div class="section-title">
                <h4>Profil Akademik</h4>
                <span><?= e($classContext['name']) ?></span>
            </div>

            <dl class="profile-kv">
                <dt>Nama</dt>
                <dd><?= e(display_name($student)) ?></dd>

                <dt>NIM</dt>
                <dd><?= e($student['nim']) ?></dd>

                <dt>Status</dt>
                <dd><?= e($student['registration_status']) ?></dd>

                <dt>Mata Kuliah</dt>
                <dd><?= e($classContext['course_name']) ?></dd>

                <dt>Posisi Duduk</dt>
                <dd><?= e($student['pc'] ?: 'Belum ditentukan') ?></dd>
            </dl>
        </div>

        <div class="card profile-card">
            <div class="section-title">
                <h4>Ringkasan Akademik</h4>
            </div>

            <div class="metric-list">
                <div class="metric-row">
                    <span>Kehadiran</span>
                    <strong>
                        <?= $attendanceRate === null
                            ? 'Belum ada'
                            : (int) $attendanceRate . '%' ?>
                    </strong>
                </div>

                <div class="metric-row">
                    <span>Progres tugas</span>
                    <strong><?= $taskProgress ?>%</strong>
                </div>

                <div class="metric-row">
                    <span>Estimasi akhir</span>
                    <strong>
                        <?= e(number_format(
                            (float) $prediction['estimated'],
                            1
                        )) ?>
                        (<?= e($analyticsService->gradeLetter(
                            (float) $prediction['estimated']
                        )) ?>)
                    </strong>
                </div>
            </div>
        </div>
    </div>

    <div class="card table-card" style="margin-top:16px">
        <div class="table-tools">
            <strong>Presensi Saya</strong>
        </div>

        <div class="table-wrap portal-attendance-scroll">
            <table class="portal-attendance-table" data-no-sort>
                <thead>
                <tr>
                    <?php for (
                        $meeting = 1;
                        $meeting <= (int) $classContext['meetings'];
                        $meeting++
                    ): ?>
                        <th>P<?= $meeting ?></th>
                    <?php endfor; ?>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <?php for (
                        $meeting = 1;
                        $meeting <= (int) $classContext['meetings'];
                        $meeting++
                    ): ?>
                        <?php
                        $status = $analytics['attendance_map']
                            [$enrollmentId][$meeting] ?? '';

                        $label = match ($status) {
                            'H' => 'Hadir',
                            'I' => 'Izin',
                            'S' => 'Sakit',
                            'A' => 'Alpa',
                            default => 'Belum',
                        };

                        $tone = match ($status) {
                            'H' => 'ok',
                            'I' => 'info',
                            'S' => 'warn',
                            'A' => 'danger',
                            default => 'neutral',
                        };
                        ?>

                        <td>
                            <span class="badge <?= e($tone) ?>">
                                <?= e($label) ?>
                            </span>
                        </td>
                    <?php endfor; ?>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card table-card" style="margin-top:16px">
        <div class="table-tools">
            <strong>Tugas & Nilai Saya</strong>
        </div>

        <div class="table-wrap">

        <table class="student-rubric-table public-student-rubric-table">

            <thead>
                <tr>
                    <th>KOMPONEN</th>
                    <th>BOBOT</th>
                    <th>LINK</th>
                    <th>STATUS</th>
                    <th>NILAI</th>
                    <th>PREDIKAT</th>
                    <th>CATATAN DOSEN</th>
                </tr>
            </thead>


            <tbody>

            <?php if ($tasks === []): ?>

                <tr>
                    <td
                        colspan="7"
                        style="
                            text-align:center;
                            padding:24px;
                            color:#64748b;
                        "
                    >
                        Belum ada komponen penilaian.
                    </td>
                </tr>

            <?php else: ?>


                <?php foreach ($tasks as $task): ?>

                    <?php

                    /*
                    |--------------------------------------------------------------------------
                    | RECORD TUGAS MAHASISWA
                    |--------------------------------------------------------------------------
                    */

                    $record =
                        $analytics['task_records_map']
                        [(int) $task['id']]
                        [$enrollmentId]
                        ?? [
                            'status' => 'pending',
                            'score' => null,
                            'note' => '',
                            'github_url' => null,
                            'colab_url' => null,
                            'drive_url' => null,
                        ];


                    /*
                    |--------------------------------------------------------------------------
                    | STATUS
                    |--------------------------------------------------------------------------
                    */

                    $recordStatus = strtolower(
                        trim(
                            (string) (
                                $record['status']
                                ?? 'pending'
                            )
                        )
                    );


                    $statusLabel = match ($recordStatus) {

                        'submitted' => 'Dikumpulkan',

                        'graded' => 'Dinilai',

                        'late' => 'Terlambat',

                        default => 'Belum',
                    };


                    $statusTone = match ($recordStatus) {

                        'submitted' => 'info',

                        'graded' => 'ok',

                        'late' => 'danger',

                        default => 'neutral',
                    };


                    /*
                    |--------------------------------------------------------------------------
                    | NILAI
                    |--------------------------------------------------------------------------
                    */

                    $score =
                        $record['score']
                        ?? null;


                    $maxScore =
                        isset($task['max_score'])
                        && (float) $task['max_score'] > 0

                        ? (float) $task['max_score']

                        : 100;


                    $assessment = $analyticsService->practicumAssessment(
                        $score === null || $score === ''
                            ? null
                            : (float) $score,
                        $maxScore
                    );


                    /*
                    |--------------------------------------------------------------------------
                    | CATATAN DOSEN
                    |--------------------------------------------------------------------------
                    */

                    $teacherNote =
                        trim(
                            (string) (
                                $record['note']
                                ?? ''
                            )
                        );


                    /*
                    |--------------------------------------------------------------------------
                    | LINK MAHASISWA
                    |--------------------------------------------------------------------------
                    */

                    $resourceData = [

                        'github_url' =>
                            !empty($record['github_url'])

                            ? $record['github_url']

                            : (
                                $student['github_url']
                                ?? null
                            ),


                        'colab_url' =>
                            !empty($record['colab_url'])

                            ? $record['colab_url']

                            : (
                                $student['colab_url']
                                ?? null
                            ),


                        'drive_url' =>
                            !empty($record['drive_url'])

                            ? $record['drive_url']

                            : (
                                $student['drive_url']
                                ?? null
                            ),

                    ];

                    ?>


                    <tr>

                        <!-- =========================
                             KOMPONEN
                             ========================= -->

                        <td>

                            <strong>
                                <?= e(
                                    (string) $task['name']
                                ) ?>
                            </strong>

                        </td>


                        <!-- =========================
                             BOBOT
                             ========================= -->

                        <td>

                            <?= e(
                                number_format(
                                    (float) (
                                        $task['weight']
                                        ?? 0
                                    ),
                                    2
                                )
                            ) ?>%

                        </td>


                        <!-- =========================
                             LINK
                             ========================= -->

                        <td>

                            <?= resource_links(
                                $resourceData,
                                true
                            ) ?>

                        </td>


                        <!-- =========================
                             STATUS
                             ========================= -->

                        <td>

                            <span
                                class="badge <?= e($statusTone) ?>"
                            >
                                <?= e($statusLabel) ?>
                            </span>

                        </td>


                        <!-- =========================
                             NILAI
                             ========================= -->

                        <td>

                            <?php
                            if (
                                $score === null
                                || $score === ''
                            ):
                            ?>

                                <span
                                    style="color:#94a3b8"
                                >
                                    —
                                </span>

                            <?php else: ?>

                                <strong>

                                    <?= e(
                                        number_format(
                                            (float) $score,
                                            2
                                        )
                                    ) ?>

                                    /

                                    <?= e(
                                        number_format(
                                            $maxScore,
                                            2
                                        )
                                    ) ?>

                                </strong>

                            <?php endif; ?>

                        </td>


                        <!-- =========================
                             PREDIKAT
                             ========================= -->

                        <td>

                            <?php if ($assessment === null): ?>

                                <span class="rubric-badge rubric-empty">
                                    —
                                </span>

                            <?php else: ?>

                                <span
                                    class="rubric-badge rubric-<?= e($assessment['tone']) ?>"
                                >
                                    <?= e($assessment['icon'] . ' ' . $assessment['predicate']) ?>
                                </span>

                            <?php endif; ?>

                        </td>


                        <!-- =========================
                             CATATAN DOSEN
                             ========================= -->

                        <td
                            class="student-teacher-note"
                        >

                            <?php
                            if ($teacherNote !== ''):
                            ?>

                                <?= nl2br(
                                    e($teacherNote)
                                ) ?>

                            <?php else: ?>

                                <span
                                    style="color:#94a3b8"
                                >
                                    —
                                </span>

                            <?php endif; ?>

                        </td>

                    </tr>

                <?php endforeach; ?>


            <?php endif; ?>

            </tbody>

        </table>

    </div>

</div>
</div>

<?php endif; ?>

</main>
</body>
</html>
