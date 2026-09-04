<?php
declare(strict_types=1);

function e(mixed $value): string
{
    return htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8');
}

function app_url(string $path = ''): string
{
    $base = rtrim((string) Config::get('APP_URL', ''), '/');
    if ($base === '') {
        $script = $_SERVER['SCRIPT_NAME'] ?? '';
        $directory = str_replace('\\', '/', dirname($script));
        $base = $directory === '/' ? '' : rtrim($directory, '/');
    }

    return $base . '/' . ltrim($path, '/');
}

function redirect(string $path): never
{
    header('Location: ' . app_url($path));
    exit;
}

function flash(string $type, string $message): void
{
    $_SESSION['_flash'][] = ['type' => $type, 'message' => $message];
}

function consume_flashes(): array
{
    $flashes = $_SESSION['_flash'] ?? [];
    unset($_SESSION['_flash']);
    return is_array($flashes) ? $flashes : [];
}

function post_string(string $key, string $default = ''): string
{
    return trim((string) ($_POST[$key] ?? $default));
}

function post_int(string $key, int $default = 0): int
{
    return filter_var($_POST[$key] ?? $default, FILTER_VALIDATE_INT) ?: $default;
}

function post_float_or_null(string $key): ?float
{
    $value = trim((string) ($_POST[$key] ?? ''));
    if ($value === '') {
        return null;
    }

    return is_numeric($value) ? (float) $value : null;
}

function checked(bool $condition): string
{
    return $condition ? 'checked' : '';
}

function selected(mixed $actual, mixed $expected): string
{
    return (string) $actual === (string) $expected ? 'selected' : '';
}

function safe_return_to(?string $value, string $fallback = 'dashboard.php'): string
{
    if (!$value) {
        return $fallback;
    }

    $value = ltrim($value, '/');
    if (
        str_contains($value, '://')
        || str_starts_with($value, '//')
        || str_contains($value, "\n")
        || str_contains($value, "\r")
    ) {
        return $fallback;
    }

    return $value;
}

function csv_cell(mixed $value): string
{
    $text = (string) ($value ?? '');
    if (preg_match('/^[=+\-@]/', $text) === 1) {
        $text = "'" . $text;
    }

    if (strpbrk($text, "\",\n\r;") !== false) {
        return '"' . str_replace('"', '""', $text) . '"';
    }

    return $text;
}

function initials(string $name, string $nim): string
{
    $name = trim($name);
    if ($name === '') {
        return substr($nim, -2);
    }

    $parts = preg_split('/\s+/', $name) ?: [];
    $letters = '';
    foreach (array_slice($parts, 0, 2) as $part) {
        $letters .= mb_strtoupper(mb_substr($part, 0, 1));
    }

    return $letters ?: substr($nim, -2);
}

function display_name(array $student): string
{
    $name = trim((string) ($student['name'] ?? ''));
    return $name !== '' ? $name : 'Nama belum diisi';
}

function valid_resource_url(?string $url, string $type): ?string
{
    $url = trim((string) $url);
    if ($url === '') {
        return null;
    }

    if (!preg_match('~^https?://~i', $url)) {
        $url = 'https://' . $url;
    }

    if (!filter_var($url, FILTER_VALIDATE_URL)) {
        return null;
    }

    $host = strtolower((string) parse_url($url, PHP_URL_HOST));
    $allowed = match ($type) {
        'github' => ['github.com', 'www.github.com'],
        'colab' => ['colab.research.google.com'],
        'drive' => ['drive.google.com', 'docs.google.com'],
        default => [],
    };

    return in_array($host, $allowed, true) ? $url : null;
}

function resource_links(array $student, bool $compact = false): string
{
    $items = [];
    $map = [
        'github_url' => ['github', 'GitHub'],
        'colab_url' => ['colab', 'Colab'],
        'drive_url' => ['drive', 'Drive'],
    ];

    foreach ($map as $field => [$type, $label]) {
        $url = valid_resource_url($student[$field] ?? null, $type);
        if (!$url) {
            continue;
        }

        $items[] = sprintf(
            '<a class="resource-link %s" href="%s" target="_blank" rel="noopener noreferrer">%s%s</a>',
            e($type),
            e($url),
            e($compact ? $label : $label),
            $compact ? ' ↗' : ' ↗'
        );
    }

    if ($items === []) {
        return '<span class="resource-empty">—</span>';
    }

    return '<div class="resource-links">' . implode('', $items) . '</div>';
}
