<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/app/bootstrap.php';

Auth::requireLogin();

$pdo = Database::connection();
$repository = new Repository($pdo);
$analyticsService = new AnalyticsService();
$user = Auth::user();
$type = (string) ($_GET['type'] ?? '');
$classId = filter_input(INPUT_GET, 'class_id', FILTER_VALIDATE_INT) ?: 0;

if (($user['role'] ?? '') === 'mahasiswa') {
    http_response_code(403);
    exit('Akun mahasiswa tidak memiliki akses ke export kelas.');
}

$availableClasses = $repository->classesForUser($user);
$allowedClassIds = array_map(
    static fn (array $class): int => (int) $class['id'],
    $availableClasses
);

if ($type !== 'student_template') {
    if (!in_array($classId, $allowedClassIds, true)) {
        http_response_code(403);
        exit('Anda tidak memiliki akses ke kelas tersebut.');
    }
}

function send_download(string $filename, string $content, string $mime): never
{
    header('Content-Type: ' . $mime);
    header('Content-Disposition: attachment; filename="' . str_replace('"', '', $filename) . '"');
    header('Content-Length: ' . strlen($content));
    echo $content;
    exit;
}

function slug_filename(string $value): string
{
    $value = strtolower(trim($value));
    $value = preg_replace('/[^a-z0-9]+/', '_', $value) ?? 'data';
    return trim($value, '_') ?: 'data';
}

if ($type === 'student_template') {
    $content = implode("\n", [
        'nim,nama,status,pembayaran,ipk,target_ipk,pc,github,colab,drive,email,telepon,catatan',
        '2524999,Nama Mahasiswa,Aktif,Lunas,3.50,3.75,PC01,https://github.com/user/repo,https://colab.research.google.com/drive/xxxxx,https://drive.google.com/file/d/xxxxx/view,email@kampus.ac.id,08123456789,Catatan',
    ]);
    send_download('template_mahasiswa.csv', $content, 'text/csv; charset=UTF-8');
}

$class = $repository->classContext($classId);
if (!$class) {
    http_response_code(404);
    exit('Kelas tidak ditemukan.');
}

$students = $repository->studentsForClass($classId);
$attendance = $repository->attendanceForClass($classId);
$tasks = $repository->tasksForClass($classId);
$taskRecords = $repository->taskRecordsForClass($classId);
$settings = $repository->settings();
$analytics = $analyticsService->build(
    $class,
    $students,
    $tasks,
    $taskRecords,
    $attendance,
    $settings
);

$slug = slug_filename($class['name']);

switch ($type) {
    case 'students':
        $head = [
            'nim',
            'nama',
            'status',
            'pembayaran',
            'ipk',
            'target_ipk',
            'pc',
            'github',
            'colab',
            'drive',
            'email',
            'telepon',
            'catatan',
        ];

        $lines = [implode(',', array_map('csv_cell', $head))];
        foreach ($students as $student) {
            $lines[] = implode(',', array_map('csv_cell', [
                $student['nim'],
                $student['name'],
                $student['registration_status'],
                $student['payment_status'],
                $student['gpa'],
                $student['target_gpa'],
                $student['pc'],
                $student['github_url'],
                $student['colab_url'],
                $student['drive_url'],
                $student['email'],
                $student['phone'],
                $student['note'],
            ]));
        }

        send_download("mahasiswa_{$slug}.csv", implode("\n", $lines), 'text/csv; charset=UTF-8');

    case 'attendance':
        $head = ['nim', 'nama'];
        for ($meeting = 1; $meeting <= (int) $class['meetings']; $meeting++) {
            $head[] = 'pertemuan_' . $meeting;
        }

        $statusMap = ['H' => 'Hadir', 'I' => 'Izin', 'S' => 'Sakit', 'A' => 'Alpa'];
        $lines = [implode(',', array_map('csv_cell', $head))];

        foreach ($students as $student) {
            $row = [$student['nim'], $student['name']];
            for ($meeting = 1; $meeting <= (int) $class['meetings']; $meeting++) {
                $status = $analytics['attendance_map'][(int) $student['enrollment_id']][$meeting] ?? null;
                $row[] = $statusMap[$status] ?? 'Belum';
            }
            $lines[] = implode(',', array_map('csv_cell', $row));
        }

        send_download("presensi_{$slug}.csv", implode("\n", $lines), 'text/csv; charset=UTF-8');

    case 'tasks':
        $head = ['nim', 'nama'];
        foreach ($tasks as $task) {
            $head[] = $task['name'] . '_status';
            $head[] = $task['name'] . '_nilai';
            $head[] = $task['name'] . '_catatan';
            $head[] = $task['name'] . '_github';
            $head[] = $task['name'] . '_colab';
            $head[] = $task['name'] . '_drive';
        }

        $lines = [implode(',', array_map('csv_cell', $head))];
        foreach ($students as $student) {
            $row = [$student['nim'], $student['name']];

            foreach ($tasks as $task) {
                $record = $analytics['task_records_map'][(int) $task['id']][(int) $student['enrollment_id']] ?? [];
                $row[] = $record['status'] ?? 'pending';
                $row[] = $record['score'] ?? '';
                $row[] = $record['note'] ?? '';
                $row[] = $record['github_url'] ?? '';
                $row[] = $record['colab_url'] ?? '';
                $row[] = $record['drive_url'] ?? '';
            }

            $lines[] = implode(',', array_map('csv_cell', $row));
        }

        send_download("nilai_{$slug}.csv", implode("\n", $lines), 'text/csv; charset=UTF-8');

    case 'siakad':
        $headers = array_values(array_filter(array_map(
            'trim',
            explode(',', $settings['siakad_headers'] ?? 'nim,nama,tugas,uts,uas,nilai_akhir,nilai_huruf')
        )));

        $lines = [implode(',', array_map('csv_cell', $headers))];

        foreach ($students as $student) {
            $enrollmentId = (int) $student['enrollment_id'];
            $prediction = $analytics['students'][$enrollmentId]['prediction'];

            $taskAverage = $analyticsService->typeAverage(
                $tasks,
                $analytics['task_records_map'],
                $enrollmentId,
                static fn (array $task): bool => !in_array(strtoupper((string) $task['type']), ['UTS', 'UAS'], true)
            );
            $utsAverage = $analyticsService->typeAverage(
                $tasks,
                $analytics['task_records_map'],
                $enrollmentId,
                static fn (array $task): bool => strtoupper((string) $task['type']) === 'UTS'
            );
            $uasAverage = $analyticsService->typeAverage(
                $tasks,
                $analytics['task_records_map'],
                $enrollmentId,
                static fn (array $task): bool => strtoupper((string) $task['type']) === 'UAS'
            );

            $map = [
                'nim' => $student['nim'],
                'nama' => $student['name'],
                'tugas' => $taskAverage === null ? '' : number_format($taskAverage, 2, '.', ''),
                'uts' => $utsAverage === null ? '' : number_format($utsAverage, 2, '.', ''),
                'uas' => $uasAverage === null ? '' : number_format($uasAverage, 2, '.', ''),
                'nilai_akhir' => number_format((float) $prediction['estimated'], 2, '.', ''),
                'nilai_huruf' => $analyticsService->gradeLetter((float) $prediction['estimated']),
                'kelas' => $class['name'],
                'mata_kuliah' => $class['course_name'],
                'kode_mk' => $class['course_code'],
                'prodi' => $class['program_name'],
            ];

            $row = [];
            foreach ($headers as $header) {
                $row[] = $map[strtolower($header)] ?? '';
            }
            $lines[] = implode(',', array_map('csv_cell', $row));
        }

        send_download("siakad_{$slug}.csv", implode("\n", $lines), 'text/csv; charset=UTF-8');

    case 'backup':
        $settingsRaw = $repository->settings();
        $backup = [
            'version' => 4,
            'settings' => [
                'institution' => $settingsRaw['institution'] ?? '',
                'defaultLecturer' => $settingsRaw['default_lecturer'] ?? '',
                'defaultPassThreshold' => (float) ($settingsRaw['default_pass_threshold'] ?? 60),
                'trendDropThreshold' => (float) ($settingsRaw['trend_drop_threshold'] ?? 10),
                'siakadHeaders' => $settingsRaw['siakad_headers'] ?? 'nim,nama,tugas,uts,uas,nilai_akhir,nilai_huruf',
            ],
            'programs' => [],
            'courses' => [],
            'classes' => [],
            'activeClassId' => 'class_' . $classId,
            'classData' => [],
        ];

        $allPrograms = $repository->programs();
        $allCourses = $repository->courses();

        foreach ($allPrograms as $program) {
            $backup['programs'][] = [
                'id' => 'program_' . $program['id'],
                'code' => $program['code'],
                'name' => $program['name'],
                'faculty' => $program['faculty'],
            ];
        }

        foreach ($allCourses as $course) {
            $backup['courses'][] = [
                'id' => 'course_' . $course['id'],
                'code' => $course['code'],
                'name' => $course['name'],
                'credits' => (int) $course['credits'],
                'programId' => 'program_' . $course['program_id'],
            ];
        }

        foreach ($availableClasses as $classOption) {
            $cid = (int) $classOption['id'];
            $context = $repository->classContext($cid);
            if (!$context) {
                continue;
            }

            $backup['classes'][] = [
                'id' => 'class_' . $cid,
                'name' => $context['name'],
                'programId' => 'program_' . $context['program_id'],
                'courseId' => 'course_' . $context['course_id'],
                'semester' => $context['semester'],
                'academicYear' => $context['academic_year'],
                'target' => (int) $context['target'],
                'meetings' => (int) $context['meetings'],
                'lecturer' => $context['lecturer'],
                'passThreshold' => (float) $context['pass_threshold'],
            ];

            $classStudents = $repository->studentsForClass($cid);
            $classAttendance = $repository->attendanceForClass($cid);
            $classTasks = $repository->tasksForClass($cid);
            $classRecords = $repository->taskRecordsForClass($cid);
            $classEvents = $repository->eventsForClass($cid);
            $classSpecial = $repository->specialActivitiesForClass($cid);
            $classLogs = $repository->logsForClass($cid, 1000);

            $specialMap = [];
            foreach ($classSpecial as $special) {
                $specialMap[(int) $special['enrollment_id']] = $special;
            }

            $studentItems = [];
            foreach ($classStudents as $student) {
                $special = $specialMap[(int) $student['enrollment_id']] ?? null;
                $studentItems[] = [
                    'id' => 'e' . $student['enrollment_id'],
                    'nim' => $student['nim'],
                    'name' => $student['name'],
                    'registrationStatus' => $student['registration_status'],
                    'paymentStatus' => $student['payment_status'],
                    'gpa' => $student['gpa'] ?? '',
                    'targetGpa' => $student['target_gpa'] ?? '',
                    'pc' => $student['pc'] ?? '',
                    'github' => $student['github_url'] ?? '',
                    'colab' => $student['colab_url'] ?? '',
                    'drive' => $student['drive_url'] ?? '',
                    'email' => $student['email'],
                    'phone' => $student['phone'],
                    'note' => $student['note'] ?? '',
                    'special' => [
                        'type' => $special['type'] ?? 'KKN',
                        'status' => $special['status'] ?? 'Belum Mengikuti',
                        'location' => $special['location'] ?? '',
                        'supervisor' => $special['supervisor'] ?? '',
                        'progress' => (int) ($special['progress'] ?? 0),
                        'note' => $special['note'] ?? '',
                    ],
                ];
            }

            $attendanceMap = [];
            foreach ($classAttendance as $row) {
                $key = 'm' . $row['meeting'];
                $attendanceMap[$key]['e' . $row['enrollment_id']] = $row['status'];
            }

            $taskItems = [];
            foreach ($classTasks as $task) {
                $taskItems[] = [
                    'id' => 't' . $task['id'],
                    'name' => $task['name'],
                    'type' => $task['type'],
                    'weight' => (float) $task['weight'],
                    'maxScore' => (float) $task['max_score'],
                    'meeting' => $task['meeting'] ? (int) $task['meeting'] : 0,
                    'due' => $task['due_date'] ?? '',
                    'description' => $task['description'] ?? '',
                ];
            }

            $recordsMap = [];
            foreach ($classRecords as $record) {
                $recordsMap['t' . $record['task_id']]['e' . $record['enrollment_id']] = [
                    'status' => $record['status'],
                    'score' => $record['score'] ?? '',
                    'note' => $record['note'] ?? '',
                    'github' => $record['github_url'] ?? '',
                    'colab' => $record['colab_url'] ?? '',
                    'drive' => $record['drive_url'] ?? '',
                ];
            }

            $eventItems = [];
            foreach ($classEvents as $event) {
                $eventItems[] = [
                    'id' => 'event_' . $event['id'],
                    'title' => $event['title'],
                    'type' => $event['type'],
                    'date' => $event['event_date'],
                    'time' => $event['event_time'] ? substr($event['event_time'], 0, 5) : '',
                    'location' => $event['location'],
                    'description' => $event['description'] ?? '',
                ];
            }

            $logItems = [];
            foreach ($classLogs as $log) {
                $logItems[] = [
                    'type' => $log['type'],
                    'text' => $log['text'],
                    'time' => date(DATE_ATOM, strtotime((string) $log['created_at'])),
                ];
            }

            $backup['classData']['class_' . $cid] = [
                'students' => $studentItems,
                'attendance' => $attendanceMap,
                'tasks' => $taskItems,
                'taskRecords' => $recordsMap,
                'events' => $eventItems,
                'logs' => $logItems,
            ];
        }

        send_download(
            'backup_monitoring_akademik.json',
            json_encode($backup, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
            'application/json; charset=UTF-8'
        );

    default:
        http_response_code(400);
        exit('Jenis export tidak dikenali.');
}
