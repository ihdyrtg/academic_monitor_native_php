<?php
declare(strict_types=1);

final class Config
{
    private static array $values = [];

    public static function load(string $root): void
    {
        $envFile = $root . '/.env';
        $exampleFile = $root . '/.env.example';

        $source = is_file($envFile) ? $envFile : $exampleFile;
        if (is_file($source)) {
            foreach (file($source, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) ?: [] as $line) {
                $line = trim($line);
                if ($line === '' || str_starts_with($line, '#') || !str_contains($line, '=')) {
                    continue;
                }

                [$key, $value] = array_map('trim', explode('=', $line, 2));
                $value = trim($value, "\"'");
                self::$values[$key] = $value;
            }
        }

        foreach ($_ENV as $key => $value) {
            if (is_string($value)) {
                self::$values[$key] = $value;
            }
        }
    }

    public static function get(string $key, ?string $default = null): ?string
    {
        $env = getenv($key);
        if ($env !== false) {
            return (string) $env;
        }

        return self::$values[$key] ?? $default;
    }

    public static function bool(string $key, bool $default = false): bool
    {
        $value = self::get($key);
        if ($value === null) {
            return $default;
        }

        return filter_var($value, FILTER_VALIDATE_BOOL);
    }
}
