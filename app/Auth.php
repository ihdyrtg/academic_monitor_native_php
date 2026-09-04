<?php
declare(strict_types=1);

final class Auth
{
    private static ?array $cachedUser = null;

    public static function attempt(string $username, string $password): bool
    {
        $pdo = Database::connection();
        $stmt = $pdo->prepare(
            'SELECT u.*, s.nim AS student_nim, s.name AS student_name
             FROM users u
             LEFT JOIN students s ON s.id = u.student_id
             WHERE u.username = :username
             LIMIT 1'
        );
        $stmt->execute(['username' => $username]);
        $user = $stmt->fetch();

        if (
            !$user
            || !(bool) $user['is_active']
            || !password_verify($password, (string) $user['password_hash'])
        ) {
            return false;
        }

        session_regenerate_id(true);
        $_SESSION['user_id'] = (int) $user['id'];
        self::$cachedUser = null;

        $update = $pdo->prepare('UPDATE users SET last_login_at = NOW() WHERE id = :id');
        $update->execute(['id' => (int) $user['id']]);

        return true;
    }

    public static function user(): ?array
    {
        if (self::$cachedUser !== null) {
            return self::$cachedUser;
        }

        $id = (int) ($_SESSION['user_id'] ?? 0);
        if ($id <= 0) {
            return null;
        }

        $stmt = Database::connection()->prepare(
            'SELECT u.*, s.nim AS student_nim, s.name AS student_name
             FROM users u
             LEFT JOIN students s ON s.id = u.student_id
             WHERE u.id = :id AND u.is_active = 1
             LIMIT 1'
        );
        $stmt->execute(['id' => $id]);
        $user = $stmt->fetch();

        self::$cachedUser = $user ?: null;
        return self::$cachedUser;
    }

    public static function check(): bool
    {
        return self::user() !== null;
    }

    public static function role(): ?string
    {
        return self::user()['role'] ?? null;
    }

    public static function is(string ...$roles): bool
    {
        return in_array((string) self::role(), $roles, true);
    }

    public static function requireLogin(): void
    {
        if (!self::check()) {
            flash('warning', 'Silakan login untuk membuka dashboard.');
            redirect('login.php');
        }
    }

    public static function requireRole(string ...$roles): void
    {
        self::requireLogin();
        if (!self::is(...$roles)) {
            http_response_code(403);
            exit('Anda tidak memiliki akses ke halaman ini.');
        }
    }

    public static function logout(): void
    {
        self::$cachedUser = null;
        $_SESSION = [];

        if (ini_get('session.use_cookies')) {
            $params = session_get_cookie_params();
            setcookie(
                session_name(),
                '',
                time() - 42000,
                $params['path'],
                $params['domain'],
                $params['secure'],
                $params['httponly']
            );
        }

        session_destroy();
    }
}
