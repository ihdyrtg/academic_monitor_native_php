<?php
declare(strict_types=1);

if (PHP_SAPI !== 'cli') {
    fwrite(STDERR, "Installer hanya boleh dijalankan dari CLI.\n");
    exit(1);
}

$root = dirname(__DIR__);
require_once $root . '/app/Config.php';

if (!is_file($root . '/.env') && is_file($root . '/.env.example')) {
    copy($root . '/.env.example', $root . '/.env');
    echo "File .env dibuat dari .env.example.\n";
}

Config::load($root);
require_once $root . '/app/Database.php';

$dbName = Config::get('DB_NAME', 'academic_monitor');
if (!preg_match('/^[A-Za-z0-9_]+$/', (string) $dbName)) {
    fwrite(STDERR, "DB_NAME hanya boleh berisi huruf, angka, dan underscore.\n");
    exit(1);
}

function runSql(PDO $pdo, string $file): void
{
    $sql = file_get_contents($file);
    if ($sql === false) {
        throw new RuntimeException("Tidak dapat membaca {$file}");
    }

    $statements = preg_split('/;\s*(?:\r?\n|$)/', $sql) ?: [];
    foreach ($statements as $statement) {
        $statement = trim($statement);
        if ($statement === '') {
            continue;
        }
        $pdo->exec($statement);
    }
}

try {
    $server = Database::serverConnection();
    $server->exec(
        sprintf(
            'CREATE DATABASE IF NOT EXISTS `%s` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',
            $dbName
        )
    );

    $pdo = Database::connection();

    echo "Menjalankan schema...\n";
    runSql($pdo, $root . '/database/schema.sql');

    echo "Memasukkan seed data asli dashboard...\n";
    runSql($pdo, $root . '/database/seed.sql');

    echo "\nInstalasi selesai.\n";
    echo "Database : {$dbName}\n";
    echo "Admin    : admin / Admin123!\n";
    echo "Dosen    : dosen / Dosen123!\n";
    echo "Segera ganti password default dari halaman Admin.\n";
} catch (Throwable $exception) {
    fwrite(STDERR, "Instalasi gagal: {$exception->getMessage()}\n");
    exit(1);
}
