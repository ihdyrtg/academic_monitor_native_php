<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/app/bootstrap.php';

Auth::requireLogin();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    exit('Method tidak diizinkan.');
}

Csrf::enforce();

$pdo = Database::connection();
$repository = new Repository($pdo);
$user = Auth::user();
$action = post_string('action');
$returnTo = safe_return_to($_POST['return_to'] ?? null);

function action_json(bool $ok, string $message, array $extra = []): never
{
    header('Content-Type: application/json; charset=UTF-8');
    http_response_code($ok ? 200 : 422);
    echo json_encode(['ok' => $ok, 'message' => $message] + $extra, JSON_UNESCAPED_UNICODE);
    exit;
}

function action_is_ajax(): bool
{
    return strtolower((string) ($_SERVER['HTTP_X_REQUESTED_WITH'] ?? '')) === 'xmlhttprequest';
}

function require_class_access(Repository $repository, array $user, int $classId): void
{
    $allowed = array_map(
        static fn (array $class): int => (int) $class['id'],
        $repository->classesForUser($user)
    );

    if (!in_array($classId, $allowed, true)) {
        http_response_code(403);
        exit('Anda tidak memiliki akses ke kelas tersebut.');
    }
}

function parse_uploaded_csv(string $path): array
{
    $contents = file_get_contents($path);
    if ($contents === false) {
        throw new RuntimeException('File CSV tidak dapat dibaca.');
    }

    $contents = preg_replace('/^\xEF\xBB\xBF/', '', $contents) ?? $contents;
    $firstLine = strtok($contents, "\r\n") ?: '';
    $delimiters = [',', ';', "\t"];
    $delimiter = ',';
    $maxCount = -1;

    foreach ($delimiters as $candidate) {
        $count = substr_count($firstLine, $candidate);
        if ($count > $maxCount) {
            $maxCount = $count;
            $delimiter = $candidate;
        }
    }

    $handle = fopen('php://temp', 'r+');
    if (!$handle) {
        throw new RuntimeException('Tidak dapat memproses CSV.');
    }
    fwrite($handle, $contents);
    rewind($handle);

    $rows = [];
    while (($row = fgetcsv($handle, 0, $delimiter, '"', '\\')) !== false) {
        if ($row === [null] || $row === []) {
            continue;
        }
        $rows[] = array_map(
            static fn ($cell): string => trim((string) $cell),
            $row
        );
    }
    fclose($handle);

    return $rows;
}

try {
    $classId = post_int('class_id');

    $classActions = [
        'student.save',
        'student.delete',
        'students.import_csv',
        'attendance.save',
        'attendance.mark_all',
        'task.save',
        'task.delete',
        'task_records.save',
        'event.save',
        'event.delete',
        'special.save',
        'seat.move',
        'logs.clear',
        'portal_pin.save',
        'portal_pin.clear',
    ];

    if (in_array($action, $classActions, true)) {
        Auth::requireRole('admin', 'dosen');
        require_class_access($repository, $user, $classId);
    }

    switch ($action) {
        case 'student.save':
            $nim = post_string('nim');
            if ($nim === '' || !preg_match('/^[A-Za-z0-9._-]{3,50}$/', $nim)) {
                throw new RuntimeException('NIM wajib diisi dan hanya boleh berisi huruf, angka, titik, garis bawah, atau tanda minus.');
            }

            $registrationStatus = post_string('registration_status', 'Aktif');
            if (!in_array($registrationStatus, ['Aktif', 'Cuti', 'Nonaktif', 'Lulus'], true)) {
                $registrationStatus = 'Aktif';
            }

            $paymentStatus = post_string('payment_status', 'Lunas');
            if (!in_array($paymentStatus, ['Lunas', 'Belum Lunas', 'Cicilan'], true)) {
                $paymentStatus = 'Lunas';
            }

            $githubRaw = post_string('github_url');
            $colabRaw = post_string('colab_url');
            $driveRaw = post_string('drive_url');

            $githubUrl = $githubRaw === '' ? null : valid_resource_url($githubRaw, 'github');
            $colabUrl = $colabRaw === '' ? null : valid_resource_url($colabRaw, 'colab');
            $driveUrl = $driveRaw === '' ? null : valid_resource_url($driveRaw, 'drive');

            if ($githubRaw !== '' && !$githubUrl) {
                throw new RuntimeException('Link GitHub tidak valid. Gunakan github.com.');
            }
            if ($colabRaw !== '' && !$colabUrl) {
                throw new RuntimeException('Link Colab tidak valid. Gunakan colab.research.google.com.');
            }
            if ($driveRaw !== '' && !$driveUrl) {
                throw new RuntimeException('Link Drive tidak valid. Gunakan drive.google.com atau docs.google.com.');
            }

            $gpa = post_float_or_null('gpa');
            $targetGpa = post_float_or_null('target_gpa');
            if ($gpa !== null) {
                $gpa = max(0, min(4, $gpa));
            }
            if ($targetGpa !== null) {
                $targetGpa = max(0, min(4, $targetGpa));
            }

            $enrollmentId = post_int('enrollment_id');
            $enrollmentId = $enrollmentId > 0 ? $enrollmentId : null;

            $savedEnrollmentId = $repository->saveStudentEnrollment(
                $classId,
                [
                    'nim' => $nim,
                    'name' => post_string('name'),
                    'email' => post_string('email'),
                    'phone' => post_string('phone'),
                    'registration_status' => $registrationStatus,
                    'payment_status' => $paymentStatus,
                    'gpa' => $gpa,
                    'target_gpa' => $targetGpa,
                    'pc' => post_string('pc'),
                    'github_url' => $githubUrl,
                    'colab_url' => $colabUrl,
                    'drive_url' => $driveUrl,
                    'note' => post_string('note'),
                ],
                $enrollmentId
            );

            $repository->log(
                $classId,
                (int) $user['id'],
                'Mahasiswa',
                sprintf('%s %s.', $nim, $enrollmentId ? 'diperbarui' : 'ditambahkan')
            );

            flash('success', 'Data mahasiswa berhasil disimpan.');
            break;

        case 'student.delete':
            $enrollmentId = post_int('enrollment_id');
            $student = $repository->enrollment($classId, $enrollmentId);
            if (!$student) {
                throw new RuntimeException('Mahasiswa tidak ditemukan.');
            }

            $repository->deleteEnrollment($classId, $enrollmentId);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Mahasiswa',
                $student['nim'] . ' dihapus dari kelas.'
            );
            flash('success', 'Mahasiswa dihapus dari kelas aktif.');
            break;

        case 'students.import_csv':
            if (
                !isset($_FILES['csv_file'])
                || !is_uploaded_file($_FILES['csv_file']['tmp_name'])
                || (int) $_FILES['csv_file']['error'] !== UPLOAD_ERR_OK
            ) {
                throw new RuntimeException('File CSV belum dipilih atau gagal diunggah.');
            }

            if ((int) $_FILES['csv_file']['size'] > 5 * 1024 * 1024) {
                throw new RuntimeException('Ukuran CSV maksimal 5 MB.');
            }

            $rows = parse_uploaded_csv($_FILES['csv_file']['tmp_name']);
            if (count($rows) < 2) {
                throw new RuntimeException('CSV tidak berisi data mahasiswa.');
            }

            $headers = array_map(
                static fn (string $header): string =>
                    strtolower(str_replace([' ', '-'], '_', trim($header))),
                $rows[0]
            );
            $index = static fn (string $name): int => array_search($name, $headers, true) !== false
                ? (int) array_search($name, $headers, true)
                : -1;

            if ($index('nim') < 0) {
                throw new RuntimeException('Header "nim" wajib tersedia.');
            }

            $read = static function (array $row, string $name, string $default = '') use ($index): string {
                $position = $index($name);
                return $position >= 0 ? trim((string) ($row[$position] ?? '')) : $default;
            };

            $added = 0;
            $updated = 0;

            foreach (array_slice($rows, 1) as $row) {
                $nim = $read($row, 'nim');
                if ($nim === '') {
                    continue;
                }

                $existing = $repository->enrollmentByNim($classId, $nim);

                $gpaRaw = $read($row, 'ipk');
                $targetRaw = $read($row, 'target_ipk');
                $githubRaw = $read($row, 'github');
                $colabRaw = $read($row, 'colab');
                $driveRaw = $read($row, 'drive');

                $payload = [
                    'nim' => $nim,
                    'name' => $read($row, 'nama', $existing['name'] ?? ''),
                    'email' => $read($row, 'email', $existing['email'] ?? ''),
                    'phone' => $read($row, 'telepon', $existing['phone'] ?? ''),
                    'registration_status' => $read($row, 'status', $existing['registration_status'] ?? 'Aktif') ?: 'Aktif',
                    'payment_status' => $read($row, 'pembayaran', $existing['payment_status'] ?? 'Lunas') ?: 'Lunas',
                    'gpa' => $gpaRaw === ''
                        ? ($existing['gpa'] ?? null)
                        : max(0, min(4, (float) $gpaRaw)),
                    'target_gpa' => $targetRaw === ''
                        ? ($existing['target_gpa'] ?? null)
                        : max(0, min(4, (float) $targetRaw)),
                    'pc' => strtoupper($read($row, 'pc', $existing['pc'] ?? '')),
                    'github_url' => $githubRaw === ''
                        ? ($existing['github_url'] ?? null)
                        : valid_resource_url($githubRaw, 'github'),
                    'colab_url' => $colabRaw === ''
                        ? ($existing['colab_url'] ?? null)
                        : valid_resource_url($colabRaw, 'colab'),
                    'drive_url' => $driveRaw === ''
                        ? ($existing['drive_url'] ?? null)
                        : valid_resource_url($driveRaw, 'drive'),
                    'note' => $read($row, 'catatan', $existing['note'] ?? ''),
                ];

                try {
                    $repository->saveStudentEnrollment(
                        $classId,
                        $payload,
                        $existing ? (int) $existing['enrollment_id'] : null
                    );
                } catch (PDOException $exception) {
                    // PC duplikat tidak boleh menggagalkan seluruh impor.
                    $payload['pc'] = '';
                    $repository->saveStudentEnrollment(
                        $classId,
                        $payload,
                        $existing ? (int) $existing['enrollment_id'] : null
                    );
                }

                $existing ? $updated++ : $added++;
            }

            $repository->log(
                $classId,
                (int) $user['id'],
                'Mahasiswa',
                "Import CSV: {$added} ditambahkan, {$updated} diperbarui."
            );
            flash('success', "Import selesai: {$added} ditambahkan, {$updated} diperbarui.");
            break;

        case 'attendance.save':
            $meeting = max(1, min(32, post_int('meeting', 1)));
            $statuses = is_array($_POST['statuses'] ?? null) ? $_POST['statuses'] : [];
            $repository->saveAttendance($classId, $meeting, $statuses);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Presensi',
                "Presensi Pertemuan {$meeting} diperbarui."
            );
            flash('success', "Presensi Pertemuan {$meeting} berhasil disimpan.");
            break;

        case 'attendance.mark_all':
            $meeting = max(1, min(32, post_int('meeting', 1)));
            $repository->markAllPresent($classId, $meeting);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Presensi',
                "Semua mahasiswa ditandai Hadir pada Pertemuan {$meeting}."
            );
            flash('success', 'Semua mahasiswa ditandai hadir.');
            break;

        case 'task.save':
            $name = post_string('name');
            if ($name === '') {
                throw new RuntimeException('Nama komponen penilaian wajib diisi.');
            }

            $taskId = post_int('task_id');
            $taskId = $taskId > 0 ? $taskId : null;

            $savedTaskId = $repository->saveTask(
                $classId,
                [
                    'name' => $name,
                    'type' => post_string('type', 'Tugas Harian'),
                    'weight' => max(0, min(100, (float) ($_POST['weight'] ?? 0))),
                    'max_score' => max(1, (float) ($_POST['max_score'] ?? 100)),
                    'meeting' => post_int('meeting') > 0 ? max(1, min(32, post_int('meeting'))) : null,
                    'due_date' => post_string('due_date') ?: null,
                    'description' => post_string('description'),
                    'sort_order' => post_int('sort_order', 10),
                ],
                $taskId
            );

            $repository->log(
                $classId,
                (int) $user['id'],
                'Tugas',
                sprintf('Komponen %s %s.', $name, $taskId ? 'diperbarui' : 'ditambahkan')
            );
            flash('success', 'Komponen penilaian berhasil disimpan.');
            $returnTo = 'dashboard.php?page=tasks&class_id=' . $classId . '&task_id=' . $savedTaskId;
            break;

        case 'task.delete':
            $taskId = post_int('task_id');
            $task = $repository->task($classId, $taskId);
            if (!$task) {
                throw new RuntimeException('Komponen penilaian tidak ditemukan.');
            }

            $repository->deleteTask($classId, $taskId);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Tugas',
                'Komponen ' . $task['name'] . ' dihapus.'
            );
            flash('success', 'Komponen penilaian dihapus.');
            break;

        case 'task_records.save':
            $taskId = post_int('task_id');
            $records = is_array($_POST['records'] ?? null) ? $_POST['records'] : [];
            $repository->saveTaskRecords($classId, $taskId, $records);

            $task = $repository->task($classId, $taskId);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Tugas',
                'Nilai/status ' . ($task['name'] ?? 'komponen') . ' diperbarui.'
            );
            flash('success', 'Nilai, status, catatan, dan link tugas berhasil disimpan.');
            break;

        case 'event.save':
            $title = post_string('title');
            $date = post_string('event_date');
            if ($title === '' || $date === '') {
                throw new RuntimeException('Judul dan tanggal agenda wajib diisi.');
            }

            $type = post_string('type', 'Kegiatan');
            if (!in_array($type, ['Kuliah', 'Ujian', 'Deadline', 'Bimbingan', 'Kegiatan'], true)) {
                $type = 'Kegiatan';
            }

            $eventId = post_int('event_id');
            $eventId = $eventId > 0 ? $eventId : null;

            $repository->saveEvent(
                $classId,
                [
                    'title' => $title,
                    'type' => $type,
                    'event_date' => $date,
                    'event_time' => post_string('event_time') ?: null,
                    'location' => post_string('location'),
                    'description' => post_string('description'),
                ],
                $eventId
            );

            $repository->log(
                $classId,
                (int) $user['id'],
                'Kalender',
                sprintf('%s %s.', $title, $eventId ? 'diperbarui' : 'ditambahkan')
            );
            flash('success', 'Agenda berhasil disimpan.');
            break;

        case 'event.delete':
            $eventId = post_int('event_id');
            $event = $repository->event($classId, $eventId);
            if (!$event) {
                throw new RuntimeException('Agenda tidak ditemukan.');
            }

            $repository->deleteEvent($classId, $eventId);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Kalender',
                $event['title'] . ' dihapus.'
            );
            flash('success', 'Agenda dihapus.');
            break;

        case 'special.save':
            $enrollmentId = post_int('enrollment_id');
            $repository->saveSpecialActivity(
                $classId,
                $enrollmentId,
                [
                    'type' => post_string('type', 'KKN'),
                    'status' => post_string('status', 'Belum Mengikuti'),
                    'location' => post_string('location'),
                    'supervisor' => post_string('supervisor'),
                    'progress' => max(0, min(100, post_int('progress'))),
                    'note' => post_string('note'),
                ]
            );

            $student = $repository->enrollment($classId, $enrollmentId);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Kegiatan',
                'Kegiatan ' . ($student['nim'] ?? $enrollmentId) . ' diperbarui.'
            );
            flash('success', 'Kegiatan mahasiswa berhasil diperbarui.');
            break;

        case 'seat.move':
            $enrollmentId = post_int('enrollment_id');
            $pc = strtoupper(post_string('pc'));
            $allowedPcs = [
                'PC01','PC02','PC03','PC04','PC05','PC06','PC07','PC08',
                'PC16','PC15','PC14','PC13','PC12','PC11','PC10','PC09',
                'PC17','PC18','PC19','PC20','PC21','PC22','PC23','PC24',
                'PC32','PC31','PC30','PC29','PC28','PC27','PC26','PC25',
                'PC33','PC34','PC35','PC36','PC37','PC38','PC39','PC40',
            ];
            if (!in_array($pc, $allowedPcs, true)) {
                throw new RuntimeException('Posisi PC tidak valid.');
            }

            $student = $repository->enrollment($classId, $enrollmentId);
            if (!$student) {
                throw new RuntimeException('Mahasiswa tidak ditemukan.');
            }

            $repository->moveSeat($classId, $enrollmentId, $pc);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Denah',
                $student['nim'] . ' dipindahkan ke ' . $pc . '.'
            );

            if (action_is_ajax()) {
                action_json(true, 'Posisi duduk diperbarui.');
            }
            flash('success', 'Posisi duduk diperbarui.');
            break;

        case 'logs.clear':
            $repository->clearLogs($classId);
            flash('success', 'Log aktivitas kelas dibersihkan.');
            break;


        case 'portal_pin.save':
            $enrollmentId = post_int('enrollment_id');
            $pin = trim((string) ($_POST['portal_pin'] ?? ''));

            if (preg_match('/^\d{6}$/', $pin) !== 1) {
                throw new RuntimeException(
                    'PIN mahasiswa harus terdiri dari tepat 6 digit angka.'
                );
            }

            $student = $repository->enrollment($classId, $enrollmentId);
            if (!$student) {
                throw new RuntimeException('Mahasiswa tidak ditemukan.');
            }

            $repository->setStudentPortalPin($classId, $enrollmentId, $pin);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Portal',
                'PIN portal mahasiswa ' . $student['nim'] . ' diperbarui.'
            );
            flash('success', 'PIN portal mahasiswa berhasil disimpan.');
            break;

        case 'portal_pin.clear':
            $enrollmentId = post_int('enrollment_id');

            $student = $repository->enrollment($classId, $enrollmentId);
            if (!$student) {
                throw new RuntimeException('Mahasiswa tidak ditemukan.');
            }

            $repository->setStudentPortalPin($classId, $enrollmentId, null);
            $repository->log(
                $classId,
                (int) $user['id'],
                'Portal',
                'PIN portal mahasiswa ' . $student['nim'] . ' dinonaktifkan.'
            );
            flash('success', 'PIN portal mahasiswa dinonaktifkan.');
            break;

        case 'settings.save':
            Auth::requireRole('admin');
            $repository->saveSettings([
                'institution' => post_string('institution'),
                'default_lecturer' => post_string('default_lecturer', 'Dashboard monitoring dosen'),
                'default_pass_threshold' => max(0, min(100, (float) ($_POST['default_pass_threshold'] ?? 60))),
                'trend_drop_threshold' => max(1, min(100, (float) ($_POST['trend_drop_threshold'] ?? 10))),
                'siakad_headers' => post_string(
                    'siakad_headers',
                    'nim,nama,tugas,uts,uas,nilai_akhir,nilai_huruf'
                ),
            ]);
            flash('success', 'Pengaturan umum berhasil disimpan.');
            break;

        case 'admin.program.save':
            Auth::requireRole('admin');
            $name = post_string('name');
            if ($name === '') {
                throw new RuntimeException('Nama program studi wajib diisi.');
            }
            $id = post_int('id');
            $repository->saveProgram(
                [
                    'code' => post_string('code'),
                    'name' => $name,
                    'faculty' => post_string('faculty'),
                ],
                $id > 0 ? $id : null
            );
            flash('success', 'Program studi berhasil disimpan.');
            break;

        case 'admin.program.delete':
            Auth::requireRole('admin');
            $repository->deleteProgram(post_int('id'));
            flash('success', 'Program studi dihapus.');
            break;

        case 'admin.course.save':
            Auth::requireRole('admin');
            $name = post_string('name');
            if ($name === '') {
                throw new RuntimeException('Nama mata kuliah wajib diisi.');
            }
            $id = post_int('id');
            $repository->saveCourse(
                [
                    'program_id' => post_int('program_id'),
                    'code' => post_string('code'),
                    'name' => $name,
                    'credits' => max(0, post_int('credits')),
                ],
                $id > 0 ? $id : null
            );
            flash('success', 'Mata kuliah berhasil disimpan.');
            break;

        case 'admin.course.delete':
            Auth::requireRole('admin');
            $repository->deleteCourse(post_int('id'));
            flash('success', 'Mata kuliah dihapus.');
            break;

        case 'admin.class.save':
            Auth::requireRole('admin');
            $name = post_string('name');
            if ($name === '') {
                throw new RuntimeException('Nama kelas wajib diisi.');
            }
            $id = post_int('id');
            $repository->saveClass(
                [
                    'program_id' => post_int('program_id'),
                    'course_id' => post_int('course_id'),
                    'name' => $name,
                    'semester' => post_string('semester'),
                    'academic_year' => post_string('academic_year'),
                    'target' => max(1, post_int('target', 30)),
                    'meetings' => max(1, min(32, post_int('meetings', 16))),
                    'lecturer' => post_string('lecturer', 'Dashboard monitoring dosen'),
                    'pass_threshold' => max(0, min(100, (float) ($_POST['pass_threshold'] ?? 60))),
                ],
                $id > 0 ? $id : null
            );
            flash('success', 'Kelas berhasil disimpan.');
            break;

        case 'admin.class.delete':
            Auth::requireRole('admin');
            $repository->deleteClass(post_int('id'));
            flash('success', 'Kelas beserta data relasinya dihapus.');
            break;

        case 'admin.user.save':
            Auth::requireRole('admin');

            $role = post_string('role', 'dosen');
            if (!in_array($role, ['admin', 'dosen', 'mahasiswa'], true)) {
                throw new RuntimeException('Role pengguna tidak valid.');
            }

            $username = post_string('username');
            if ($username === '') {
                throw new RuntimeException('Username wajib diisi.');
            }

            $id = post_int('id');
            $studentId = post_int('student_id');
            $studentId = $studentId > 0 ? $studentId : null;

            if ($role === 'mahasiswa' && !$studentId) {
                throw new RuntimeException('Akun mahasiswa wajib dihubungkan ke data mahasiswa.');
            }

            $repository->saveUser(
                [
                    'username' => $username,
                    'email' => post_string('email'),
                    'password' => (string) ($_POST['password'] ?? ''),
                    'role' => $role,
                    'student_id' => $role === 'mahasiswa' ? $studentId : null,
                    'is_active' => isset($_POST['is_active']) ? 1 : 0,
                ],
                is_array($_POST['class_ids'] ?? null) ? $_POST['class_ids'] : [],
                $id > 0 ? $id : null
            );

            flash('success', 'Pengguna berhasil disimpan.');
            break;

        case 'admin.user.delete':
            Auth::requireRole('admin');
            $id = post_int('id');
            if ($id === (int) $user['id']) {
                throw new RuntimeException('Anda tidak dapat menghapus akun yang sedang digunakan.');
            }

            $target = $repository->user($id);
            if (!$target) {
                throw new RuntimeException('Pengguna tidak ditemukan.');
            }

            if ($target['role'] === 'admin') {
                $activeAdminCount = (int) $pdo
                    ->query("SELECT COUNT(*) FROM users WHERE role = 'admin' AND is_active = 1")
                    ->fetchColumn();
                if ($activeAdminCount <= 1 && (bool) $target['is_active']) {
                    throw new RuntimeException('Minimal satu akun admin aktif harus dipertahankan.');
                }
            }

            $repository->deleteUser($id);
            flash('success', 'Pengguna dihapus.');
            break;

        default:
            throw new RuntimeException('Aksi tidak dikenali.');
    }
} catch (PDOException $exception) {
    if (action_is_ajax()) {
        action_json(false, 'Operasi database gagal. Pastikan data unik dan relasi masih valid.');
    }

    $message = Config::bool('APP_DEBUG')
        ? $exception->getMessage()
        : 'Operasi database gagal. Periksa data duplikat atau relasi yang masih digunakan.';
    flash('danger', $message);
} catch (Throwable $exception) {
    if (action_is_ajax()) {
        action_json(false, $exception->getMessage());
    }
    flash('danger', $exception->getMessage());
}

redirect($returnTo);
