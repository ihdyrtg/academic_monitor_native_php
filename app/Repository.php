<?php
declare(strict_types=1);

final class Repository
{
    public function __construct(private readonly PDO $pdo)
    {
    }

    public function settings(): array
    {
        $rows = $this->pdo->query('SELECT setting_key, setting_value FROM settings')->fetchAll();
        $settings = [];
        foreach ($rows as $row) {
            $settings[$row['setting_key']] = $row['setting_value'];
        }

        return $settings;
    }

    public function saveSettings(array $values): void
    {
        $stmt = $this->pdo->prepare(
            'INSERT INTO settings (setting_key, setting_value)
             VALUES (:setting_key, :setting_value)
             ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value), updated_at = CURRENT_TIMESTAMP'
        );

        foreach ($values as $key => $value) {
            $stmt->execute([
                'setting_key' => $key,
                'setting_value' => (string) $value,
            ]);
        }
    }

    public function programs(): array
    {
        return $this->pdo
            ->query('SELECT * FROM programs ORDER BY code, name')
            ->fetchAll();
    }

    public function courses(): array
    {
        return $this->pdo
            ->query(
                'SELECT c.*, p.code AS program_code, p.name AS program_name
                 FROM courses c
                 JOIN programs p ON p.id = c.program_id
                 ORDER BY c.code, c.name'
            )
            ->fetchAll();
    }

    public function classes(): array
    {
        return $this->pdo
            ->query(
                'SELECT cl.*, c.code AS course_code, c.name AS course_name,
                        p.code AS program_code, p.name AS program_name
                 FROM classes cl
                 JOIN courses c ON c.id = cl.course_id
                 JOIN programs p ON p.id = cl.program_id
                 ORDER BY cl.academic_year DESC, cl.semester, cl.name'
            )
            ->fetchAll();
    }

    public function classesForUser(array $user): array
    {
        if (($user['role'] ?? '') === 'admin') {
            return $this->classes();
        }

        if (($user['role'] ?? '') === 'dosen') {
            $stmt = $this->pdo->prepare(
                'SELECT cl.*, c.code AS course_code, c.name AS course_name,
                        p.code AS program_code, p.name AS program_name
                 FROM user_class_access uca
                 JOIN classes cl ON cl.id = uca.class_id
                 JOIN courses c ON c.id = cl.course_id
                 JOIN programs p ON p.id = cl.program_id
                 WHERE uca.user_id = :user_id
                 ORDER BY cl.academic_year DESC, cl.semester, cl.name'
            );
            $stmt->execute(['user_id' => (int) $user['id']]);
            return $stmt->fetchAll();
        }

        $studentId = (int) ($user['student_id'] ?? 0);
        if ($studentId <= 0) {
            return [];
        }

        $stmt = $this->pdo->prepare(
            'SELECT cl.*, c.code AS course_code, c.name AS course_name,
                    p.code AS program_code, p.name AS program_name
             FROM class_enrollments ce
             JOIN classes cl ON cl.id = ce.class_id
             JOIN courses c ON c.id = cl.course_id
             JOIN programs p ON p.id = cl.program_id
             WHERE ce.student_id = :student_id
             ORDER BY cl.academic_year DESC, cl.semester, cl.name'
        );
        $stmt->execute(['student_id' => $studentId]);

        return $stmt->fetchAll();
    }

    public function classContext(int $classId): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT cl.*, c.code AS course_code, c.name AS course_name, c.credits,
                    p.code AS program_code, p.name AS program_name, p.faculty
             FROM classes cl
             JOIN courses c ON c.id = cl.course_id
             JOIN programs p ON p.id = cl.program_id
             WHERE cl.id = :id
             LIMIT 1'
        );
        $stmt->execute(['id' => $classId]);

        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function studentsForClass(int $classId): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT ce.id AS enrollment_id, ce.class_id, ce.student_id,
                    ce.registration_status, ce.payment_status, ce.gpa, ce.target_gpa,
                    ce.pc, ce.github_url, ce.colab_url, ce.drive_url, ce.note,
                    s.nim, s.name, s.email, s.phone
             FROM class_enrollments ce
             JOIN students s ON s.id = ce.student_id
             WHERE ce.class_id = :class_id
             ORDER BY s.name = "", s.name, s.nim'
        );
        $stmt->execute(['class_id' => $classId]);

        return $stmt->fetchAll();
    }

    public function enrollment(int $classId, int $enrollmentId): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT ce.id AS enrollment_id, ce.class_id, ce.student_id,
                    ce.registration_status, ce.payment_status, ce.gpa, ce.target_gpa,
                    ce.pc, ce.github_url, ce.colab_url, ce.drive_url, ce.note,
                    s.nim, s.name, s.email, s.phone
             FROM class_enrollments ce
             JOIN students s ON s.id = ce.student_id
             WHERE ce.class_id = :class_id AND ce.id = :enrollment_id
             LIMIT 1'
        );
        $stmt->execute([
            'class_id' => $classId,
            'enrollment_id' => $enrollmentId,
        ]);

        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function enrollmentByNim(int $classId, string $nim): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT ce.id AS enrollment_id, ce.class_id, ce.student_id,
                    ce.registration_status, ce.payment_status, ce.gpa, ce.target_gpa,
                    ce.pc, ce.github_url, ce.colab_url, ce.drive_url, ce.note,
                    s.nim, s.name, s.email, s.phone
             FROM class_enrollments ce
             JOIN students s ON s.id = ce.student_id
             WHERE ce.class_id = :class_id AND s.nim = :nim
             LIMIT 1'
        );
        $stmt->execute(['class_id' => $classId, 'nim' => $nim]);

        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function enrollmentForStudent(int $classId, int $studentId): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT ce.id AS enrollment_id, ce.class_id, ce.student_id,
                    ce.registration_status, ce.payment_status, ce.gpa, ce.target_gpa,
                    ce.pc, ce.github_url, ce.colab_url, ce.drive_url, ce.note,
                    s.nim, s.name, s.email, s.phone
             FROM class_enrollments ce
             JOIN students s ON s.id = ce.student_id
             WHERE ce.class_id = :class_id AND ce.student_id = :student_id
             LIMIT 1'
        );
        $stmt->execute(['class_id' => $classId, 'student_id' => $studentId]);

        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function saveStudentEnrollment(int $classId, array $payload, ?int $enrollmentId = null): int
    {
        return Database::transaction(function (PDO $pdo) use ($classId, $payload, $enrollmentId): int {
            $studentId = null;

            if ($enrollmentId !== null) {
                $existing = $this->enrollment($classId, $enrollmentId);
                if (!$existing) {
                    throw new RuntimeException('Data mahasiswa tidak ditemukan pada kelas aktif.');
                }
                $studentId = (int) $existing['student_id'];
            } else {
                $lookup = $pdo->prepare('SELECT id FROM students WHERE nim = :nim LIMIT 1');
                $lookup->execute(['nim' => $payload['nim']]);
                $studentId = (int) ($lookup->fetchColumn() ?: 0);
            }

            if ($studentId > 0 && $enrollmentId === null) {
                $duplicate = $pdo->prepare(
                    'SELECT id FROM class_enrollments
                     WHERE class_id = :class_id AND student_id = :student_id
                     LIMIT 1'
                );
                $duplicate->execute([
                    'class_id' => $classId,
                    'student_id' => $studentId,
                ]);
                if ($duplicate->fetchColumn()) {
                    throw new RuntimeException('Mahasiswa dengan NIM tersebut sudah terdaftar pada kelas ini.');
                }
            }

            if ($studentId > 0) {
                $stmt = $pdo->prepare(
                    'UPDATE students
                     SET nim = :nim, name = :name, email = :email, phone = :phone
                     WHERE id = :id'
                );
                $stmt->execute([
                    'nim' => $payload['nim'],
                    'name' => $payload['name'],
                    'email' => $payload['email'],
                    'phone' => $payload['phone'],
                    'id' => $studentId,
                ]);
            } else {
                $stmt = $pdo->prepare(
                    'INSERT INTO students (nim, name, email, phone)
                     VALUES (:nim, :name, :email, :phone)'
                );
                $stmt->execute([
                    'nim' => $payload['nim'],
                    'name' => $payload['name'],
                    'email' => $payload['email'],
                    'phone' => $payload['phone'],
                ]);
                $studentId = (int) $pdo->lastInsertId();
            }

            $params = [
                'class_id' => $classId,
                'student_id' => $studentId,
                'registration_status' => $payload['registration_status'],
                'payment_status' => $payload['payment_status'],
                'gpa' => $payload['gpa'],
                'target_gpa' => $payload['target_gpa'],
                'pc' => $payload['pc'] !== '' ? $payload['pc'] : null,
                'github_url' => $payload['github_url'],
                'colab_url' => $payload['colab_url'],
                'drive_url' => $payload['drive_url'],
                'note' => $payload['note'],
            ];

            if ($enrollmentId !== null) {
                $params['id'] = $enrollmentId;
                $stmt = $pdo->prepare(
                    'UPDATE class_enrollments
                     SET student_id = :student_id,
                         registration_status = :registration_status,
                         payment_status = :payment_status,
                         gpa = :gpa,
                         target_gpa = :target_gpa,
                         pc = :pc,
                         github_url = :github_url,
                         colab_url = :colab_url,
                         drive_url = :drive_url,
                         note = :note
                     WHERE id = :id AND class_id = :class_id'
                );
                $stmt->execute($params);
                return $enrollmentId;
            }

            $duplicate = $pdo->prepare(
                'SELECT id FROM class_enrollments
                 WHERE class_id = :class_id AND student_id = :student_id
                 LIMIT 1'
            );
            $duplicate->execute([
                'class_id' => $classId,
                'student_id' => $studentId,
            ]);

            $existingEnrollment = (int) ($duplicate->fetchColumn() ?: 0);
            if ($existingEnrollment > 0) {
                throw new RuntimeException('Mahasiswa dengan NIM tersebut sudah terdaftar pada kelas ini.');
            }

            $stmt = $pdo->prepare(
                'INSERT INTO class_enrollments
                    (class_id, student_id, registration_status, payment_status, gpa, target_gpa,
                     pc, github_url, colab_url, drive_url, note)
                 VALUES
                    (:class_id, :student_id, :registration_status, :payment_status, :gpa, :target_gpa,
                     :pc, :github_url, :colab_url, :drive_url, :note)'
            );
            $stmt->execute($params);

            return (int) $pdo->lastInsertId();
        });
    }


    public function studentByNim(string $nim): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT id, nim, name, email, phone, portal_pin_hash
             FROM students
             WHERE nim = :nim
             LIMIT 1'
        );
        $stmt->execute(['nim' => $nim]);

        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function studentById(int $studentId): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT id, nim, name, email, phone, portal_pin_hash
             FROM students
             WHERE id = :id
             LIMIT 1'
        );
        $stmt->execute(['id' => $studentId]);

        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function verifyStudentPortalPin(string $nim, string $pin): ?array
    {
        $student = $this->studentByNim($nim);
        if (!$student) {
            return null;
        }

        $hash = trim((string) ($student['portal_pin_hash'] ?? ''));
        if ($hash === '' || !password_verify($pin, $hash)) {
            return null;
        }

        return $student;
    }

    public function setStudentPortalPin(
        int $classId,
        int $enrollmentId,
        ?string $pin
    ): void {
        $enrollment = $this->enrollment($classId, $enrollmentId);
        if (!$enrollment) {
            throw new RuntimeException(
                'Mahasiswa tidak ditemukan pada kelas aktif.'
            );
        }

        $hash = null;

        if ($pin !== null) {
            if (preg_match('/^\d{6}$/', $pin) !== 1) {
                throw new RuntimeException(
                    'PIN portal harus terdiri dari 6 digit angka.'
                );
            }

            $hash = password_hash($pin, PASSWORD_DEFAULT);
            if ($hash === false) {
                throw new RuntimeException('PIN mahasiswa gagal diamankan.');
            }
        }

        $stmt = $this->pdo->prepare(
            'UPDATE students
             SET portal_pin_hash = :portal_pin_hash
             WHERE id = :student_id'
        );
        $stmt->execute([
            'portal_pin_hash' => $hash,
            'student_id' => (int) $enrollment['student_id'],
        ]);
    }


    public function deleteEnrollment(int $classId, int $enrollmentId): void
    {
        $stmt = $this->pdo->prepare(
            'DELETE FROM class_enrollments
             WHERE id = :id AND class_id = :class_id'
        );
        $stmt->execute(['id' => $enrollmentId, 'class_id' => $classId]);
    }

    public function attendanceForClass(int $classId): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT a.id, a.enrollment_id, a.meeting, a.status
             FROM attendance a
             JOIN class_enrollments ce ON ce.id = a.enrollment_id
             WHERE ce.class_id = :class_id'
        );
        $stmt->execute(['class_id' => $classId]);

        return $stmt->fetchAll();
    }

    public function saveAttendance(int $classId, int $meeting, array $statuses): void
    {
        Database::transaction(function (PDO $pdo) use ($classId, $meeting, $statuses): void {
            $validEnrollmentStmt = $pdo->prepare(
                'SELECT id FROM class_enrollments WHERE class_id = :class_id'
            );
            $validEnrollmentStmt->execute(['class_id' => $classId]);
            $validIds = array_map('intval', $validEnrollmentStmt->fetchAll(PDO::FETCH_COLUMN));
            $validLookup = array_flip($validIds);

            $stmt = $pdo->prepare(
                'INSERT INTO attendance (enrollment_id, meeting, status)
                 VALUES (:enrollment_id, :meeting, :status)
                 ON DUPLICATE KEY UPDATE status = VALUES(status), updated_at = CURRENT_TIMESTAMP'
            );

            foreach ($statuses as $enrollmentId => $status) {
                $enrollmentId = (int) $enrollmentId;
                if (!isset($validLookup[$enrollmentId]) || !in_array($status, ['H', 'I', 'S', 'A'], true)) {
                    continue;
                }
                $stmt->execute([
                    'enrollment_id' => $enrollmentId,
                    'meeting' => $meeting,
                    'status' => $status,
                ]);
            }
        });
    }

    public function markAllPresent(int $classId, int $meeting): void
    {
        $stmt = $this->pdo->prepare(
            'INSERT INTO attendance (enrollment_id, meeting, status)
             SELECT id, :meeting, "H"
             FROM class_enrollments
             WHERE class_id = :class_id
             ON DUPLICATE KEY UPDATE status = "H", updated_at = CURRENT_TIMESTAMP'
        );
        $stmt->execute(['meeting' => $meeting, 'class_id' => $classId]);
    }

    public function tasksForClass(int $classId): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM tasks
             WHERE class_id = :class_id
             ORDER BY sort_order, meeting, id'
        );
        $stmt->execute(['class_id' => $classId]);

        return $stmt->fetchAll();
    }

    public function task(int $classId, int $taskId): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM tasks
             WHERE id = :id AND class_id = :class_id
             LIMIT 1'
        );
        $stmt->execute(['id' => $taskId, 'class_id' => $classId]);

        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function saveTask(int $classId, array $payload, ?int $taskId = null): int
    {
        if ($taskId !== null) {
            $stmt = $this->pdo->prepare(
                'UPDATE tasks
                 SET name = :name, type = :type, weight = :weight, max_score = :max_score,
                     meeting = :meeting, due_date = :due_date, description = :description,
                     sort_order = :sort_order
                 WHERE id = :id AND class_id = :class_id'
            );
            $stmt->execute([
                ...$payload,
                'id' => $taskId,
                'class_id' => $classId,
            ]);
            return $taskId;
        }

        $stmt = $this->pdo->prepare(
            'INSERT INTO tasks
                (class_id, name, type, weight, max_score, meeting, due_date, description, sort_order)
             VALUES
                (:class_id, :name, :type, :weight, :max_score, :meeting, :due_date, :description, :sort_order)'
        );
        $stmt->execute([
            ...$payload,
            'class_id' => $classId,
        ]);

        return (int) $this->pdo->lastInsertId();
    }

    public function deleteTask(int $classId, int $taskId): void
    {
        $stmt = $this->pdo->prepare(
            'DELETE FROM tasks WHERE id = :id AND class_id = :class_id'
        );
        $stmt->execute(['id' => $taskId, 'class_id' => $classId]);
    }

    public function taskRecordsForClass(int $classId): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT tr.*
             FROM task_records tr
             JOIN tasks t ON t.id = tr.task_id
             WHERE t.class_id = :class_id'
        );
        $stmt->execute(['class_id' => $classId]);

        return $stmt->fetchAll();
    }

    public function saveTaskRecords(int $classId, int $taskId, array $records): void
    {
        $task = $this->task($classId, $taskId);
        if (!$task) {
            throw new RuntimeException('Komponen penilaian tidak ditemukan.');
        }

        Database::transaction(function (PDO $pdo) use ($classId, $taskId, $task, $records): void {
            $validStmt = $pdo->prepare(
                'SELECT id FROM class_enrollments WHERE class_id = :class_id'
            );
            $validStmt->execute(['class_id' => $classId]);
            $validIds = array_flip(array_map('intval', $validStmt->fetchAll(PDO::FETCH_COLUMN)));

            $stmt = $pdo->prepare(
                'INSERT INTO task_records
                    (task_id, enrollment_id, status, score, note, github_url, colab_url, drive_url)
                 VALUES
                    (:task_id, :enrollment_id, :status, :score, :note, :github_url, :colab_url, :drive_url)
                 ON DUPLICATE KEY UPDATE
                    status = VALUES(status),
                    score = VALUES(score),
                    note = VALUES(note),
                    github_url = VALUES(github_url),
                    colab_url = VALUES(colab_url),
                    drive_url = VALUES(drive_url),
                    updated_at = CURRENT_TIMESTAMP'
            );

            foreach ($records as $enrollmentId => $record) {
                $enrollmentId = (int) $enrollmentId;
                if (!isset($validIds[$enrollmentId])) {
                    continue;
                }

                $status = (string) ($record['status'] ?? 'pending');
                if (!in_array($status, ['pending', 'submitted', 'graded', 'late'], true)) {
                    $status = 'pending';
                }

                $scoreRaw = trim((string) ($record['score'] ?? ''));
                $score = $scoreRaw === ''
                    ? null
                    : max(0, min((float) $task['max_score'], (float) $scoreRaw));

                if ($score !== null && $status === 'submitted') {
                    $status = 'graded';
                }

                $stmt->execute([
                    'task_id' => $taskId,
                    'enrollment_id' => $enrollmentId,
                    'status' => $status,
                    'score' => $score,
                    'note' => trim((string) ($record['note'] ?? '')),
                    'github_url' => valid_resource_url($record['github_url'] ?? null, 'github'),
                    'colab_url' => valid_resource_url($record['colab_url'] ?? null, 'colab'),
                    'drive_url' => valid_resource_url($record['drive_url'] ?? null, 'drive'),
                ]);
            }
        });
    }

    public function eventsForClass(int $classId): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM events
             WHERE class_id = :class_id
             ORDER BY event_date, event_time, id'
        );
        $stmt->execute(['class_id' => $classId]);
        return $stmt->fetchAll();
    }

    public function event(int $classId, int $eventId): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM events
             WHERE id = :id AND class_id = :class_id LIMIT 1'
        );
        $stmt->execute(['id' => $eventId, 'class_id' => $classId]);
        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function saveEvent(int $classId, array $payload, ?int $eventId = null): int
    {
        if ($eventId !== null) {
            $stmt = $this->pdo->prepare(
                'UPDATE events
                 SET title = :title, type = :type, event_date = :event_date,
                     event_time = :event_time, location = :location, description = :description
                 WHERE id = :id AND class_id = :class_id'
            );
            $stmt->execute([
                ...$payload,
                'id' => $eventId,
                'class_id' => $classId,
            ]);
            return $eventId;
        }

        $stmt = $this->pdo->prepare(
            'INSERT INTO events
                (class_id, title, type, event_date, event_time, location, description)
             VALUES
                (:class_id, :title, :type, :event_date, :event_time, :location, :description)'
        );
        $stmt->execute([
            ...$payload,
            'class_id' => $classId,
        ]);

        return (int) $this->pdo->lastInsertId();
    }

    public function deleteEvent(int $classId, int $eventId): void
    {
        $stmt = $this->pdo->prepare(
            'DELETE FROM events WHERE id = :id AND class_id = :class_id'
        );
        $stmt->execute(['id' => $eventId, 'class_id' => $classId]);
    }

    public function specialActivitiesForClass(int $classId): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT sa.*, ce.student_id, s.nim, s.name
             FROM special_activities sa
             JOIN class_enrollments ce ON ce.id = sa.enrollment_id
             JOIN students s ON s.id = ce.student_id
             WHERE ce.class_id = :class_id'
        );
        $stmt->execute(['class_id' => $classId]);

        return $stmt->fetchAll();
    }

    public function saveSpecialActivity(int $classId, int $enrollmentId, array $payload): void
    {
        $check = $this->pdo->prepare(
            'SELECT id FROM class_enrollments
             WHERE id = :id AND class_id = :class_id'
        );
        $check->execute(['id' => $enrollmentId, 'class_id' => $classId]);
        if (!$check->fetchColumn()) {
            throw new RuntimeException('Mahasiswa tidak ditemukan pada kelas aktif.');
        }

        $stmt = $this->pdo->prepare(
            'INSERT INTO special_activities
                (enrollment_id, type, status, location, supervisor, progress, note)
             VALUES
                (:enrollment_id, :type, :status, :location, :supervisor, :progress, :note)
             ON DUPLICATE KEY UPDATE
                type = VALUES(type),
                status = VALUES(status),
                location = VALUES(location),
                supervisor = VALUES(supervisor),
                progress = VALUES(progress),
                note = VALUES(note),
                updated_at = CURRENT_TIMESTAMP'
        );
        $stmt->execute([
            'enrollment_id' => $enrollmentId,
            ...$payload,
        ]);
    }

    public function moveSeat(int $classId, int $enrollmentId, string $targetPc): void
    {
        Database::transaction(function (PDO $pdo) use ($classId, $enrollmentId, $targetPc): void {
            $stmt = $pdo->prepare(
                'SELECT id, pc FROM class_enrollments
                 WHERE id = :id AND class_id = :class_id FOR UPDATE'
            );
            $stmt->execute(['id' => $enrollmentId, 'class_id' => $classId]);
            $student = $stmt->fetch();
            if (!$student) {
                throw new RuntimeException('Mahasiswa tidak ditemukan.');
            }

            $oldPc = $student['pc'];

            $occupantStmt = $pdo->prepare(
                'SELECT id, pc FROM class_enrollments
                 WHERE class_id = :class_id AND pc = :pc AND id <> :id
                 LIMIT 1 FOR UPDATE'
            );
            $occupantStmt->execute([
                'class_id' => $classId,
                'pc' => $targetPc,
                'id' => $enrollmentId,
            ]);
            $occupant = $occupantStmt->fetch();

            if ($occupant) {
                $clear = $pdo->prepare('UPDATE class_enrollments SET pc = NULL WHERE id = :id');
                $clear->execute(['id' => (int) $occupant['id']]);
            }

            $move = $pdo->prepare(
                'UPDATE class_enrollments
                 SET pc = :pc
                 WHERE id = :id AND class_id = :class_id'
            );
            $move->execute([
                'pc' => $targetPc,
                'id' => $enrollmentId,
                'class_id' => $classId,
            ]);

            if ($occupant) {
                $swap = $pdo->prepare('UPDATE class_enrollments SET pc = :pc WHERE id = :id');
                $swap->execute([
                    'pc' => $oldPc ?: null,
                    'id' => (int) $occupant['id'],
                ]);
            }
        });
    }

    public function logsForClass(int $classId, int $limit = 300): array
    {
        $limit = max(1, min(1000, $limit));
        $stmt = $this->pdo->prepare(
            "SELECT al.*, u.username
             FROM activity_logs al
             LEFT JOIN users u ON u.id = al.user_id
             WHERE al.class_id = :class_id
             ORDER BY al.id DESC
             LIMIT {$limit}"
        );
        $stmt->execute(['class_id' => $classId]);

        return $stmt->fetchAll();
    }

    public function log(int $classId, ?int $userId, string $type, string $text): void
    {
        $stmt = $this->pdo->prepare(
            'INSERT INTO activity_logs (class_id, user_id, type, text)
             VALUES (:class_id, :user_id, :type, :text)'
        );
        $stmt->execute([
            'class_id' => $classId,
            'user_id' => $userId ?: null,
            'type' => $type,
            'text' => $text,
        ]);
    }

    public function clearLogs(int $classId): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM activity_logs WHERE class_id = :class_id');
        $stmt->execute(['class_id' => $classId]);
    }

    public function saveProgram(array $payload, ?int $id = null): int
    {
        if ($id !== null) {
            $stmt = $this->pdo->prepare(
                'UPDATE programs SET code = :code, name = :name, faculty = :faculty WHERE id = :id'
            );
            $stmt->execute([...$payload, 'id' => $id]);
            return $id;
        }

        $stmt = $this->pdo->prepare(
            'INSERT INTO programs (code, name, faculty) VALUES (:code, :name, :faculty)'
        );
        $stmt->execute($payload);
        return (int) $this->pdo->lastInsertId();
    }

    public function deleteProgram(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM programs WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    public function saveCourse(array $payload, ?int $id = null): int
    {
        if ($id !== null) {
            $stmt = $this->pdo->prepare(
                'UPDATE courses
                 SET program_id = :program_id, code = :code, name = :name, credits = :credits
                 WHERE id = :id'
            );
            $stmt->execute([...$payload, 'id' => $id]);
            return $id;
        }

        $stmt = $this->pdo->prepare(
            'INSERT INTO courses (program_id, code, name, credits)
             VALUES (:program_id, :code, :name, :credits)'
        );
        $stmt->execute($payload);
        return (int) $this->pdo->lastInsertId();
    }

    public function deleteCourse(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM courses WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    public function saveClass(array $payload, ?int $id = null): int
    {
        if ($id !== null) {
            $stmt = $this->pdo->prepare(
                'UPDATE classes
                 SET program_id = :program_id, course_id = :course_id, name = :name,
                     semester = :semester, academic_year = :academic_year, target = :target,
                     meetings = :meetings, lecturer = :lecturer, pass_threshold = :pass_threshold
                 WHERE id = :id'
            );
            $stmt->execute([...$payload, 'id' => $id]);
            return $id;
        }

        $stmt = $this->pdo->prepare(
            'INSERT INTO classes
                (program_id, course_id, name, semester, academic_year, target, meetings, lecturer, pass_threshold)
             VALUES
                (:program_id, :course_id, :name, :semester, :academic_year, :target, :meetings, :lecturer, :pass_threshold)'
        );
        $stmt->execute($payload);
        return (int) $this->pdo->lastInsertId();
    }

    public function deleteClass(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM classes WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    public function users(): array
    {
        return $this->pdo
            ->query(
                'SELECT u.id, u.username, u.email, u.role, u.is_active, u.student_id,
                        u.last_login_at, u.created_at, s.nim AS student_nim, s.name AS student_name
                 FROM users u
                 LEFT JOIN students s ON s.id = u.student_id
                 ORDER BY FIELD(u.role, "admin", "dosen", "mahasiswa"), u.username'
            )
            ->fetchAll();
    }

    public function user(int $id): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT u.*, s.nim AS student_nim, s.name AS student_name
             FROM users u
             LEFT JOIN students s ON s.id = u.student_id
             WHERE u.id = :id LIMIT 1'
        );
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function saveUser(array $payload, array $classIds, ?int $id = null): int
    {
        return Database::transaction(function (PDO $pdo) use ($payload, $classIds, $id): int {
            $params = [
                'username' => $payload['username'],
                'email' => $payload['email'],
                'role' => $payload['role'],
                'student_id' => $payload['student_id'],
                'is_active' => $payload['is_active'],
            ];

            if ($id !== null) {
                $sql = 'UPDATE users
                        SET username = :username, email = :email, role = :role,
                            student_id = :student_id, is_active = :is_active';
                if (!empty($payload['password'])) {
                    $sql .= ', password_hash = :password_hash';
                    $params['password_hash'] = password_hash($payload['password'], PASSWORD_DEFAULT);
                }
                $sql .= ' WHERE id = :id';
                $params['id'] = $id;

                $stmt = $pdo->prepare($sql);
                $stmt->execute($params);
                $userId = $id;
            } else {
                if (empty($payload['password'])) {
                    throw new RuntimeException('Password wajib diisi untuk pengguna baru.');
                }
                $params['password_hash'] = password_hash($payload['password'], PASSWORD_DEFAULT);
                $stmt = $pdo->prepare(
                    'INSERT INTO users
                        (username, email, password_hash, role, student_id, is_active)
                     VALUES
                        (:username, :email, :password_hash, :role, :student_id, :is_active)'
                );
                $stmt->execute($params);
                $userId = (int) $pdo->lastInsertId();
            }

            $pdo->prepare('DELETE FROM user_class_access WHERE user_id = :user_id')
                ->execute(['user_id' => $userId]);

            if ($payload['role'] === 'dosen') {
                $insert = $pdo->prepare(
                    'INSERT IGNORE INTO user_class_access (user_id, class_id)
                     VALUES (:user_id, :class_id)'
                );
                foreach (array_unique(array_map('intval', $classIds)) as $classId) {
                    if ($classId <= 0) {
                        continue;
                    }
                    $insert->execute(['user_id' => $userId, 'class_id' => $classId]);
                }
            }

            return $userId;
        });
    }

    public function userClassIds(int $userId): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT class_id FROM user_class_access WHERE user_id = :user_id'
        );
        $stmt->execute(['user_id' => $userId]);
        return array_map('intval', $stmt->fetchAll(PDO::FETCH_COLUMN));
    }

    public function deleteUser(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM users WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    public function allStudents(): array
    {
        return $this->pdo
            ->query('SELECT id, nim, name, email FROM students ORDER BY name = "", name, nim')
            ->fetchAll();
    }

    public function counts(): array
    {
        $tables = [
            'users' => 'users',
            'programs' => 'programs',
            'courses' => 'courses',
            'classes' => 'classes',
            'students' => 'students',
        ];
        $result = [];
        foreach ($tables as $key => $table) {
            $result[$key] = (int) $this->pdo->query("SELECT COUNT(*) FROM {$table}")->fetchColumn();
        }
        return $result;
    }

    public function setPreference(int $userId, string $key, string $value): void
    {
        $stmt = $this->pdo->prepare(
            'INSERT INTO user_preferences (user_id, preference_key, preference_value)
             VALUES (:user_id, :preference_key, :preference_value)
             ON DUPLICATE KEY UPDATE preference_value = VALUES(preference_value)'
        );
        $stmt->execute([
            'user_id' => $userId,
            'preference_key' => $key,
            'preference_value' => $value,
        ]);
    }

    public function preference(int $userId, string $key): ?string
    {
        $stmt = $this->pdo->prepare(
            'SELECT preference_value
             FROM user_preferences
             WHERE user_id = :user_id AND preference_key = :preference_key
             LIMIT 1'
        );
        $stmt->execute(['user_id' => $userId, 'preference_key' => $key]);

        $value = $stmt->fetchColumn();
        return $value === false ? null : (string) $value;
    }
}
