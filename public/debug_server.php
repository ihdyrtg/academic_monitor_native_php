<?php
// File: public/debug_server.php
declare(strict_types=1);

header('Content-Type: text/html; charset=UTF-8');

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

echo '<h2>Academic Monitor - Server Diagnostic</h2>';

echo '<p>PHP: <strong>'
    . htmlspecialchars(PHP_VERSION)
    . '</strong></p>';

echo '<p>pdo_mysql: <strong>'
    . (
        extension_loaded('pdo_mysql')
            ? 'AKTIF'
            : 'TIDAK AKTIF'
    )
    . '</strong></p>';

$root = dirname(__DIR__);

echo '<p>Project root: <strong>'
    . (
        is_dir($root . '/app')
            ? 'OK'
            : 'APP FOLDER TIDAK DITEMUKAN'
    )
    . '</strong></p>';

echo '<p>.env: <strong>'
    . (
        is_file($root . '/.env')
            ? 'DITEMUKAN'
            : 'TIDAK DITEMUKAN'
    )
    . '</strong></p>';

echo '<hr>';

echo '<h3>Test Bootstrap</h3>';

try {
    require_once $root . '/app/bootstrap.php';

    echo '<p style="color:green">
        Bootstrap: <strong>OK</strong>
    </p>';
} catch (Throwable $exception) {
    echo '<p style="color:red">
        Bootstrap: <strong>GAGAL</strong>
    </p>';

    echo '<pre>'
        . htmlspecialchars(
            get_class($exception)
            . ': '
            . $exception->getMessage()
        )
        . '</pre>';

    exit;
}

echo '<h3>Test Database</h3>';

try {
    $pdo = Database::connection();

    echo '<p style="color:green">
        Database Connection: <strong>OK</strong>
    </p>';

    $databaseName = $pdo
        ->query('SELECT DATABASE()')
        ->fetchColumn();

    echo '<p>Database aktif: <strong>'
        . htmlspecialchars((string) $databaseName)
        . '</strong></p>';

    $stmt = $pdo->query(
        "SHOW TABLES LIKE 'users'"
    );

    $usersTableExists =
        (bool) $stmt->fetchColumn();

    echo '<p>Tabel users: <strong>'
        . (
            $usersTableExists
                ? 'DITEMUKAN'
                : 'TIDAK DITEMUKAN'
        )
        . '</strong></p>';

    if ($usersTableExists) {
        $userCount = (int) $pdo
            ->query(
                'SELECT COUNT(*) FROM users'
            )
            ->fetchColumn();

        echo '<p>Jumlah user: <strong>'
            . $userCount
            . '</strong></p>';
    }
} catch (Throwable $exception) {
    echo '<p style="color:red">
        Database Connection:
        <strong>GAGAL</strong>
    </p>';

    echo '<pre>'
        . htmlspecialchars(
            get_class($exception)
            . ': '
            . $exception->getMessage()
        )
        . '</pre>';
}

echo '<hr>';

echo '<p>
    Setelah selesai diagnosis,
    <strong>HAPUS debug_server.php</strong>.
</p>';