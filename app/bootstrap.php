<?php
    

    
declare(strict_types=1);

define('APP_ROOT', dirname(__DIR__));

require_once APP_ROOT . '/app/Config.php';
Config::load(APP_ROOT);

$secure = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off');
session_name((string) Config::get('SESSION_NAME', 'academic_monitor_session'));
session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'secure' => $secure,
    'httponly' => true,
    'samesite' => 'Lax',
]);
if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}

require_once APP_ROOT . '/app/Database.php';
require_once APP_ROOT . '/app/Csrf.php';
require_once APP_ROOT . '/app/helpers.php';
require_once APP_ROOT . '/app/Auth.php';
require_once APP_ROOT . '/app/Repository.php';
require_once APP_ROOT . '/app/AnalyticsService.php';
require_once APP_ROOT . '/app/LegacyImporter.php';

if (!headers_sent()) {
    header('X-Content-Type-Options: nosniff');
    header('X-Frame-Options: SAMEORIGIN');
    header('Referrer-Policy: strict-origin-when-cross-origin');
    header("Permissions-Policy: camera=(), microphone=(), geolocation=()");
}
