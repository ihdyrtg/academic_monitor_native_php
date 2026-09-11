<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/app/bootstrap.php';

Auth::requireRole('admin', 'dosen');

$repository = new Repository(Database::connection());
$user = Auth::user();
$availableClasses = $repository->classesForUser($user);

if ($availableClasses === []) {
    http_response_code(403);
    exit('Akun ini belum memiliki akses ke kelas.');
}

$allowedClassIds = array_map(
    static fn (array $class): int => (int) $class['id'],
    $availableClasses
);

$requestedClassId = filter_input(
    INPUT_GET,
    'class_id',
    FILTER_VALIDATE_INT
);

$classId = $requestedClassId ?: (int) $availableClasses[0]['id'];

if (!in_array($classId, $allowedClassIds, true)) {
    http_response_code(403);
    exit('Anda tidak memiliki akses ke kelas tersebut.');
}

$classContext = $repository->classContext($classId);
$students = $repository->studentsForClass($classId);

$tokenError = '';

try {
    portal_secret();
} catch (Throwable $exception) {
    $tokenError = $exception->getMessage();
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta
        name="viewport"
        content="width=device-width,initial-scale=1.0"
    >
    <meta name="theme-color" content="#0f766e">

    <title>Link Portal Mahasiswa</title>

    <link
        rel="stylesheet"
        href="<?= e(app_url('assets/css/app.css')) ?>"
    >

    <style>
        .portal-link-page {
            min-height: 100vh;
            padding: 24px;
            background: var(--bg);
        }

        .portal-link-shell {
            width: min(1350px, 100%);
            margin: 0 auto;
        }

        .portal-url-field {
            width: min(560px, 100%);
            min-width: 300px;
            padding: 8px 9px;
            border: 1px solid var(--line);
            border-radius: 8px;
            background: #f8fafc;
            font-size: 10px;
        }

        @media (max-width: 700px) {
            .portal-link-page {
                padding: 14px;
            }
        }
    </style>
</head>

<body>
<main class="portal-link-page">
    <div class="portal-link-shell">
        <div class="page-head">
            <div>
                <h3>Link Portal Mahasiswa</h3>
                <p>
                    Buat dan salin link unik mahasiswa tanpa membuat akun login mahasiswa.
                </p>
            </div>

            <div class="actions">
                <a
                    class="btn"
                    href="<?= e(
                        app_url(
                            'dashboard.php?page=portal&class_id=' . $classId
                        )
                    ) ?>"
                >
                    ← Dashboard
                </a>

                <a
                    class="btn"
                    href="<?= e(app_url('logout.php')) ?>"
                >
                    Keluar
                </a>
            </div>
        </div>

        <?php if ($tokenError !== ''): ?>
            <div class="notice danger-note">
                <?= e($tokenError) ?>
                <br>
                Tambahkan <code>APP_PORTAL_SECRET</code> ke file
                <code>.env</code> terlebih dahulu.
            </div>
        <?php else: ?>
            <div class="notice">
                Setiap mahasiswa memiliki link berbeda.
                Mahasiswa tidak perlu login, tetapi link wajib dijaga karena
                siapa pun yang memiliki link dapat membuka portal mahasiswa tersebut.
            </div>
        <?php endif; ?>

        <div
            class="card section-card"
            style="margin-bottom:16px"
        >
            <form method="get">
                <div class="form-grid">
                    <div class="field">
                        <label>Kelas</label>

                        <select
                            name="class_id"
                            onchange="this.form.submit()"
                        >
                            <?php foreach ($availableClasses as $class): ?>
                                <option
                                    value="<?= (int) $class['id'] ?>"
                                    <?= selected(
                                        $class['id'],
                                        $classId
                                    ) ?>
                                >
                                    <?= e($class['name']) ?>
                                    —
                                    <?= e($class['course_name']) ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="field">
                        <label>Cari Mahasiswa</label>

                        <input
                            type="search"
                            id="portalStudentSearch"
                            placeholder="NIM / nama"
                        >
                    </div>
                </div>
            </form>
        </div>

        <div class="card table-card">
            <div class="table-tools">
                <strong>
                    <?= e($classContext['name'] ?? 'Kelas') ?>
                </strong>

                <span style="color:var(--muted);font-size:10px">
                    <?= count($students) ?> mahasiswa
                </span>
            </div>

            <div class="table-wrap">
                <table>
                    <thead>
                    <tr>
                        <th>Mahasiswa</th>
                        <th>NIM</th>
                        <th>Link Portal</th>
                        <th>Aksi</th>
                    </tr>
                    </thead>

                    <tbody>
                    <?php foreach ($students as $student): ?>
                        <?php
                        $portalUrl = $tokenError === ''
                            ? portal_public_url(
                                $classId,
                                (int) $student['enrollment_id']
                            )
                            : '';
                        ?>

                        <tr
                            data-portal-student
                            data-search="<?= e(
                                strtolower(
                                    $student['nim']
                                    . ' '
                                    . $student['name']
                                )
                            ) ?>"
                        >
                            <td>
                                <div class="student">
                                    <div class="avatar">
                                        <?= e(
                                            initials(
                                                (string) $student['name'],
                                                (string) $student['nim']
                                            )
                                        ) ?>
                                    </div>

                                    <div>
                                        <strong>
                                            <?= e(display_name($student)) ?>
                                        </strong>
                                    </div>
                                </div>
                            </td>

                            <td>
                                <strong><?= e($student['nim']) ?></strong>
                            </td>

                            <td>
                                <?php if ($portalUrl !== ''): ?>
                                    <input
                                        class="portal-url-field"
                                        type="text"
                                        value="<?= e($portalUrl) ?>"
                                        readonly
                                        data-portal-url
                                    >
                                <?php else: ?>
                                    <span class="badge danger">
                                        Secret belum dikonfigurasi
                                    </span>
                                <?php endif; ?>
                            </td>

                            <td>
                                <div class="actions">
                                    <?php if ($portalUrl !== ''): ?>
                                        <button
                                            class="btn small"
                                            type="button"
                                            data-copy-portal
                                        >
                                            Salin
                                        </button>

                                        <a
                                            class="btn small primary"
                                            href="<?= e($portalUrl) ?>"
                                            target="_blank"
                                            rel="noopener noreferrer"
                                        >
                                            Buka ↗
                                        </a>
                                    <?php endif; ?>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const search = document.getElementById('portalStudentSearch');

    if (search) {
        search.addEventListener('input', () => {
            const keyword = search.value.trim().toLowerCase();

            document.querySelectorAll('[data-portal-student]').forEach(row => {
                const text = String(row.dataset.search || '').toLowerCase();
                row.style.display = !keyword || text.includes(keyword) ? '' : 'none';
            });
        });
    }

    document.addEventListener('click', async event => {
        const button = event.target.closest('[data-copy-portal]');

        if (!button) {
            return;
        }

        const row = button.closest('[data-portal-student]');
        const input = row?.querySelector('[data-portal-url]');

        if (!input) {
            return;
        }

        try {
            await navigator.clipboard.writeText(input.value);
            const original = button.textContent;
            button.textContent = 'Tersalin ✓';

            window.setTimeout(() => {
                button.textContent = original;
            }, 1400);
        } catch {
            input.select();
            document.execCommand('copy');
        }
    });
});
</script>
</body>
</html>
