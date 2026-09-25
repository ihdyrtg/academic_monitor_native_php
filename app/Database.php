<?php
declare(strict_types=1);

final class Database
{
    private static ?PDO $pdo = null;

    public static function connection(): PDO
    {
        if (self::$pdo instanceof PDO) {
            return self::$pdo;
        }

        // --- DATA SUDAH DIPERBAIKI (Ditambahkan tanda titik koma di akhir setiap baris) ---
        $host = '127.0.0.1';
        $port = '3306';
        $name = 'academic_monitor';
        $user = 'root';
        $pass = '';
        // -------------------------------------------------------------------

        $dsn = sprintf(
            'mysql:host=%s;port=%s;dbname=%s;charset=utf8mb4',
            $host,
            $port,
            $name
        );

        self::$pdo = new PDO(
            $dsn,
            $user,
            $pass,
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]
        );

        return self::$pdo;
    }

    public static function serverConnection(): PDO
    {
        // --- SAMAKAN DENGAN DATA DI ATAS ---
        $host = 'sql204.infinityfree.com';
        $port = '3306';
        $user = 'if0_42832251';
        $pass = 'BJTBiLpxcoUlrmX';
        // ------------------------------------

        return new PDO(
            sprintf('mysql:host=%s;port=%s;charset=utf8mb4', $host, $port),
            $user,
            $pass,
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]
        );
    }

    public static function transaction(callable $callback): mixed
    {
        $pdo = self::connection();

        if ($pdo->inTransaction()) {
            return $callback($pdo);
        }

        $pdo->beginTransaction();

        try {
            $result = $callback($pdo);
            $pdo->commit();
            return $result;
        } catch (Throwable $exception) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
            throw $exception;
        }
    }
}
