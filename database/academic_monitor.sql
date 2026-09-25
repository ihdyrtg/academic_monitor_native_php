-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql204.infinityfree.com
-- Generation Time: Sep 23, 2026 at 10:49 PM
-- Server version: 11.4.13-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_42832251_academic_monitor`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `class_id`, `user_id`, `type`, `text`, `created_at`) VALUES
(3, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524233.', '2026-09-03 16:18:24'),
(4, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2523128.', '2026-09-03 16:18:24'),
(5, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524233.', '2026-09-03 16:18:24'),
(6, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524228.', '2026-09-03 16:18:24'),
(7, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524233.', '2026-09-03 16:18:24'),
(8, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524228.', '2026-09-03 16:18:24'),
(9, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524219.', '2026-09-03 16:18:24'),
(10, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524217.', '2026-09-03 16:18:24'),
(11, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524217.', '2026-09-03 16:18:24'),
(12, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524219.', '2026-09-03 16:18:24'),
(13, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524219.', '2026-09-03 16:18:24'),
(14, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524235.', '2026-09-03 16:18:24'),
(15, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524235.', '2026-09-03 16:18:24'),
(16, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524215.', '2026-09-03 16:18:24'),
(17, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524215.', '2026-09-03 16:18:24'),
(18, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524220.', '2026-09-03 16:18:24'),
(19, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524220.', '2026-09-03 16:18:24'),
(20, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524216.', '2026-09-03 16:18:24'),
(21, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524216.', '2026-09-03 16:18:24'),
(22, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2523128.', '2026-09-03 16:18:24'),
(23, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524231.', '2026-09-03 16:18:24'),
(24, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524231.', '2026-09-03 16:18:24'),
(25, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524231.', '2026-09-03 16:18:24'),
(26, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524230.', '2026-09-03 16:18:24'),
(27, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524244.', '2026-09-03 16:18:24'),
(28, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524244.', '2026-09-03 16:18:24'),
(29, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524212.', '2026-09-03 16:18:24'),
(30, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524212.', '2026-09-03 16:18:24'),
(31, 2, 1, 'Mahasiswa', '2524231 diperbarui.', '2026-09-03 16:18:24'),
(32, 2, 1, 'Mahasiswa', '2524212 diperbarui.', '2026-09-03 16:18:24'),
(33, 2, 1, 'Mahasiswa', '2524244 diperbarui.', '2026-09-03 16:18:24'),
(34, 2, 1, 'Mahasiswa', '2524230 diperbarui.', '2026-09-03 16:18:24'),
(35, 2, 1, 'Mahasiswa', '2524245 diperbarui.', '2026-09-03 16:18:24'),
(36, 2, 1, 'Mahasiswa', '2524229 diperbarui.', '2026-09-03 16:18:24'),
(37, 2, 1, 'Mahasiswa', '2524234 diperbarui.', '2026-09-03 16:18:24'),
(38, 2, 1, 'Mahasiswa', '2524225 diperbarui.', '2026-09-03 16:18:24'),
(39, 2, 1, 'Mahasiswa', '2524238 diperbarui.', '2026-09-03 16:18:24'),
(40, 2, 1, 'Mahasiswa', '2524224 diperbarui.', '2026-09-03 16:18:24'),
(41, 2, 1, 'Mahasiswa', '2524241 diperbarui.', '2026-09-03 16:18:24'),
(42, 2, 1, 'Mahasiswa', '2524246 diperbarui.', '2026-09-03 16:18:24'),
(43, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524225.', '2026-09-03 16:18:24'),
(44, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524238.', '2026-09-03 16:18:24'),
(45, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524224.', '2026-09-03 16:18:24'),
(46, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524241.', '2026-09-03 16:18:24'),
(47, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524234.', '2026-09-03 16:18:24'),
(48, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524229.', '2026-09-03 16:18:24'),
(49, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524244.', '2026-09-03 16:18:24'),
(50, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524230.', '2026-09-03 16:18:24'),
(51, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524234.', '2026-09-03 16:18:24'),
(52, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524229.', '2026-09-03 16:18:24'),
(53, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524245.', '2026-09-03 16:18:24'),
(54, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524245.', '2026-09-03 16:18:24'),
(55, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524229.', '2026-09-03 16:18:24'),
(56, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524234.', '2026-09-03 16:18:24'),
(57, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524225.', '2026-09-03 16:18:24'),
(58, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524225.', '2026-09-03 16:18:24'),
(59, 2, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:24'),
(60, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524238.', '2026-09-03 16:18:24'),
(61, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524224.', '2026-09-03 16:18:24'),
(62, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524241.', '2026-09-03 16:18:24'),
(63, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524246.', '2026-09-03 16:18:24'),
(64, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524238.', '2026-09-03 16:18:24'),
(65, 2, 1, 'Presensi', '2524233 ditandai Alpa pada Pertemuan 1.', '2026-09-03 16:18:24'),
(66, 2, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 1.', '2026-09-03 16:18:24'),
(67, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524224.', '2026-09-03 16:18:24'),
(68, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524241.', '2026-09-03 16:18:24'),
(69, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524246.', '2026-09-03 16:18:24'),
(70, 2, 1, 'Tugas', 'Tugas 2 diperbarui.', '2026-09-03 16:18:24'),
(71, 2, 1, 'Tugas', 'Praktikum (1-2) diperbarui.', '2026-09-03 16:18:24'),
(72, 2, 1, 'Mahasiswa', '2524233 diperbarui.', '2026-09-03 16:18:24'),
(73, 2, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-03 16:18:24'),
(74, 2, 1, 'Mahasiswa', 'Import CSV selesai: 0 ditambahkan, 31 diperbarui, 0 dilewati.', '2026-09-03 16:18:24'),
(75, 2, 1, 'Sistem', 'Pengaturan kelas diperbarui.', '2026-09-03 16:18:24'),
(76, 2, 1, 'Sistem', 'Dashboard dibuat dari denah PTIK 5F pada lampiran.', '2026-09-03 16:18:24'),
(77, 2, 1, 'Sistem', 'Data dashboard HTML/JSON lama berhasil dimigrasikan ke database.', '2026-09-03 16:18:24'),
(78, 3, 1, 'Mahasiswa', '2524176 diperbarui.', '2026-09-03 16:18:25'),
(79, 3, 1, 'Mahasiswa', '2524204 diperbarui.', '2026-09-03 16:18:25'),
(80, 3, 1, 'Mahasiswa', '2524178 diperbarui.', '2026-09-03 16:18:25'),
(81, 3, 1, 'Tugas', 'Tugas 2 diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(82, 3, 1, 'Tugas', 'Tugas 2 diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(83, 3, 1, 'Tugas', 'Tugas 3 diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(84, 3, 1, 'Tugas', 'Tugas 3 diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(85, 3, 1, 'Tugas', 'Tugas 4 diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(86, 3, 1, 'Tugas', 'Tugas 4 diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(87, 3, 1, 'Tugas', 'Tugas 5 diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(88, 3, 1, 'Tugas', 'Tugas 5 diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(89, 3, 1, 'Tugas', 'UTS diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(90, 3, 1, 'Tugas', 'UTS diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(91, 3, 1, 'Tugas', 'UAS diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(92, 3, 1, 'Tugas', 'UAS diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(93, 3, 1, 'Tugas', 'UAS diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(94, 3, 1, 'Tugas', 'UAS diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(95, 3, 1, 'Tugas', 'UAS diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(96, 3, 1, 'Tugas', 'UTS diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(97, 3, 1, 'Tugas', 'Tugas 5 diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(98, 3, 1, 'Tugas', 'Tugas 4 diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(99, 3, 1, 'Tugas', 'Tugas 3 diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(100, 3, 1, 'Tugas', 'Tugas 2 diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(101, 3, 1, 'Tugas', 'Tugas 5 diperbarui.', '2026-09-03 16:18:25'),
(102, 3, 1, 'Tugas', 'Tugas 4 diperbarui.', '2026-09-03 16:18:25'),
(103, 3, 1, 'Tugas', 'Tugas 3 diperbarui.', '2026-09-03 16:18:25'),
(104, 3, 1, 'Tugas', 'Tugas 2 diperbarui.', '2026-09-03 16:18:25'),
(105, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui.', '2026-09-03 16:18:25'),
(106, 3, 1, 'Tugas', 'UAS diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(107, 3, 1, 'Tugas', 'UTS diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(108, 3, 1, 'Tugas', 'Tugas 5 diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(109, 3, 1, 'Tugas', 'Tugas 4 diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(110, 3, 1, 'Tugas', 'Tugas 3 diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(111, 3, 1, 'Tugas', 'Tugas 2 diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(112, 3, 1, 'Tugas', 'Tugas 5 diperbarui.', '2026-09-03 16:18:25'),
(113, 3, 1, 'Tugas', 'Tugas 4 diperbarui.', '2026-09-03 16:18:25'),
(114, 3, 1, 'Tugas', 'Tugas 3 diperbarui.', '2026-09-03 16:18:25'),
(115, 3, 1, 'Tugas', 'Tugas 2 diperbarui.', '2026-09-03 16:18:25'),
(116, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524195.', '2026-09-03 16:18:25'),
(117, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524195.', '2026-09-03 16:18:25'),
(118, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524197.', '2026-09-03 16:18:25'),
(119, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524197.', '2026-09-03 16:18:25'),
(120, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524209.', '2026-09-03 16:18:25'),
(121, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524209.', '2026-09-03 16:18:25'),
(122, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2523261.', '2026-09-03 16:18:25'),
(123, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2523261.', '2026-09-03 16:18:25'),
(124, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524183.', '2026-09-03 16:18:25'),
(125, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524183.', '2026-09-03 16:18:25'),
(126, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524183.', '2026-09-03 16:18:25'),
(127, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524183.', '2026-09-03 16:18:25'),
(128, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524185.', '2026-09-03 16:18:25'),
(129, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524185.', '2026-09-03 16:18:25'),
(130, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524184.', '2026-09-03 16:18:25'),
(131, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524184.', '2026-09-03 16:18:25'),
(132, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524095.', '2026-09-03 16:18:25'),
(133, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524095.', '2026-09-03 16:18:25'),
(134, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2522258.', '2026-09-03 16:18:25'),
(135, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2522258.', '2026-09-03 16:18:25'),
(136, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524202.', '2026-09-03 16:18:25'),
(137, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524202.', '2026-09-03 16:18:25'),
(138, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524207.', '2026-09-03 16:18:25'),
(139, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524207.', '2026-09-03 16:18:25'),
(140, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524208.', '2026-09-03 16:18:25'),
(141, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524208.', '2026-09-03 16:18:25'),
(142, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524194.', '2026-09-03 16:18:25'),
(143, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524194.', '2026-09-03 16:18:25'),
(144, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524181.', '2026-09-03 16:18:25'),
(145, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524181.', '2026-09-03 16:18:25'),
(146, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524191.', '2026-09-03 16:18:25'),
(147, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524191.', '2026-09-03 16:18:25'),
(148, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524192.', '2026-09-03 16:18:25'),
(149, 3, 1, 'Presensi', '2524202 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(150, 3, 1, 'Presensi', '2524176 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(151, 3, 1, 'Presensi', '2524203 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(152, 3, 1, 'Presensi', '2524186 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(153, 3, 1, 'Presensi', '2524187 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(154, 3, 1, 'Presensi', '2522258 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(155, 3, 1, 'Presensi', '2524200 ditandai Sakit pada Pertemuan 2.', '2026-09-03 16:18:25'),
(156, 3, 1, 'Presensi', '2524200 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(157, 3, 1, 'Presensi', '2524095 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(158, 3, 1, 'Presensi', '2524184 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(159, 3, 1, 'Presensi', '2524185 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(160, 3, 1, 'Presensi', '2524183 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(161, 3, 1, 'Presensi', '2523261 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(162, 3, 1, 'Presensi', '2524209 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(163, 3, 1, 'Presensi', '2524197 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(164, 3, 1, 'Presensi', '2524195 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(165, 3, 1, 'Presensi', '2524207 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(166, 3, 1, 'Presensi', '2524208 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(167, 3, 1, 'Presensi', '2524194 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(168, 3, 1, 'Presensi', '2524181 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(169, 3, 1, 'Presensi', '2524088 ditandai Izin pada Pertemuan 2.', '2026-09-03 16:18:25'),
(170, 3, 1, 'Presensi', '2524179 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(171, 3, 1, 'Presensi', '2524206 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(172, 3, 1, 'Presensi', '2524191 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(173, 3, 1, 'Presensi', '2524178 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(174, 3, 1, 'Presensi', '2524192 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(175, 3, 1, 'Presensi', '2524205 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(176, 3, 1, 'Presensi', '2524177 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(177, 3, 1, 'Presensi', '2524204 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(178, 3, 1, 'Presensi', '2524188 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(179, 3, 1, 'Presensi', '2524189 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(180, 3, 1, 'Presensi', '2524182 ditandai Hadir pada Pertemuan 2.', '2026-09-03 16:18:25'),
(181, 3, 1, 'Presensi', '2524182 ditandai Hadir pada Pertemuan 1.', '2026-09-03 16:18:25'),
(182, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524205.', '2026-09-03 16:18:25'),
(183, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524205.', '2026-09-03 16:18:25'),
(184, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524188.', '2026-09-03 16:18:25'),
(185, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524188.', '2026-09-03 16:18:25'),
(186, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524188.', '2026-09-03 16:18:25'),
(187, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(188, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524189.', '2026-09-03 16:18:25'),
(189, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(190, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui untuk 2524182.', '2026-09-03 16:18:25'),
(191, 3, 1, 'Mahasiswa', '2524197 diperbarui.', '2026-09-03 16:18:25'),
(192, 3, 1, 'Mahasiswa', '2524095 diperbarui.', '2026-09-03 16:18:25'),
(193, 3, 1, 'Mahasiswa', '2524205 diperbarui.', '2026-09-03 16:18:25'),
(194, 3, 1, 'Mahasiswa', '2524205 diperbarui.', '2026-09-03 16:18:25'),
(195, 3, 1, 'Mahasiswa', '2522258 diperbarui.', '2026-09-03 16:18:25'),
(196, 3, 1, 'Mahasiswa', '2524202 diperbarui.', '2026-09-03 16:18:25'),
(197, 3, 1, 'Mahasiswa', '2524176 diperbarui.', '2026-09-03 16:18:25'),
(198, 3, 1, 'Mahasiswa', '2524203 diperbarui.', '2026-09-03 16:18:25'),
(199, 3, 1, 'Mahasiswa', '2524186 diperbarui.', '2026-09-03 16:18:25'),
(200, 3, 1, 'Mahasiswa', '2524187 diperbarui.', '2026-09-03 16:18:25'),
(201, 3, 1, 'Mahasiswa', '2522258 diperbarui.', '2026-09-03 16:18:25'),
(202, 3, 1, 'Mahasiswa', '2524095 diperbarui.', '2026-09-03 16:18:25'),
(203, 3, 1, 'Mahasiswa', '2524184 diperbarui.', '2026-09-03 16:18:25'),
(204, 3, 1, 'Mahasiswa', '2524185 diperbarui.', '2026-09-03 16:18:25'),
(205, 3, 1, 'Mahasiswa', '2524183 diperbarui.', '2026-09-03 16:18:25'),
(206, 3, 1, 'Mahasiswa', '2523261 diperbarui.', '2026-09-03 16:18:25'),
(207, 3, 1, 'Mahasiswa', '2524197 diperbarui.', '2026-09-03 16:18:25'),
(208, 3, 1, 'Mahasiswa', '2524195 diperbarui.', '2026-09-03 16:18:25'),
(209, 3, 1, 'Mahasiswa', '2524207 diperbarui.', '2026-09-03 16:18:25'),
(210, 3, 1, 'Mahasiswa', '2524208 diperbarui.', '2026-09-03 16:18:25'),
(211, 3, 1, 'Mahasiswa', '2524181 diperbarui.', '2026-09-03 16:18:25'),
(212, 3, 1, 'Mahasiswa', '2524179 diperbarui.', '2026-09-03 16:18:25'),
(213, 3, 1, 'Mahasiswa', '2524206 diperbarui.', '2026-09-03 16:18:25'),
(214, 3, 1, 'Mahasiswa', '2524191 diperbarui.', '2026-09-03 16:18:25'),
(215, 3, 1, 'Mahasiswa', '2524178 diperbarui.', '2026-09-03 16:18:25'),
(216, 3, 1, 'Mahasiswa', '2524205 diperbarui.', '2026-09-03 16:18:25'),
(217, 3, 1, 'Mahasiswa', '2524177 diperbarui.', '2026-09-03 16:18:25'),
(218, 3, 1, 'Mahasiswa', '2524188 diperbarui.', '2026-09-03 16:18:25'),
(219, 3, 1, 'Mahasiswa', '2524189 diperbarui.', '2026-09-03 16:18:25'),
(220, 3, 1, 'Mahasiswa', '2524182 diperbarui.', '2026-09-03 16:18:25'),
(221, 3, 1, 'Mahasiswa', '2524192 diperbarui.', '2026-09-03 16:18:25'),
(222, 3, 1, 'Mahasiswa', 'Import CSV: 0 ditambahkan, 31 diperbarui.', '2026-09-03 16:18:25'),
(223, 3, 1, 'Tugas', 'Praktikum (1-2) diperbarui.', '2026-09-03 16:18:25'),
(224, 3, 1, 'Mahasiswa', '2524184 diperbarui.', '2026-09-03 16:18:25'),
(225, 3, 1, 'Mahasiswa', '2524185 diperbarui.', '2026-09-03 16:18:25'),
(226, 3, 1, 'Mahasiswa', '2524197 diperbarui.', '2026-09-03 16:18:25'),
(227, 3, 1, 'Mahasiswa', '2524207 diperbarui.', '2026-09-03 16:18:25'),
(228, 3, 1, 'Mahasiswa', '2524208 diperbarui.', '2026-09-03 16:18:25'),
(229, 3, 1, 'Mahasiswa', '2524179 diperbarui.', '2026-09-03 16:18:25'),
(230, 3, 1, 'Mahasiswa', '2524206 diperbarui.', '2026-09-03 16:18:25'),
(231, 3, 1, 'Mahasiswa', '2524178 diperbarui.', '2026-09-03 16:18:25'),
(232, 3, 1, 'Mahasiswa', '2524205 diperbarui.', '2026-09-03 16:18:25'),
(233, 3, 1, 'Mahasiswa', '2524182 diperbarui.', '2026-09-03 16:18:25'),
(234, 3, 1, 'Mahasiswa', '2524202 diperbarui.', '2026-09-03 16:18:25'),
(235, 3, 1, 'Mahasiswa', '2524176 diperbarui.', '2026-09-03 16:18:25'),
(236, 3, 1, 'Mahasiswa', '2524203 diperbarui.', '2026-09-03 16:18:25'),
(237, 3, 1, 'Mahasiswa', '2524186 diperbarui.', '2026-09-03 16:18:25'),
(238, 3, 1, 'Mahasiswa', '2524187 diperbarui.', '2026-09-03 16:18:25'),
(239, 3, 1, 'Mahasiswa', '2524095 diperbarui.', '2026-09-03 16:18:25'),
(240, 3, 1, 'Mahasiswa', 'Import CSV: 30 ditambahkan, 1 diperbarui.', '2026-09-03 16:18:25'),
(241, 3, 1, 'Mahasiswa', '2524182 ditambahkan.', '2026-09-03 16:18:25'),
(242, 3, 1, 'Sistem', 'Kelas monitoring dibuat.', '2026-09-03 16:18:25'),
(243, 3, 1, 'Sistem', 'Data dashboard HTML/JSON lama berhasil dimigrasikan ke database.', '2026-09-03 16:18:25'),
(244, 4, 1, 'Mahasiswa', '2424042 ditambahkan.', '2026-09-03 16:18:25'),
(245, 4, 1, 'Sistem', 'Kelas monitoring dibuat.', '2026-09-03 16:18:25'),
(246, 4, 1, 'Sistem', 'Data dashboard HTML/JSON lama berhasil dimigrasikan ke database.', '2026-09-03 16:18:25');
INSERT INTO `activity_logs` (`id`, `class_id`, `user_id`, `type`, `text`, `created_at`) VALUES
(247, 3, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 1.', '2026-09-03 16:19:51'),
(248, 3, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-03 16:21:56'),
(249, 3, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-03 16:26:06'),
(250, 3, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-03 16:54:02'),
(251, 3, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-03 16:55:36'),
(252, 3, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-03 17:00:35'),
(253, 3, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-03 17:03:16'),
(254, 3, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-03 17:05:00'),
(255, 3, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-03 17:05:39'),
(256, 3, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-04 15:45:45'),
(257, 3, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-04 16:03:41'),
(258, 3, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-04 16:24:38'),
(259, 3, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-04 16:25:16'),
(260, 3, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-04 16:25:17'),
(261, 3, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-04 16:25:24'),
(262, 3, 1, 'Portal', 'PIN portal mahasiswa 2524182 diperbarui.', '2026-09-04 16:28:37'),
(263, 3, 1, 'Portal', 'PIN portal mahasiswa 2524182 diperbarui.', '2026-09-04 16:28:45'),
(264, 3, 1, 'Portal', 'PIN portal mahasiswa 2524195 diperbarui.', '2026-09-04 16:28:49'),
(265, 3, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-04 16:33:38'),
(266, 3, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-04 17:03:32'),
(276, 7, 1, 'Mahasiswa', '2924020 ditambahkan.', '2026-09-04 17:32:48'),
(277, 7, 1, 'Tugas', 'Komponen Praktikum (1-2) ditambahkan.', '2026-09-04 17:34:17'),
(278, 7, 1, 'Mahasiswa', 'Import CSV: 38 ditambahkan, 1 diperbarui.', '2026-09-04 17:34:34'),
(279, 7, 1, 'Tugas', 'Komponen Tugas 2 ditambahkan.', '2026-09-04 17:35:20'),
(280, 7, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-04 17:35:32'),
(281, 7, 1, 'Tugas', 'Komponen Tugas 3 ditambahkan.', '2026-09-04 17:36:42'),
(282, 7, 1, 'Tugas', 'Komponen Tugas 4 ditambahkan.', '2026-09-04 17:37:00'),
(283, 7, 1, 'Tugas', 'Komponen Tugas 5 ditambahkan.', '2026-09-04 17:37:14'),
(284, 7, 1, 'Tugas', 'Komponen UTS ditambahkan.', '2026-09-04 17:37:25'),
(285, 7, 1, 'Tugas', 'Komponen Proyek ditambahkan.', '2026-09-04 17:37:44'),
(286, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-04 17:39:08'),
(287, 7, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 1.', '2026-09-04 17:39:19'),
(288, 7, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-04 17:39:22'),
(289, 7, 1, 'Tugas', 'Komponen Tugas 2 diperbarui.', '2026-09-04 17:40:09'),
(290, 7, 1, 'Tugas', 'Komponen Tugas 3 diperbarui.', '2026-09-04 17:40:15'),
(291, 7, 1, 'Tugas', 'Komponen Tugas 4 diperbarui.', '2026-09-04 17:40:22'),
(292, 7, 1, 'Tugas', 'Komponen Tugas 5 diperbarui.', '2026-09-04 17:40:29'),
(293, 7, 1, 'Tugas', 'Komponen UTS diperbarui.', '2026-09-04 17:40:35'),
(294, 7, 1, 'Tugas', 'Komponen Proyek diperbarui.', '2026-09-04 17:40:42'),
(295, 8, 1, 'Mahasiswa', 'Import CSV: 39 ditambahkan, 0 diperbarui.', '2026-09-04 17:41:04'),
(296, 3, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-04 17:54:09'),
(297, 2, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-05 09:22:16'),
(298, 2, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-05 09:23:19'),
(299, 2, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-05 09:25:30'),
(300, 2, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-05 09:26:01'),
(301, 2, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-05 09:42:49'),
(302, 2, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-05 09:47:39'),
(303, 2, 1, 'Tugas', 'Nilai/status Tugas 4 diperbarui.', '2026-09-05 09:47:47'),
(304, 2, 1, 'Tugas', 'Nilai/status Tugas 5 diperbarui.', '2026-09-05 09:47:57'),
(305, 2, 1, 'Tugas', 'Nilai/status Tugas 5 diperbarui.', '2026-09-05 09:48:12'),
(306, 2, 1, 'Tugas', 'Nilai/status Tugas 4 diperbarui.', '2026-09-05 09:48:24'),
(307, 2, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-05 09:48:49'),
(308, 2, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-05 09:48:49'),
(309, 2, 1, 'Tugas', 'Nilai/status UTS diperbarui.', '2026-09-05 09:49:10'),
(310, 2, 1, 'Tugas', 'Nilai/status UAS diperbarui.', '2026-09-05 09:49:23'),
(311, 2, 1, 'Tugas', 'Nilai/status UAS diperbarui.', '2026-09-05 09:49:46'),
(312, 2, 1, 'Tugas', 'Nilai/status UAS diperbarui.', '2026-09-05 09:49:47'),
(313, 2, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-05 09:50:11'),
(314, 2, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-05 09:50:57'),
(315, 2, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-05 09:51:15'),
(316, 2, 1, 'Tugas', 'Nilai/status Tugas 5 diperbarui.', '2026-09-05 09:51:30'),
(317, 2, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-05 09:51:57'),
(318, 2, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-05 09:52:13'),
(319, 2, 1, 'Tugas', 'Nilai/status Tugas 4 diperbarui.', '2026-09-05 09:52:38'),
(320, 2, 1, 'Tugas', 'Nilai/status Tugas 4 diperbarui.', '2026-09-05 09:52:38'),
(321, 2, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-07 03:16:13'),
(322, 2, 1, 'Tugas', 'Nilai/status Tugas 5 diperbarui.', '2026-09-07 03:19:17'),
(323, 2, 1, 'Tugas', 'Nilai/status Tugas 5 diperbarui.', '2026-09-07 03:19:46'),
(324, 2, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-07 03:20:32'),
(325, 2, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-07 03:21:02'),
(326, 2, 1, 'Tugas', 'Nilai/status Tugas 4 diperbarui.', '2026-09-07 03:21:18'),
(327, 2, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-07 03:21:36'),
(328, 2, 1, 'Tugas', 'Nilai/status UAS diperbarui.', '2026-09-07 03:21:45'),
(329, 2, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-07 03:22:42'),
(330, 2, 1, 'Tugas', 'Nilai/status Tugas 3 diperbarui.', '2026-09-07 03:22:51'),
(331, 2, 1, 'Tugas', 'Nilai/status Tugas 4 diperbarui.', '2026-09-07 03:23:00'),
(332, 2, 1, 'Tugas', 'Nilai/status Tugas 5 diperbarui.', '2026-09-07 03:23:07'),
(333, 2, 1, 'Tugas', 'Nilai/status UTS diperbarui.', '2026-09-07 03:23:17'),
(334, 2, 1, 'Tugas', 'Nilai/status UAS diperbarui.', '2026-09-07 03:23:26'),
(335, 2, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-07 03:23:48'),
(336, 2, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-07 03:24:09'),
(337, 2, 1, 'Tugas', 'Nilai/status Tugas 2 diperbarui.', '2026-09-07 03:24:43'),
(338, 2, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-07 03:25:04'),
(339, 2, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-07 03:27:06'),
(340, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-07 04:00:08'),
(341, 9, 1, 'Mahasiswa', 'Import CSV: 18 ditambahkan, 0 diperbarui.', '2026-09-07 06:20:43'),
(342, 4, 1, 'Mahasiswa', 'Import CSV: 19 ditambahkan, 1 diperbarui.', '2026-09-07 06:46:31'),
(343, 4, 1, 'Mahasiswa', '2424041 diperbarui.', '2026-09-07 06:50:15'),
(344, 4, 1, 'Mahasiswa', '2424029 diperbarui.', '2026-09-07 06:51:31'),
(345, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 06:51:59'),
(346, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 07:03:47'),
(347, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 07:47:09'),
(348, 4, 1, 'Mahasiswa', '2424025 diperbarui.', '2026-09-07 07:47:21'),
(349, 4, 1, 'Mahasiswa', '2424025 diperbarui.', '2026-09-07 07:47:21'),
(350, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 07:48:42'),
(351, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 07:49:10'),
(352, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 07:49:26'),
(353, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 07:49:53'),
(354, 4, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 1.', '2026-09-07 07:50:52'),
(355, 4, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 2.', '2026-09-07 07:51:01'),
(356, 4, 1, 'Mahasiswa', '2424032 diperbarui.', '2026-09-07 08:06:48'),
(357, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:09:19'),
(358, 4, 1, 'Mahasiswa', '2424036 diperbarui.', '2026-09-07 08:09:57'),
(359, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:10:23'),
(360, 4, 1, 'Mahasiswa', '2424038 diperbarui.', '2026-09-07 08:11:05'),
(361, 4, 1, 'Mahasiswa', '2424039 diperbarui.', '2026-09-07 08:11:41'),
(362, 4, 1, 'Mahasiswa', '2424040 diperbarui.', '2026-09-07 08:16:09'),
(363, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:16:33'),
(364, 4, 1, 'Mahasiswa', '2424045 diperbarui.', '2026-09-07 08:18:46'),
(365, 4, 1, 'Mahasiswa', '2424033 diperbarui.', '2026-09-07 08:23:24'),
(366, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:24:35'),
(367, 4, 1, 'Mahasiswa', '2424027 diperbarui.', '2026-09-07 08:45:54'),
(368, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:47:12'),
(369, 4, 1, 'Mahasiswa', '2422074 diperbarui.', '2026-09-07 08:48:13'),
(370, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:49:02'),
(371, 4, 1, 'Mahasiswa', '2424026 diperbarui.', '2026-09-07 08:49:24'),
(372, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:51:21'),
(373, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:52:53'),
(374, 4, 1, 'Mahasiswa', '2424031 diperbarui.', '2026-09-07 08:55:58'),
(375, 4, 1, 'Tugas', 'Nilai/status Tugas 1 diperbarui.', '2026-09-07 08:56:16'),
(376, 7, 1, 'Presensi', 'Presensi Pertemuan 2 diperbarui.', '2026-09-08 01:06:43'),
(377, 7, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-08 02:24:58'),
(378, 7, 1, 'Mahasiswa', '2924003 diperbarui.', '2026-09-08 02:36:26'),
(379, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-08 02:37:36'),
(380, 7, 1, 'Mahasiswa', '2924020 diperbarui.', '2026-09-08 02:39:05'),
(381, 7, 1, 'Mahasiswa', '2924018 diperbarui.', '2026-09-08 02:39:50'),
(382, 7, 1, 'Mahasiswa', '2924005 diperbarui.', '2026-09-08 02:40:39'),
(383, 7, 1, 'Mahasiswa', '2924031 diperbarui.', '2026-09-08 02:41:05'),
(384, 7, 1, 'Mahasiswa', '2924038 diperbarui.', '2026-09-08 02:48:41'),
(385, 8, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 1.', '2026-09-08 03:35:04'),
(386, 8, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 2.', '2026-09-08 03:35:09'),
(387, 8, 1, 'Presensi', 'Presensi Pertemuan 2 diperbarui.', '2026-09-08 03:35:15'),
(388, 8, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-08 03:35:20'),
(389, 8, 1, 'Tugas', 'Komponen Praktikum (1-2) ditambahkan.', '2026-09-08 03:36:10'),
(390, 9, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 1.', '2026-09-08 04:36:43'),
(391, 9, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 2.', '2026-09-08 04:36:47'),
(392, 9, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-08 04:36:57'),
(393, 9, 1, 'Presensi', 'Presensi Pertemuan 2 diperbarui.', '2026-09-08 04:37:00'),
(394, 8, 1, 'Kuis', 'Kuis 1 - Editor Essensial dibuat.', '2026-09-08 09:17:34'),
(395, 8, 1, 'Kuis', '20 soal diimpor ke kuis #1.', '2026-09-08 09:18:09'),
(396, 8, 1, 'Live Quiz', 'Sesi Live Quiz dibuat.', '2026-09-08 09:18:35'),
(397, 8, 1, 'Kuis', 'Kuis \"Kuis 1 - Editor Essensial\" dihapus.', '2026-09-08 09:23:33'),
(398, 8, 1, 'Kuis', 'kuis 1 - Editor Essensial dibuat.', '2026-09-08 09:25:33'),
(399, 8, 1, 'Kuis', '20 soal diimpor ke kuis #2.', '2026-09-08 09:25:57'),
(400, 8, 1, 'Live Quiz', 'Sesi Live Quiz dibuat.', '2026-09-08 09:26:35'),
(401, 9, 1, 'Presensi', 'Presensi Pertemuan 2 diperbarui.', '2026-09-08 09:34:59'),
(402, 9, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-08 09:35:10'),
(403, 4, 1, 'Presensi', 'Presensi Pertemuan 3 diperbarui.', '2026-09-09 02:59:20'),
(404, 4, 1, 'Mahasiswa', '2424045 diperbarui.', '2026-09-09 03:00:14'),
(405, 4, 1, 'Mahasiswa', '2424031 diperbarui.', '2026-09-09 03:00:32'),
(406, 4, 1, 'Mahasiswa', '2424043 diperbarui.', '2026-09-09 03:00:40'),
(407, 4, 1, 'Mahasiswa', '2424032 diperbarui.', '2026-09-09 03:00:53'),
(408, 4, 1, 'Mahasiswa', '2424025 diperbarui.', '2026-09-09 03:01:15'),
(409, 4, 1, 'Mahasiswa', '2422074 diperbarui.', '2026-09-09 03:01:29'),
(410, 4, 1, 'Mahasiswa', '2424026 diperbarui.', '2026-09-09 03:01:38'),
(411, 4, 1, 'Mahasiswa', '2424042 diperbarui.', '2026-09-09 03:01:46'),
(412, 4, 1, 'Mahasiswa', '2424034 diperbarui.', '2026-09-09 03:02:07'),
(413, 4, 1, 'Mahasiswa', '2424041 diperbarui.', '2026-09-09 03:02:14'),
(414, 4, 1, 'Mahasiswa', '2424027 diperbarui.', '2026-09-09 03:02:24'),
(415, 4, 1, 'Mahasiswa', '2424030 diperbarui.', '2026-09-09 03:02:45'),
(416, 4, 1, 'Mahasiswa', '2424048 diperbarui.', '2026-09-09 03:02:54'),
(417, 4, 1, 'Mahasiswa', '2424036 diperbarui.', '2026-09-09 03:03:01'),
(418, 4, 1, 'Mahasiswa', '2424040 diperbarui.', '2026-09-09 03:03:21'),
(419, 4, 1, 'Mahasiswa', '2424038 diperbarui.', '2026-09-09 03:03:29'),
(420, 4, 1, 'Mahasiswa', '2424028 diperbarui.', '2026-09-09 03:03:37'),
(421, 4, 1, 'Mahasiswa', '2424033 diperbarui.', '2026-09-09 03:03:48'),
(422, 4, 1, 'Mahasiswa', '2424039 diperbarui.', '2026-09-09 03:04:03'),
(423, 4, 1, 'Presensi', 'Presensi Pertemuan 3 diperbarui.', '2026-09-09 03:04:15'),
(424, 4, 1, 'Mahasiswa', '2424043 diperbarui.', '2026-09-09 03:14:27'),
(425, 4, 1, 'Mahasiswa', '2424030 diperbarui.', '2026-09-09 03:14:59'),
(426, 4, 1, 'Mahasiswa', '2424048 diperbarui.', '2026-09-09 03:18:45'),
(427, 4, 1, 'Mahasiswa', '2424028 diperbarui.', '2026-09-09 03:19:15'),
(428, 4, 1, 'Mahasiswa', '2424034 diperbarui.', '2026-09-09 03:20:00'),
(429, 4, 1, 'Tugas', 'Komponen Tugas (1-3) diperbarui.', '2026-09-09 04:34:26'),
(430, 4, 1, 'Tugas', 'Nilai/status Tugas (1-3) diperbarui.', '2026-09-09 08:27:04'),
(431, 4, 1, 'Tugas', 'Nilai/status Tugas (1-3) diperbarui.', '2026-09-09 08:39:14'),
(432, 4, 1, 'Tugas', 'Nilai/status Tugas (1-3) diperbarui.', '2026-09-09 08:46:53'),
(433, 4, 1, 'Tugas', 'Nilai/status Tugas (1-3) diperbarui.', '2026-09-09 08:47:33'),
(434, 4, 1, 'Tugas', 'Nilai/status Tugas (1-3) diperbarui.', '2026-09-09 08:58:03'),
(435, 4, 1, 'Mahasiswa', '2424048 diperbarui.', '2026-09-09 09:00:48'),
(436, 4, 1, 'Tugas', 'Nilai/status Tugas (1-3) diperbarui.', '2026-09-09 09:02:34'),
(437, 4, 1, 'Tugas', 'Komponen Praktikum (1-3) diperbarui.', '2026-09-09 11:54:38'),
(438, 4, 1, 'Tugas', 'Nilai/status Praktikum (1-3) diperbarui.', '2026-09-09 12:00:51'),
(439, 4, 1, 'Tugas', 'Nilai/status Praktikum (1-3) diperbarui.', '2026-09-09 12:07:14'),
(440, 4, 1, 'Mahasiswa', '2424038 diperbarui.', '2026-09-09 12:07:44'),
(441, 4, 1, 'Tugas', 'Nilai/status Praktikum (1-3) diperbarui.', '2026-09-09 12:07:50'),
(442, 4, 1, 'Mahasiswa', '2424028 diperbarui.', '2026-09-09 12:08:54'),
(443, 4, 1, 'Tugas', 'Nilai/status Praktikum (1-3) diperbarui.', '2026-09-09 12:10:56'),
(444, 4, 1, 'Tugas', 'Nilai/status Praktikum (1-3) diperbarui.', '2026-09-09 12:10:57'),
(445, 3, 1, 'Tugas', 'Komponen Tugas 2 diperbarui.', '2026-09-10 02:31:57'),
(446, 3, 1, 'Mahasiswa', '2524194 diperbarui.', '2026-09-10 07:52:31'),
(447, 3, 1, 'Mahasiswa', '2524088 diperbarui.', '2026-09-10 07:53:44'),
(448, 3, 1, 'Mahasiswa', '2524186 diperbarui.', '2026-09-10 07:55:41'),
(449, 3, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-10 08:03:27'),
(450, 3, 1, 'Mahasiswa', '2524200 diperbarui.', '2026-09-10 08:24:31'),
(451, 3, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-10 08:25:24'),
(452, 3, 1, 'Tugas', 'Komponen Praktikum Mandiri (2) diperbarui.', '2026-09-10 08:47:18'),
(453, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-10 08:48:42'),
(454, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-10 08:50:32'),
(455, 3, 1, 'Tugas', 'Komponen Praktikum (1) diperbarui.', '2026-09-11 03:20:25'),
(456, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-11 03:40:34'),
(457, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-11 04:16:52'),
(458, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-11 04:32:04'),
(459, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-11 04:34:30'),
(460, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-11 11:19:21'),
(461, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-14 03:55:34'),
(462, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-14 04:03:15'),
(463, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-14 04:06:39'),
(464, 3, 1, 'Mahasiswa', '2524203 diperbarui.', '2026-09-14 04:09:22'),
(465, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-14 04:09:54'),
(466, 3, 1, 'Tugas', 'Nilai/status Praktikum Mandiri (2) diperbarui.', '2026-09-14 04:10:10'),
(467, 3, 1, 'Tugas', 'Nilai/status Praktikum (1) diperbarui.', '2026-09-14 04:10:36'),
(468, 3, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 3.', '2026-09-14 04:11:13'),
(469, 7, 1, 'Presensi', 'Presensi Pertemuan 3 diperbarui.', '2026-09-15 00:54:42'),
(470, 7, 1, 'Mahasiswa', '2924003 diperbarui.', '2026-09-15 01:09:26'),
(471, 7, 1, 'Tugas', 'Komponen Praktikum Mandiri 3 diperbarui.', '2026-09-15 01:10:05'),
(472, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-15 01:10:24'),
(473, 7, 1, 'Mahasiswa', '2924036 diperbarui.', '2026-09-15 01:13:23'),
(474, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-15 01:14:48'),
(475, 7, 1, 'Mahasiswa', '2924027 diperbarui.', '2026-09-15 03:13:41'),
(476, 7, 1, 'Mahasiswa', '2924030 diperbarui.', '2026-09-15 03:16:50'),
(477, 7, 1, 'Mahasiswa', '2924018 diperbarui.', '2026-09-15 03:17:13'),
(478, 7, 1, 'Mahasiswa', '2924025 diperbarui.', '2026-09-15 03:17:44'),
(479, 7, 1, 'Mahasiswa', '2924021 diperbarui.', '2026-09-15 03:18:08'),
(480, 7, 1, 'Mahasiswa', '2924026 diperbarui.', '2026-09-15 03:18:36'),
(481, 7, 1, 'Mahasiswa', '2924031 diperbarui.', '2026-09-15 03:18:59'),
(482, 7, 1, 'Mahasiswa', '2924013 diperbarui.', '2026-09-15 03:19:24'),
(483, 7, 1, 'Mahasiswa', '2924024 diperbarui.', '2026-09-15 03:20:47'),
(484, 7, 1, 'Mahasiswa', '2924018 diperbarui.', '2026-09-15 04:12:22'),
(485, 7, 1, 'Mahasiswa', '2924018 diperbarui.', '2026-09-15 04:12:25'),
(486, 7, 1, 'Mahasiswa', '2924003 diperbarui.', '2026-09-15 04:17:31'),
(487, 7, 1, 'Presensi', 'Presensi Pertemuan 3 diperbarui.', '2026-09-15 04:18:56'),
(488, 7, 1, 'Mahasiswa', '2924029 diperbarui.', '2026-09-15 13:54:30'),
(489, 7, 1, 'Mahasiswa', '2924006 diperbarui.', '2026-09-15 13:55:32'),
(490, 7, 1, 'Mahasiswa', '2924009 diperbarui.', '2026-09-15 13:56:18'),
(491, 7, 1, 'Mahasiswa', '2924034 diperbarui.', '2026-09-15 14:01:29'),
(492, 7, 1, 'Mahasiswa', '2924008 diperbarui.', '2026-09-15 14:03:23'),
(493, 7, 1, 'Mahasiswa', '2924010 diperbarui.', '2026-09-15 14:07:25'),
(494, 7, 1, 'Mahasiswa', '2924023 diperbarui.', '2026-09-15 14:07:44'),
(495, 7, 1, 'Mahasiswa', '2924001 diperbarui.', '2026-09-15 14:08:16'),
(496, 7, 1, 'Mahasiswa', '2924038 diperbarui.', '2026-09-15 14:08:51'),
(497, 7, 1, 'Mahasiswa', '2924015 diperbarui.', '2026-09-15 14:09:10'),
(498, 7, 1, 'Mahasiswa', '2924032 diperbarui.', '2026-09-15 14:09:59'),
(499, 7, 1, 'Mahasiswa', '2924035 diperbarui.', '2026-09-15 14:10:45'),
(500, 7, 1, 'Mahasiswa', '2924011 diperbarui.', '2026-09-15 14:12:04'),
(501, 7, 1, 'Mahasiswa', '2924019 diperbarui.', '2026-09-15 14:12:30'),
(502, 7, 1, 'Mahasiswa', '2924033 diperbarui.', '2026-09-15 14:14:40'),
(503, 7, 1, 'Mahasiswa', '2924039 diperbarui.', '2026-09-15 14:15:00'),
(504, 7, 1, 'Mahasiswa', '2924017 diperbarui.', '2026-09-15 14:16:19'),
(505, 7, 1, 'Mahasiswa', '2924022 diperbarui.', '2026-09-15 14:16:54'),
(506, 7, 1, 'Mahasiswa', '2924037 diperbarui.', '2026-09-15 14:17:42'),
(507, 7, 1, 'Mahasiswa', '2924020 diperbarui.', '2026-09-15 14:18:23'),
(508, 7, 1, 'Mahasiswa', '2924002 diperbarui.', '2026-09-15 14:21:03'),
(509, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-15 14:21:45');
INSERT INTO `activity_logs` (`id`, `class_id`, `user_id`, `type`, `text`, `created_at`) VALUES
(510, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-15 14:23:50'),
(511, 7, 1, 'Mahasiswa', '2924016 diperbarui.', '2026-09-15 14:24:34'),
(512, 7, 1, 'Mahasiswa', '2924005 diperbarui.', '2026-09-15 14:25:01'),
(513, 7, 1, 'Mahasiswa', '2924008 diperbarui.', '2026-09-15 14:25:28'),
(514, 7, 1, 'Mahasiswa', '2924028 diperbarui.', '2026-09-15 14:25:48'),
(515, 7, 1, 'Mahasiswa', '2924036 diperbarui.', '2026-09-15 14:40:26'),
(516, 7, 1, 'Mahasiswa', '2924004 diperbarui.', '2026-09-15 14:41:49'),
(517, 8, 1, 'Mahasiswa', 'Import CSV: 0 ditambahkan, 39 diperbarui.', '2026-09-15 14:42:51'),
(518, 2, 1, 'Tugas', 'Komponen Tugas Praktikum Mandiri diperbarui.', '2026-09-16 04:33:31'),
(519, 2, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-16 04:42:24'),
(520, 9, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 3.', '2026-09-16 04:56:35'),
(521, 9, 1, 'Presensi', 'Presensi Pertemuan 3 diperbarui.', '2026-09-16 04:56:37'),
(522, 8, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 3.', '2026-09-16 04:57:45'),
(523, 8, 1, 'Presensi', 'Presensi Pertemuan 3 diperbarui.', '2026-09-16 04:58:05'),
(524, 9, 1, 'Presensi', 'Presensi Pertemuan 3 diperbarui.', '2026-09-16 04:58:32'),
(525, 2, 1, 'Presensi', 'Presensi Pertemuan 2 diperbarui.', '2026-09-16 05:08:46'),
(526, 2, 1, 'Mahasiswa', '2524237 diperbarui.', '2026-09-17 05:31:09'),
(527, 2, 1, 'Tugas', 'Nilai/status Tugas Praktikum Mandiri diperbarui.', '2026-09-17 05:32:08'),
(528, 3, 1, 'Tugas', 'Komponen Tugas Praktikum Mandiri 3 (ONLINE) diperbarui.', '2026-09-21 08:56:14'),
(529, 2, 1, 'Tugas', 'Nilai/status Tugas Praktikum Mandiri diperbarui.', '2026-09-21 08:58:05'),
(530, 7, 1, 'Tugas', 'Komponen Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:19:16'),
(531, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:19:30'),
(532, 7, 1, 'Tugas', 'Komponen Praktikum (1-2) diperbarui.', '2026-09-22 02:39:37'),
(533, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 02:42:46'),
(534, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:43:17'),
(535, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:44:27'),
(536, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 02:45:17'),
(537, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 02:46:08'),
(538, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:46:19'),
(539, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 02:49:26'),
(540, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:49:43'),
(541, 7, 1, 'Mahasiswa', '2924034 diperbarui.', '2026-09-22 02:49:50'),
(542, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 02:51:06'),
(543, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:51:15'),
(544, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:52:01'),
(545, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 02:52:24'),
(546, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 02:53:34'),
(547, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 02:53:46'),
(548, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 03:09:32'),
(549, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 04:11:16'),
(550, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 04:11:33'),
(551, 7, 1, 'Tugas', 'Nilai/status Praktikum Mandiri 3 diperbarui.', '2026-09-22 04:16:24'),
(552, 7, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-22 04:16:39'),
(553, 7, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 4.', '2026-09-22 06:51:52'),
(554, 7, 1, 'Presensi', 'Presensi Pertemuan 4 diperbarui.', '2026-09-22 06:51:58'),
(555, 8, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 4.', '2026-09-22 06:52:08'),
(556, 8, 1, 'Presensi', 'Presensi Pertemuan 4 diperbarui.', '2026-09-22 06:52:53'),
(557, 4, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 4.', '2026-09-22 09:31:04'),
(558, 4, 1, 'Presensi', 'Presensi Pertemuan 4 diperbarui.', '2026-09-22 09:31:07'),
(559, 3, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 4.', '2026-09-22 09:32:41'),
(560, 3, 1, 'Presensi', 'Presensi Pertemuan 4 diperbarui.', '2026-09-22 09:32:43'),
(561, 2, 1, 'Mahasiswa', '2524226 ditambahkan.', '2026-09-22 09:40:03'),
(562, 2, 1, 'Mahasiswa', '2524242 ditambahkan.', '2026-09-22 09:40:23'),
(563, 2, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-22 09:40:44'),
(564, 2, 1, 'Presensi', 'Presensi Pertemuan 2 diperbarui.', '2026-09-22 09:41:09'),
(565, 2, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 3.', '2026-09-22 09:42:09'),
(566, 2, 1, 'Presensi', 'Presensi Pertemuan 3 diperbarui.', '2026-09-22 09:42:12'),
(567, 2, 1, 'Presensi', 'Semua mahasiswa ditandai Hadir pada Pertemuan 4.', '2026-09-22 09:42:29'),
(568, 2, 1, 'Presensi', 'Presensi Pertemuan 4 diperbarui.', '2026-09-22 09:42:31'),
(569, 2, 1, 'Mahasiswa', '2524218 diperbarui.', '2026-09-22 13:54:00'),
(570, 2, 1, 'Mahasiswa', '2524240 diperbarui.', '2026-09-22 13:55:13'),
(571, 2, 1, 'Mahasiswa', '2524220 diperbarui.', '2026-09-22 13:56:55'),
(572, 4, 1, 'Tugas', 'Komponen Tugas Mandiri Online diperbarui.', '2026-09-22 15:29:17'),
(573, 4, 1, 'Tugas', 'Nilai/status Tugas Mandiri Online diperbarui.', '2026-09-22 16:01:49'),
(574, 2, 1, 'Mahasiswa', '2524223 diperbarui.', '2026-09-23 01:54:29'),
(575, 2, 1, 'Mahasiswa', '2524239 diperbarui.', '2026-09-23 01:55:15'),
(576, 2, 1, 'Mahasiswa', '2524242 diperbarui.', '2026-09-23 01:55:43'),
(577, 2, 1, 'Mahasiswa', '2524226 diperbarui.', '2026-09-23 01:56:00'),
(578, 2, 1, 'Mahasiswa', '2524221 diperbarui.', '2026-09-23 01:56:54'),
(579, 2, 1, 'Mahasiswa', '2523248 diperbarui.', '2026-09-23 01:59:59'),
(580, 2, 1, 'Mahasiswa', '2524001 dihapus dari kelas.', '2026-09-23 02:03:04'),
(581, 2, 1, 'Mahasiswa', '2524219 diperbarui.', '2026-09-23 02:06:32'),
(582, 2, 1, 'Mahasiswa', '2524214 ditambahkan.', '2026-09-23 02:06:44'),
(583, 2, 1, 'Tugas', 'Nilai/status Praktikum (1-2) diperbarui.', '2026-09-23 02:08:28'),
(584, 3, 1, 'Tugas', 'Komponen Praktikum Mandiri (2) diperbarui.', '2026-09-23 02:09:43'),
(585, 3, 1, 'Tugas', 'Komponen Tugas Praktikum Mandiri 3 (ONLINE) diperbarui.', '2026-09-23 02:10:00'),
(586, 3, 1, 'Tugas', 'Komponen Praktikum Mandiri (2) diperbarui.', '2026-09-23 02:13:20'),
(587, 3, 1, 'Tugas', 'Komponen Praktikum Mandiri (2) diperbarui.', '2026-09-23 02:13:36'),
(588, 3, 1, 'Tugas', 'Komponen Praktikum 2 diperbarui.', '2026-09-23 02:14:42'),
(589, 3, 1, 'Tugas', 'Komponen Tugas (3) diperbarui.', '2026-09-23 02:15:14'),
(590, 3, 1, 'Tugas', 'Komponen Tugas 2 diperbarui.', '2026-09-23 02:15:24'),
(591, 3, 1, 'Tugas', 'Komponen Tugas 3 diperbarui.', '2026-09-23 02:15:34'),
(592, 3, 1, 'Tugas', 'Komponen Tugas Mandiri (ONLINE) diperbarui.', '2026-09-23 02:16:07'),
(593, 2, 1, 'Tugas', 'Komponen Tugas (1-2) diperbarui.', '2026-09-23 02:17:07'),
(594, 2, 1, 'Tugas', 'Komponen Tugas Mandiri (3-4) diperbarui.', '2026-09-23 02:17:26'),
(595, 2, 1, 'Tugas', 'Komponen Tugas Mandiri (3-4) diperbarui.', '2026-09-23 02:19:03'),
(596, 3, 1, 'Tugas', 'Komponen Tugas 4 (ONLINE) diperbarui.', '2026-09-23 02:19:49'),
(597, 3, 1, 'Tugas', 'Komponen Tugas 2 diperbarui.', '2026-09-23 02:20:41'),
(598, 3, 1, 'Tugas', 'Komponen Tugas 3 diperbarui.', '2026-09-23 02:20:49'),
(599, 3, 1, 'Tugas', 'Komponen Tugas 5 diperbarui.', '2026-09-23 02:21:59'),
(600, 3, 1, 'Tugas', 'Komponen Tugas 6 diperbarui.', '2026-09-23 02:22:14'),
(601, 3, 1, 'Tugas', 'Komponen Tugas 5 diperbarui.', '2026-09-23 02:22:23'),
(602, 3, 1, 'Tugas', 'Komponen Tugas 7 ditambahkan.', '2026-09-23 02:22:52'),
(603, 3, 1, 'Tugas', 'Komponen Tugas 6 diperbarui.', '2026-09-23 02:23:06'),
(604, 3, 1, 'Tugas', 'Komponen Tugas 7 diperbarui.', '2026-09-23 02:23:20'),
(605, 3, 1, 'Tugas', 'Komponen UTS diperbarui.', '2026-09-23 02:23:57'),
(606, 3, 1, 'Tugas', 'Komponen UAS diperbarui.', '2026-09-23 02:24:06'),
(607, 4, 1, 'Presensi', 'Presensi Pertemuan 5 diperbarui.', '2026-09-23 03:08:22'),
(608, 4, 1, 'Tugas', 'Komponen Tugas 5 diperbarui.', '2026-09-23 05:11:23'),
(609, 4, 1, 'Tugas', 'Komponen Tugas 4 (Online) diperbarui.', '2026-09-23 05:15:04'),
(610, 4, 1, 'Tugas', 'Komponen Tugas 5 diperbarui.', '2026-09-23 05:15:13'),
(611, 2, 1, 'Tugas', 'Komponen Tugas 5 diperbarui.', '2026-09-23 06:10:18'),
(612, 2, 1, 'Mahasiswa', '2524232 diperbarui.', '2026-09-23 06:10:56'),
(613, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 06:11:42'),
(614, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 06:17:57'),
(615, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 06:18:34'),
(616, 4, 2, 'Tugas', 'Nilai/status Praktikum (1-3) diperbarui.', '2026-09-23 06:27:16'),
(617, 4, 2, 'Tugas', 'Nilai/status Praktikum (1-3) diperbarui.', '2026-09-23 06:27:48'),
(618, 2, 1, 'Tugas', 'Nilai/status Tugas (1-2) diperbarui.', '2026-09-23 06:48:20'),
(619, 2, 1, 'Tugas', 'Nilai/status Tugas (1-2) diperbarui.', '2026-09-23 06:48:35'),
(620, 2, 1, 'Tugas', 'Nilai/status Tugas (1-2) diperbarui.', '2026-09-23 06:48:39'),
(621, 2, 1, 'Presensi', 'Presensi Pertemuan 5 diperbarui.', '2026-09-23 07:07:09'),
(622, 2, 1, 'Presensi', 'Presensi Pertemuan 5 diperbarui.', '2026-09-23 07:08:48'),
(623, 2, 1, 'Tugas', 'Nilai/status Tugas (1-2) diperbarui.', '2026-09-23 07:30:54'),
(624, 2, 1, 'Mahasiswa', '2524227 diperbarui.', '2026-09-23 07:36:02'),
(625, 2, 1, 'Tugas', 'Nilai/status Tugas (1-2) diperbarui.', '2026-09-23 07:39:19'),
(626, 2, 1, 'Tugas', 'Nilai/status Tugas (1-2) diperbarui.', '2026-09-23 07:44:00'),
(627, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:12:09'),
(628, 2, 1, 'Tugas', 'Nilai/status Tugas (1-2) diperbarui.', '2026-09-23 08:13:34'),
(629, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:14:53'),
(630, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:25:51'),
(631, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:37:28'),
(632, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:41:00'),
(633, 2, 1, 'Tugas', 'Komponen Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:42:36'),
(634, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:52:57'),
(635, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:58:01'),
(636, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 08:58:43'),
(637, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 09:02:27'),
(638, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 09:14:19'),
(639, 2, 1, 'Tugas', 'Nilai/status Tugas Mandiri (3-4) diperbarui.', '2026-09-23 09:17:01'),
(640, 2, 1, 'Presensi', 'Presensi Pertemuan 1 diperbarui.', '2026-09-23 09:17:29'),
(641, 2, 1, 'Presensi', 'Presensi Pertemuan 2 diperbarui.', '2026-09-23 09:18:11'),
(642, 2, 1, 'Tugas', 'Komponen Tugas 6 diperbarui.', '2026-09-24 02:12:06'),
(643, 2, 1, 'Tugas', 'Komponen Tugas 7 diperbarui.', '2026-09-24 02:12:14'),
(644, 3, 1, 'Tugas', 'Nilai/status Tugas 4 (ONLINE) diperbarui.', '2026-09-24 02:18:43'),
(645, 3, 1, 'Tugas', 'Nilai/status Tugas 4 (ONLINE) diperbarui.', '2026-09-24 02:19:50'),
(646, 3, 1, 'Tugas', 'Nilai/status Tugas 4 (ONLINE) diperbarui.', '2026-09-24 02:21:38'),
(647, 3, 1, 'Tugas', 'Nilai/status Tugas 4 (ONLINE) diperbarui.', '2026-09-24 02:22:16'),
(648, 3, 1, 'Tugas', 'Nilai/status Tugas 4 (ONLINE) diperbarui.', '2026-09-24 02:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `meeting` tinyint(3) UNSIGNED NOT NULL,
  `status` enum('H','I','S','A') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `enrollment_id`, `meeting`, `status`, `created_at`, `updated_at`) VALUES
(1, 83, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(2, 84, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(3, 85, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(4, 86, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(5, 87, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(6, 88, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(7, 89, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(8, 90, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(9, 91, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(10, 92, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(11, 93, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(12, 94, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(13, 95, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(14, 96, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(15, 97, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(16, 98, 1, 'A', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(17, 99, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(18, 100, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(19, 101, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(20, 102, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(21, 103, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(22, 104, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(23, 105, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(25, 107, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(26, 108, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(27, 109, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(28, 110, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(29, 111, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(30, 112, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(31, 113, 1, 'H', '2026-09-03 16:18:24', '2026-09-23 09:17:29'),
(32, 83, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(33, 84, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(34, 85, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(35, 86, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(36, 87, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(37, 88, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(38, 89, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(39, 90, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(40, 91, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(41, 92, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(42, 93, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(43, 94, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(44, 95, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(45, 96, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(46, 97, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(47, 98, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(48, 99, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(49, 100, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(50, 101, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(51, 102, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(52, 103, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(53, 104, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(54, 105, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(56, 107, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(57, 108, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(58, 109, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(59, 110, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(60, 111, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(61, 112, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(62, 113, 2, 'H', '2026-09-03 16:18:24', '2026-09-23 09:18:11'),
(63, 114, 1, 'H', '2026-09-03 16:18:25', '2026-09-04 15:45:45'),
(64, 114, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(65, 115, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(66, 116, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(67, 117, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(68, 118, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(69, 119, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(70, 120, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(71, 121, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(72, 122, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(73, 123, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(74, 124, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(75, 125, 2, 'I', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(76, 126, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(77, 127, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(78, 128, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(79, 129, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(80, 130, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(81, 131, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(82, 132, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(83, 133, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(84, 134, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(85, 135, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(86, 136, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(87, 137, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(88, 138, 2, 'S', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(89, 139, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(90, 140, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(91, 141, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(92, 142, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(93, 143, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(94, 144, 2, 'H', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(95, 115, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(96, 116, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(97, 117, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(98, 118, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(99, 119, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(100, 120, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(101, 121, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(102, 122, 1, 'A', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(103, 123, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(104, 124, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(105, 125, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(106, 126, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(107, 127, 1, 'A', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(108, 128, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(109, 129, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(110, 130, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(111, 131, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(112, 132, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(113, 133, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(114, 134, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(115, 135, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(116, 136, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(117, 137, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(118, 138, 1, 'A', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(119, 139, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(120, 140, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(121, 141, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(122, 142, 1, 'I', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(123, 143, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(124, 144, 1, 'H', '2026-09-03 16:19:51', '2026-09-04 15:45:45'),
(454, 225, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(455, 226, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(456, 227, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(457, 228, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(458, 229, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(459, 230, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(460, 231, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(461, 232, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(462, 233, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(463, 234, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(464, 235, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(465, 236, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(466, 237, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(467, 238, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(468, 239, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(469, 240, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(470, 241, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(471, 242, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(472, 243, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(473, 244, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(474, 245, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(475, 246, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(476, 247, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(477, 248, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(478, 249, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(479, 250, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(480, 251, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(481, 252, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(482, 253, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(483, 254, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(484, 255, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(485, 256, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(486, 257, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(487, 224, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(488, 258, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(489, 259, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(490, 260, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(491, 261, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(492, 262, 1, 'H', '2026-09-04 17:39:19', '2026-09-04 17:39:22'),
(556, 145, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(557, 320, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(558, 321, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(559, 322, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(560, 323, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(561, 324, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(562, 325, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(563, 326, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(564, 327, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(565, 328, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(566, 329, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(567, 330, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(568, 331, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(569, 332, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(570, 333, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(571, 334, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(572, 335, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(573, 336, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(574, 337, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(575, 338, 1, 'H', '2026-09-07 07:50:52', '2026-09-07 07:50:52'),
(587, 145, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(588, 320, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(589, 321, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(590, 322, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(591, 323, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(592, 324, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(593, 325, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(594, 326, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(595, 327, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(596, 328, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(597, 329, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(598, 330, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(599, 331, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(600, 332, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(601, 333, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(602, 334, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(603, 335, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(604, 336, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(605, 337, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(606, 338, 2, 'H', '2026-09-07 07:51:01', '2026-09-07 07:51:01'),
(607, 224, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(608, 244, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(609, 247, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(610, 232, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(611, 262, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(612, 229, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(613, 256, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(614, 227, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(615, 254, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(616, 235, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(617, 251, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(618, 253, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(619, 231, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(620, 234, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(621, 240, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(622, 230, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(623, 260, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(624, 243, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(625, 228, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(626, 257, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(627, 226, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(628, 245, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(629, 233, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(630, 236, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(631, 255, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(632, 259, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(633, 250, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(634, 248, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(635, 239, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(636, 225, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(637, 241, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(638, 258, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(639, 246, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(640, 249, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(641, 237, 2, 'I', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(642, 261, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(643, 242, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(644, 238, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(645, 252, 2, 'H', '2026-09-08 01:06:43', '2026-09-08 01:06:43'),
(646, 292, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(647, 283, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(648, 270, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(649, 281, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(650, 268, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(651, 278, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(652, 275, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(653, 266, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(654, 285, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(655, 276, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(656, 272, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(657, 286, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(658, 297, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(659, 300, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(660, 291, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(661, 277, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(662, 293, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(663, 299, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(664, 280, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(665, 264, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(666, 284, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(667, 295, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(668, 265, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(669, 290, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(670, 296, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(671, 289, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(672, 273, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(673, 301, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(674, 274, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(675, 271, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(676, 287, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(677, 269, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(678, 282, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(679, 263, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(680, 294, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(681, 288, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(682, 279, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(683, 298, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(684, 267, 1, 'H', '2026-09-08 03:35:04', '2026-09-08 03:35:20'),
(709, 292, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(710, 283, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(711, 270, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(712, 281, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(713, 268, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(714, 278, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(715, 275, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(716, 266, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(717, 285, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(718, 276, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(719, 272, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(720, 286, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(721, 297, 2, 'I', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(722, 300, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(723, 291, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(724, 277, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(725, 293, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(726, 299, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(727, 280, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(728, 264, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(729, 284, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(730, 295, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(731, 265, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(732, 290, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(733, 296, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(734, 289, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(735, 273, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(736, 301, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(737, 274, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(738, 271, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(739, 287, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(740, 269, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(741, 282, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(742, 263, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15');
INSERT INTO `attendance` (`id`, `enrollment_id`, `meeting`, `status`, `created_at`, `updated_at`) VALUES
(743, 294, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(744, 288, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(745, 279, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(746, 298, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(747, 267, 2, 'H', '2026-09-08 03:35:09', '2026-09-08 03:35:15'),
(850, 302, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(851, 304, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(852, 308, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(853, 310, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(854, 311, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(855, 315, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(856, 314, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(857, 319, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(858, 303, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(859, 305, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(860, 306, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(861, 307, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(862, 309, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(863, 312, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(864, 313, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(865, 316, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(866, 318, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(867, 317, 1, 'H', '2026-09-08 04:36:43', '2026-09-08 09:35:10'),
(881, 302, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(882, 304, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(883, 308, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(884, 310, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(885, 311, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(886, 315, 2, 'I', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(887, 314, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(888, 319, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(889, 303, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(890, 305, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(891, 306, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(892, 307, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(893, 309, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(894, 312, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(895, 313, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(896, 316, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(897, 318, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(898, 317, 2, 'H', '2026-09-08 04:36:47', '2026-09-08 09:34:59'),
(984, 326, 3, 'A', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(985, 331, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(986, 330, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(987, 323, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(988, 329, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(989, 332, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(990, 321, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(991, 334, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(992, 145, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(993, 337, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(994, 336, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(995, 325, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(996, 327, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(997, 338, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(998, 320, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(999, 328, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(1000, 335, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(1001, 333, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(1002, 324, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(1003, 322, 3, 'H', '2026-09-09 02:59:20', '2026-09-09 03:04:15'),
(1024, 114, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1025, 115, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1026, 116, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1027, 117, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1028, 118, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1029, 119, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1030, 120, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1031, 121, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1032, 122, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1033, 123, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1034, 124, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1035, 125, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1036, 126, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1037, 127, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1038, 128, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1039, 129, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1040, 130, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1041, 131, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1042, 132, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1043, 133, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1044, 134, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1045, 135, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1046, 136, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1047, 137, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1048, 138, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1049, 139, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1050, 140, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1051, 141, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1052, 142, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1053, 143, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1054, 144, 3, 'H', '2026-09-14 04:11:13', '2026-09-14 04:11:13'),
(1055, 224, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1056, 244, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1057, 247, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1058, 232, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1059, 262, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1060, 229, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1061, 256, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1062, 227, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1063, 254, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1064, 235, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1065, 251, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1066, 253, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1067, 231, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1068, 234, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1069, 240, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1070, 230, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1071, 260, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1072, 243, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1073, 228, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1074, 257, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1075, 226, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1076, 245, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1077, 233, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1078, 236, 3, 'S', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1079, 255, 3, 'S', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1080, 259, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1081, 250, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1082, 248, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1083, 239, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1084, 225, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1085, 241, 3, 'I', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1086, 258, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1087, 246, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1088, 249, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1089, 237, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1090, 261, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1091, 242, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1092, 238, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1093, 252, 3, 'H', '2026-09-15 00:54:42', '2026-09-15 04:18:56'),
(1133, 302, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1134, 304, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1135, 308, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1136, 310, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1137, 311, 3, 'I', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1138, 315, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1139, 314, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1140, 319, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1141, 303, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1142, 305, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1143, 306, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1144, 307, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1145, 309, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1146, 312, 3, 'S', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1147, 313, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1148, 316, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1149, 318, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1150, 317, 3, 'H', '2026-09-16 04:56:35', '2026-09-16 04:58:32'),
(1182, 292, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1183, 283, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1184, 270, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1185, 281, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1186, 268, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1187, 278, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1188, 275, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1189, 266, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1190, 285, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1191, 276, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1192, 272, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1193, 286, 3, 'S', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1194, 297, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1195, 300, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1196, 291, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1197, 277, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1198, 293, 3, 'I', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1199, 299, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1200, 280, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1201, 264, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1202, 284, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1203, 295, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1204, 265, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1205, 290, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1206, 296, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1207, 289, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1208, 273, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1209, 301, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1210, 274, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1211, 271, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1212, 287, 3, 'S', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1213, 269, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1214, 282, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1215, 263, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1216, 294, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1217, 288, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1218, 279, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1219, 298, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1220, 267, 3, 'H', '2026-09-16 04:57:45', '2026-09-16 04:58:05'),
(1333, 225, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1334, 226, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1335, 227, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1336, 228, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1337, 229, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1338, 230, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1339, 231, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1340, 232, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1341, 233, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1342, 234, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1343, 235, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1344, 236, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1345, 237, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1346, 238, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1347, 239, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1348, 240, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1349, 241, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1350, 242, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1351, 243, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1352, 244, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1353, 245, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1354, 246, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1355, 247, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1356, 248, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1357, 249, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1358, 250, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1359, 251, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1360, 252, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1361, 253, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1362, 254, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1363, 255, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1364, 256, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1365, 257, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1366, 224, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1367, 258, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1368, 259, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1369, 260, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1370, 261, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1371, 262, 4, 'H', '2026-09-22 06:51:52', '2026-09-22 06:51:58'),
(1435, 292, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1436, 283, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1437, 270, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1438, 281, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1439, 268, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1440, 278, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1441, 275, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1442, 266, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1443, 285, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1444, 276, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1445, 272, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1446, 286, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1447, 297, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1448, 300, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1449, 291, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1450, 277, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1451, 293, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1452, 299, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1453, 280, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1454, 264, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1455, 284, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1456, 295, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1457, 265, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1458, 290, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1459, 296, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1460, 289, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1461, 273, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1462, 301, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1463, 274, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1464, 271, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1465, 287, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1466, 269, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1467, 282, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1468, 263, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1469, 294, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1470, 288, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1471, 279, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1472, 298, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1473, 267, 4, 'H', '2026-09-22 06:52:08', '2026-09-22 06:52:53'),
(1537, 145, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1538, 320, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1539, 321, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1540, 322, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1541, 323, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1542, 324, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1543, 325, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1544, 326, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1545, 327, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1546, 328, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1547, 329, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1548, 330, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1549, 331, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1550, 332, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1551, 333, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1552, 334, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1553, 335, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1554, 336, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1555, 337, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1556, 338, 4, 'H', '2026-09-22 09:31:04', '2026-09-22 09:31:07'),
(1588, 114, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1589, 115, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1590, 116, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1591, 117, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1592, 118, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1593, 119, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1594, 120, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1595, 121, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1596, 122, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1597, 123, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1598, 124, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1599, 125, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1600, 126, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1601, 127, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1602, 128, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1603, 129, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1604, 130, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1605, 131, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1606, 132, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1607, 133, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43');
INSERT INTO `attendance` (`id`, `enrollment_id`, `meeting`, `status`, `created_at`, `updated_at`) VALUES
(1608, 134, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1609, 135, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1610, 136, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1611, 137, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1612, 138, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1613, 139, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1614, 140, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1615, 141, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1616, 142, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1617, 143, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1618, 144, 4, 'H', '2026-09-22 09:32:41', '2026-09-22 09:32:43'),
(1650, 339, 1, 'A', '2026-09-22 09:40:44', '2026-09-23 09:17:29'),
(1656, 340, 1, 'A', '2026-09-22 09:40:44', '2026-09-23 09:17:29'),
(1683, 339, 2, 'A', '2026-09-22 09:41:09', '2026-09-23 09:18:11'),
(1689, 340, 2, 'A', '2026-09-22 09:41:09', '2026-09-23 09:18:11'),
(1716, 83, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1717, 84, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1718, 85, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1719, 86, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1720, 87, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1721, 88, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1722, 89, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1723, 90, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1724, 91, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1725, 92, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1726, 93, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1727, 94, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1728, 95, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1729, 96, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1730, 97, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1731, 98, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1732, 99, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1733, 100, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1734, 101, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1735, 102, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1736, 103, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1737, 104, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1738, 105, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1740, 107, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1741, 108, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1742, 109, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1743, 110, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1744, 111, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1745, 112, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1746, 113, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1747, 339, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1748, 340, 3, 'H', '2026-09-22 09:42:09', '2026-09-22 09:42:12'),
(1812, 83, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1813, 84, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1814, 85, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1815, 86, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1816, 87, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1817, 88, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1818, 89, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1819, 90, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1820, 91, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1821, 92, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1822, 93, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1823, 94, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1824, 95, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1825, 96, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1826, 97, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1827, 98, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1828, 99, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1829, 100, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1830, 101, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1831, 102, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1832, 103, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1833, 104, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1834, 105, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1836, 107, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1837, 108, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1838, 109, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1839, 110, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1840, 111, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1841, 112, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1842, 113, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1843, 339, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1844, 340, 4, 'H', '2026-09-22 09:42:29', '2026-09-22 09:42:31'),
(1908, 326, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1909, 331, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1910, 330, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1911, 323, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1912, 329, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1913, 332, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1914, 321, 5, 'A', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1915, 334, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1916, 145, 5, 'I', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1917, 337, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1918, 336, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1919, 325, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1920, 327, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1921, 338, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1922, 320, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1923, 328, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1924, 335, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1925, 333, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1926, 324, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1927, 322, 5, 'H', '2026-09-23 03:08:22', '2026-09-23 03:08:22'),
(1928, 339, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1929, 96, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1930, 108, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1931, 95, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1932, 99, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1933, 103, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1934, 340, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1935, 100, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1936, 84, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1937, 92, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1938, 112, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1939, 98, 5, 'A', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1940, 111, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1941, 341, 5, 'A', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1942, 101, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1943, 91, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1944, 90, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1945, 89, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1946, 86, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1947, 104, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1948, 83, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1949, 107, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1950, 113, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1951, 102, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1952, 105, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1953, 93, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1954, 85, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1955, 87, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1956, 110, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1957, 109, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1958, 88, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1959, 97, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(1960, 94, 5, 'H', '2026-09-23 07:07:09', '2026-09-23 07:08:48'),
(2007, 341, 1, 'A', '2026-09-23 09:17:29', '2026-09-23 09:17:29'),
(2040, 341, 2, 'A', '2026-09-23 09:18:11', '2026-09-23 09:18:11');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `semester` varchar(30) NOT NULL DEFAULT '',
  `academic_year` varchar(30) NOT NULL DEFAULT '',
  `target` smallint(5) UNSIGNED NOT NULL DEFAULT 30,
  `meetings` tinyint(3) UNSIGNED NOT NULL DEFAULT 16,
  `lecturer` varchar(200) NOT NULL DEFAULT '',
  `pass_threshold` decimal(5,2) NOT NULL DEFAULT 60.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `program_id`, `course_id`, `name`, `semester`, `academic_year`, `target`, `meetings`, `lecturer`, `pass_threshold`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 'PTIK 5G', '5', '2026/2027', 31, 16, 'Dashboard monitoring dosen', '70.00', '2026-09-03 16:18:24', '2026-09-04 17:29:55'),
(3, 2, 2, 'PTIK 5F', '5', '2026/2027', 31, 16, 'Dashboard monitoring dosen', '70.00', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(4, 2, 3, 'PMTK 5B', '5', '2026/2027', 20, 16, 'Dashboard monitoring dosen', '70.00', '2026-09-03 16:18:24', '2026-09-03 16:53:08'),
(7, 5, 5, 'IF 5A', '5', '2026/2027', 39, 16, 'Dashboard monitoring dosen', '70.00', '2026-09-04 17:27:28', '2026-09-04 17:29:39'),
(8, 5, 6, 'IF 5A', '5', '2026/2027', 39, 16, 'Dashboard monitoring dosen', '70.00', '2026-09-04 17:29:30', '2026-09-04 17:29:30'),
(9, 5, 7, 'IF 5A', '5', '2026/2027', 18, 16, 'Dashboard monitoring dosen', '70.00', '2026-09-04 17:31:42', '2026-09-04 17:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `class_enrollments`
--

CREATE TABLE `class_enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `registration_status` enum('Aktif','Cuti','Nonaktif','Lulus') NOT NULL DEFAULT 'Aktif',
  `payment_status` enum('Lunas','Belum Lunas','Cicilan') NOT NULL DEFAULT 'Lunas',
  `gpa` decimal(3,2) DEFAULT NULL,
  `target_gpa` decimal(3,2) DEFAULT NULL,
  `pc` varchar(20) DEFAULT NULL,
  `github_url` varchar(500) DEFAULT NULL,
  `colab_url` varchar(500) DEFAULT NULL,
  `drive_url` varchar(500) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_enrollments`
--

INSERT INTO `class_enrollments` (`id`, `class_id`, `student_id`, `registration_status`, `payment_status`, `gpa`, `target_gpa`, `pc`, `github_url`, `colab_url`, `drive_url`, `note`, `created_at`, `updated_at`) VALUES
(83, 2, 1, 'Aktif', 'Lunas', NULL, NULL, 'PC01', 'https://github.com/alahanmati5-web/kursusku', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(84, 2, 2, 'Aktif', 'Lunas', NULL, NULL, 'PC02', 'https://github.com/gevimelitas-design/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(85, 2, 3, 'Aktif', 'Lunas', NULL, NULL, 'PC03', 'https://github.com/atinisa17-blip/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(86, 2, 4, 'Aktif', 'Lunas', NULL, NULL, 'PC04', 'https://github.com/mawarhutauruk74-dev/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(87, 2, 5, 'Aktif', 'Lunas', NULL, NULL, 'PC05', 'https://github.com/husnaraudhatul050-lab/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(88, 2, 6, 'Aktif', 'Lunas', NULL, NULL, 'PC06', 'https://github.com/sucisalzabilla78-wq/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-22 13:54:00'),
(89, 2, 7, 'Aktif', 'Lunas', NULL, NULL, 'PC07', 'https://github.com/mardatulrahmi/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(90, 2, 8, 'Aktif', 'Lunas', NULL, NULL, 'PC08', NULL, NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(91, 2, 9, 'Aktif', 'Lunas', NULL, NULL, 'PC15', 'https://github.com/mrasuliakbar24/kursusku', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(92, 2, 10, 'Aktif', 'Lunas', NULL, NULL, 'PC14', 'https://github.com/HABIBIMARAY/kursus-ku', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(93, 2, 11, 'Aktif', 'Lunas', NULL, NULL, 'PC13', 'https://github.com/randigusnawan9-crypto/Khursusku/tree/main', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(94, 2, 12, 'Aktif', 'Lunas', NULL, NULL, 'PC12', 'https://github.com/yuliazikra145/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(95, 2, 13, 'Aktif', 'Lunas', NULL, NULL, 'PC11', 'https://github.com/divarahmadani345/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(96, 2, 14, 'Aktif', 'Lunas', NULL, NULL, 'PC10', 'https://github.com/avilavidella2005-source/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(97, 2, 15, 'Aktif', 'Lunas', NULL, NULL, 'PC09', 'https://github.com/vanessatanjung7-cloud/kursusku-prototype', NULL, NULL, 'B', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(98, 2, 16, 'Aktif', 'Lunas', NULL, NULL, 'PC17', 'https://github.com/kukuhprasetya294-star/kursusku', NULL, NULL, 'B', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(99, 2, 17, 'Aktif', 'Lunas', NULL, NULL, 'PC18', 'https://github.com/dwifayraj-228/kursusku-prototype', NULL, NULL, 'B', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(100, 2, 18, 'Aktif', 'Lunas', NULL, NULL, 'PC19', 'https://github.com/n4yenayeee/kursusku-prototype/tree/main', NULL, NULL, 'B', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(101, 2, 19, 'Aktif', 'Lunas', NULL, NULL, 'PC20', 'https://github.com/iqbal-hsb/kursusku-prototype', NULL, NULL, 'B', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(102, 2, 20, 'Aktif', 'Lunas', NULL, NULL, 'PC21', 'https://github.com/putrinirwana300/kursusku-prototype', NULL, NULL, 'B', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(103, 2, 21, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/dynakhairulnysa-star/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-23 07:36:02'),
(104, 2, 22, 'Aktif', 'Lunas', NULL, NULL, 'PC31', 'https://github.com/mzaqi9865-source/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-23 01:54:29'),
(105, 2, 23, 'Aktif', 'Lunas', NULL, NULL, 'PC30', 'https://github.com/smild1358/kursusku-prototype', NULL, NULL, 'B', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(107, 2, 25, 'Aktif', 'Lunas', NULL, NULL, 'PC27', 'https://github.com/winatania56-prog/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-23 06:10:56'),
(108, 2, 26, 'Aktif', 'Lunas', NULL, NULL, 'PC26', 'https://github.com/deaalfita89-dotcom/kursusku-prototypee', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-23 01:55:15'),
(109, 2, 27, 'Aktif', 'Lunas', NULL, NULL, 'PC25', 'https://github.com/ririhartika26-cloud/kursusku-prototype-', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-23 01:56:54'),
(110, 2, 28, 'Aktif', 'Lunas', NULL, NULL, 'PC34', 'https://github.com/rendiramadhan417-oss/kursusku_prototype', NULL, NULL, 'B', '2026-09-03 16:18:24', '2026-09-22 13:56:55'),
(111, 2, 29, 'Aktif', 'Lunas', NULL, NULL, 'PC36', 'https://github.com/ulfadhil10/kursusku-prototype', NULL, NULL, 'A', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(112, 2, 30, 'Aktif', 'Lunas', NULL, NULL, 'PC38', 'https://github.com/imaasmara5-boop/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-22 13:55:13'),
(113, 2, 31, 'Aktif', 'Lunas', NULL, NULL, 'PC39', 'https://github.com/lia01hasibuan-prog/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-17 05:31:09'),
(114, 3, 33, 'Aktif', 'Lunas', NULL, '4.00', 'PC10', 'https://github.com/AirinEprilianti/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(115, 3, 35, 'Aktif', 'Lunas', NULL, '4.00', 'PC07', 'https://github.com/nurulauliaharahap/Kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(116, 3, 37, 'Aktif', 'Lunas', NULL, '4.00', 'PC05', 'https://github.com/salmaarsy/kursusku-prototype.git', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(117, 3, 38, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/azifarahma545-source/azifa-rahma', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(118, 3, 40, 'Aktif', 'Lunas', NULL, '4.00', 'PC30', 'https://github.com/Teja-dev-alt/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(119, 3, 42, 'Aktif', 'Lunas', NULL, '4.00', 'PC12', 'https://github.com/mannarambe-cloud/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(120, 3, 43, 'Aktif', 'Lunas', NULL, '4.00', 'PC29', 'https://github.com/GHANISENSEI1-GIF/KURSUSKU-PROTOTYPE', NULL, NULL, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(121, 3, 45, 'Aktif', 'Lunas', NULL, '4.00', 'PC15', 'https://github.com/suciaulia2115-alt/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(122, 3, 47, 'Aktif', 'Lunas', NULL, '4.00', 'PC34', 'https://github.com/rehanfadillah1203-cmd/Kursusin', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(123, 3, 49, 'Aktif', 'Lunas', NULL, '4.00', 'PC31', 'https://github.com/Taufik5712/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(124, 3, 51, 'Aktif', 'Lunas', NULL, '4.00', 'PC09', 'https://github.com/syukrinaanjaniasmi-droid/Kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(125, 3, 52, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/ridwansaint04-pixel/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-10 07:53:44'),
(126, 3, 54, 'Aktif', 'Lunas', NULL, '4.00', 'PC19', 'https://github.com/fahrurrozinst04-lgtm/kursusku-prototypee', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(127, 3, 55, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/fadillah234/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-10 07:52:31'),
(128, 3, 57, 'Aktif', 'Lunas', NULL, '4.00', 'PC38', 'https://github.com/kevinprayogaputra15/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(129, 3, 59, 'Aktif', 'Lunas', NULL, '4.00', 'PC39', 'https://github.com/luissiregar19-design/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(130, 3, 61, 'Aktif', 'Lunas', NULL, '4.00', 'PC18', 'https://github.com/aldinuari/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(131, 3, 62, 'Aktif', 'Lunas', NULL, '4.00', 'PC22', 'https://github.com/violanavisa/Kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(132, 3, 63, 'Aktif', 'Lunas', NULL, '4.00', 'HP', 'https://github.com/fanzamasters-dot/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(133, 3, 65, 'Aktif', 'Lunas', NULL, '4.00', 'PC36', 'https://github.com/aktoyosvian1234-source/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(134, 3, 67, 'Aktif', 'Lunas', NULL, '4.00', 'PC21', 'https://github.com/KhairotunNisa/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(135, 3, 68, 'Aktif', 'Lunas', NULL, '4.00', 'PC37', 'https://github.com/bilhikmahhaque1234-cmd/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(136, 3, 70, 'Aktif', 'Lunas', NULL, '4.00', 'PC11', 'https://github.com/EnglaTadisia/Kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(137, 3, 72, 'Aktif', 'Lunas', NULL, '4.00', 'PC04', 'https://github.com/junandahanif2406-sys/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(138, 3, 73, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/Fadel1607/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-10 08:24:31'),
(139, 3, 74, 'Aktif', 'Lunas', NULL, '4.00', 'PC35', 'https://github.com/SeinDevStudio/kursusku-prototype', NULL, NULL, 'A', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(140, 3, 76, 'Aktif', 'Lunas', NULL, '4.00', 'PC20', 'https://github.com/ritaelfia8-sudo/indahdwifebri.', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(141, 3, 77, 'Aktif', 'Lunas', NULL, '4.00', 'PC32', 'https://github.com/muhammadagungpranoto3-create/Kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(142, 3, 78, 'Aktif', 'Lunas', NULL, '4.00', 'PC16', 'https://github.com/vjuniafourtika-create/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-14 04:09:22'),
(143, 3, 80, 'Aktif', 'Lunas', NULL, '4.00', 'PC14', 'https://github.com/jinggapermatasari/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(144, 3, 82, 'Aktif', 'Lunas', NULL, '4.00', 'PC17', 'https://github.com/arifputraa05-web/kursusku-prototype', NULL, NULL, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(145, 4, 83, 'Aktif', 'Lunas', NULL, '4.00', 'PC01', NULL, NULL, 'https://drive.google.com/drive/folders/1PjfPkHIRx1ox94i-KdJcVe4e50ijMBf2?usp=drive_link', '', '2026-09-03 16:18:25', '2026-09-09 03:01:46'),
(224, 7, 117, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/abdulreyhan', NULL, 'https://drive.google.com/drive/folders/1PhKVX2GfZVX_s48wA7DbhEGC33UpSClO?usp=sharing', '', '2026-09-04 17:32:48', '2026-09-15 14:18:23'),
(225, 7, 84, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/robiputra184', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:12:04'),
(226, 7, 85, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/miftahljnh', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:07:44'),
(227, 7, 86, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/Elvi733', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 13:55:32'),
(228, 7, 87, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/ishak123-crypto/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 03:20:47'),
(229, 7, 88, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/CaesarRaja?tab=repositories', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-22 02:49:50'),
(230, 7, 89, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/zzaky06', NULL, 'https://drive.google.com/drive/folders/1Sz7ap3QqajfcRqjZ9xY3TTO4wSmmM5Qi?usp=sharing', '', '2026-09-04 17:34:34', '2026-09-15 04:17:31'),
(231, 7, 90, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/indahsafitri24?tab=repositories', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:41:49'),
(232, 7, 91, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/AnnisaMiftahulJannah', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:08:16'),
(233, 7, 92, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/muhammadilhmm039-cmd/sirkusus-dekstop', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 03:19:24'),
(234, 7, 93, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/joycesetrya-cpu/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 03:18:36'),
(235, 7, 94, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/fujisakiyahn-commits/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 03:17:44'),
(236, 7, 95, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-04 17:34:34'),
(237, 7, 96, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/sitihardiyanti030320-blip', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:10:45'),
(238, 7, 97, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/wiraafriyanip/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 03:13:41'),
(239, 7, 98, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/zryn-reg', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 13:54:30'),
(240, 7, 99, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/lastrialyanti2020-create', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:25:48'),
(241, 7, 100, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-04 17:34:34'),
(242, 7, 101, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/wahyuannisa', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:21:03'),
(243, 7, 102, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/bouncygaming15', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:16:19'),
(244, 7, 103, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/alfarabi456', NULL, 'https://drive.google.com/drive/folders/1gk-538AcacAn5XAtubxnHMt9PpbUizLj?usp=drive_link', '', '2026-09-04 17:34:34', '2026-09-15 14:08:51'),
(245, 7, 104, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/ammarhasibuan/sikursus-dekstop', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 03:16:50'),
(246, 7, 105, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/santriwani2609-create', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:03:23'),
(247, 7, 106, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/AlfinArdiansyahh', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:09:10'),
(248, 7, 107, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/marzgiverny15', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:24:34'),
(249, 7, 108, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/saskiakhoirunnisa030-cell', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:07:25'),
(250, 7, 109, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/rahmatikayuandra?tab=repositories', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:40:26'),
(251, 7, 110, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/rywanaru', NULL, 'https://drive.google.com/drive/folders/1PrOX-OzrUl1LaO5qXH8QBIDcq5SYsu0k?usp=drive_link', '', '2026-09-04 17:34:34', '2026-09-15 14:25:01'),
(252, 7, 111, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/ZUL368', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:15:00'),
(253, 7, 112, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/IlziHacker/Sikursus-Dekstop', NULL, 'https://drive.google.com/drive/folders/1qaPfnfjbwgywJYUN9O99LRAoyuzmjuge?usp=drive_link', '', '2026-09-04 17:34:34', '2026-09-15 03:18:59'),
(254, 7, 113, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/IF-FADHIL-IS', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:12:30'),
(255, 7, 114, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-04 17:34:34'),
(256, 7, 115, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/CintaOlaHernanda/sirkusus-desktop', NULL, 'https://drive.google.com/drive/folders/11jMnTxn0c-XSE3pxniRUCcxCTlp112_G?usp=drive_link', '', '2026-09-04 17:34:34', '2026-09-15 03:17:13'),
(257, 7, 116, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/alzikra-debug', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:17:42'),
(258, 7, 118, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/salsabillasinaga', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:09:59'),
(259, 7, 119, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/patimapulungan18-oss', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 13:56:18'),
(260, 7, 120, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/ramadhan-gelo', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:14:40'),
(261, 7, 121, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/vhirgie2005-ops', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 14:16:54'),
(262, 7, 122, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/awa-291/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:34:34', '2026-09-15 03:18:08'),
(263, 8, 117, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/abdulreyhan', NULL, 'https://drive.google.com/drive/folders/1PhKVX2GfZVX_s48wA7DbhEGC33UpSClO?usp=sharing', '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(264, 8, 103, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/alfarabi456', NULL, 'https://drive.google.com/drive/folders/1gk-538AcacAn5XAtubxnHMt9PpbUizLj?usp=drive_link', '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(265, 8, 106, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/AlfinArdiansyahh', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(266, 8, 91, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/AnnisaMiftahulJannah', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(267, 8, 122, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/awa-291/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(268, 8, 88, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/CaesarRaja', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(269, 8, 115, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/CintaOlaHernanda/sirkusus-desktop', NULL, 'https://drive.google.com/drive/folders/11jMnTxn0c-XSE3pxniRUCcxCTlp112_G?usp=drive_link', '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(270, 8, 86, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/Elvi733', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(271, 8, 113, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/IF-FADHIL-IS', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(272, 8, 94, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/fujisakiyahn-commits/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(273, 8, 110, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/rywanaru', NULL, 'https://drive.google.com/drive/folders/1PrOX-OzrUl1LaO5qXH8QBIDcq5SYsu0k?usp=drive_link', '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(274, 8, 112, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/IlziHacker/Sikursus-Dekstop', NULL, 'https://drive.google.com/drive/folders/1qaPfnfjbwgywJYUN9O99LRAoyuzmjuge?usp=drive_link', '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(275, 8, 90, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/indahsafitri24?tab=repositories', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(276, 8, 93, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/joycesetrya-cpu/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(277, 8, 99, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/lastrialyanti2020-create', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51');
INSERT INTO `class_enrollments` (`id`, `class_id`, `student_id`, `registration_status`, `payment_status`, `gpa`, `target_gpa`, `pc`, `github_url`, `colab_url`, `drive_url`, `note`, `created_at`, `updated_at`) VALUES
(278, 8, 89, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/zzaky06', NULL, 'https://drive.google.com/drive/folders/1Sz7ap3QqajfcRqjZ9xY3TTO4wSmmM5Qi?usp=sharing', '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(279, 8, 120, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/ramadhan-gelo', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(280, 8, 102, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/bouncygaming15', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(281, 8, 87, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/ishak123-crypto/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(282, 8, 116, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/alzikra-debug', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(283, 8, 85, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/miftahljnh', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(284, 8, 104, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/ammarhasibuan/sikursus-dekstop', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(285, 8, 92, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/muhammadilhmm039-cmd/sirkusus-dekstop', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(286, 8, 95, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-04 17:41:04'),
(287, 8, 114, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-04 17:41:04'),
(288, 8, 119, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/patimapulungan18-oss', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(289, 8, 109, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/rahmatikayuandra?tab=repositories', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(290, 8, 107, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/marzgiverny15', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(291, 8, 98, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/zryn-reg', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(292, 8, 84, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/robiputra184', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(293, 8, 100, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-04 17:41:04'),
(294, 8, 118, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/salsabillasinaga', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(295, 8, 105, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/santriwani2609-create', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(296, 8, 108, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/saskiakhoirunnisa030-cell', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(297, 8, 96, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/sitihardiyanti030320-blip', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(298, 8, 121, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/vhirgie2005-ops', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(299, 8, 101, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/wahyuannisa', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(300, 8, 97, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/wiraafriyanip/sikursus-desktop', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(301, 8, 111, 'Aktif', 'Lunas', NULL, '4.00', NULL, 'https://github.com/ZUL368', NULL, NULL, '', '2026-09-04 17:41:04', '2026-09-15 14:42:51'),
(302, 9, 84, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(303, 9, 101, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(304, 9, 87, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(305, 9, 103, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(306, 9, 106, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(307, 9, 107, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(308, 9, 90, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(309, 9, 111, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(310, 9, 92, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(311, 9, 95, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(312, 9, 114, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(313, 9, 116, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(314, 9, 97, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(315, 9, 96, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(316, 9, 118, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(317, 9, 121, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(318, 9, 120, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(319, 9, 99, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, NULL, '', '2026-09-07 06:20:43', '2026-09-07 06:20:43'),
(320, 4, 123, 'Aktif', 'Lunas', NULL, '4.00', 'PC03', NULL, NULL, 'https://drive.google.com/drive/folders/1L5I5NxOiJsRUWl8ejJA7c8SZHCVZF3f-?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:03:01'),
(321, 4, 124, 'Aktif', 'Lunas', NULL, '4.00', 'PC26', NULL, NULL, 'https://drive.google.com/drive/folders/1iqsGDDVeUt6JdhTO0r1zR6tTSloo7cHJ?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:01:29'),
(322, 4, 125, 'Aktif', 'Lunas', NULL, '4.00', 'PC33', NULL, NULL, 'https://drive.google.com/drive/folders/1mTRARTNTreTQDyX_2DwxAizGO-XwhFjC?usp=sharing', '', '2026-09-07 06:46:31', '2026-09-09 03:04:03'),
(323, 4, 126, 'Aktif', 'Lunas', NULL, '4.00', 'PC08', NULL, NULL, 'https://drive.google.com/drive/folders/1r8_VAE-wg_GFUY4U0MBVHioXSeqr_6jT?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:14:27'),
(324, 4, 127, 'Aktif', 'Lunas', NULL, '4.00', 'PC04', NULL, NULL, 'https://drive.google.com/drive/folders/1cpGnBpfpRcvm3uxGE9Ujp0qagg7D3m8C?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:03:48'),
(325, 4, 128, 'Aktif', 'Lunas', NULL, '4.00', 'PC19', NULL, NULL, 'https://drive.google.com/drive/folders/1CUxmfX11lcY9Ha_WXB82iyfzkoad-GHv?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:20:00'),
(326, 4, 129, 'Aktif', 'Lunas', NULL, '4.00', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/10-JmgJkHOtos4S2QKUY_Zmv_HA7dWEjT?usp=sharing', '', '2026-09-07 06:46:31', '2026-09-07 06:51:31'),
(327, 4, 130, 'Aktif', 'Lunas', NULL, '4.00', 'PC09', NULL, NULL, 'https://drive.google.com/drive/folders/1BDA19eZrHkRSpNbZ3SYYqPTUxwp6JQEP?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:14:59'),
(328, 4, 131, 'Aktif', 'Lunas', NULL, '4.00', 'PC24', NULL, NULL, 'https://drive.google.com/drive/folders/1hKpJPAjC1rJdDELx6sjoJ32IfprGH6ta?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:03:21'),
(329, 4, 132, 'Aktif', 'Lunas', NULL, '4.00', 'PC13', NULL, NULL, 'https://drive.google.com/drive/folders/1DXCefe-19qecJeS8Ynpwys5ZCXa1qM_t?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:00:53'),
(330, 4, 133, 'Aktif', 'Lunas', NULL, '4.00', 'PC05', NULL, NULL, 'https://drive.google.com/drive/folders/15FE7m4CI-Gkf3KIycdVh692lzrld6lRW?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:00:32'),
(331, 4, 134, 'Aktif', 'Lunas', NULL, '4.00', 'PC21', NULL, NULL, 'https://drive.google.com/drive/folders/1A5a9qokJm9l_7EguEEXyQGqchOi9IeEC?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:00:14'),
(332, 4, 135, 'Aktif', 'Lunas', NULL, '4.00', 'PC06', NULL, NULL, 'https://drive.google.com/drive/folders/1xeFySTOXtoQn6xoMoewbhoiOPbuYQJ5A?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:01:15'),
(333, 4, 136, 'Aktif', 'Lunas', NULL, '4.00', 'PC15', NULL, NULL, 'https://drive.google.com/drive/folders/1Nn0fK0ldC08M9UJSrMmb4B5UOkNzBOmj?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 12:08:54'),
(334, 4, 137, 'Aktif', 'Lunas', NULL, '4.00', 'PC02', NULL, NULL, 'https://drive.google.com/drive/folders/1q2SojPSUtVZtC49hNbeI4_tg2E0yPtyA?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:01:38'),
(335, 4, 138, 'Aktif', 'Lunas', NULL, '4.00', 'PC16', NULL, NULL, 'https://drive.google.com/drive/folders/1rAoLv50vwDGSWxF0HRCViu2BesKDwYMZ?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 12:07:44'),
(336, 4, 139, 'Aktif', 'Lunas', NULL, '4.00', 'PC07', NULL, NULL, 'https://drive.google.com/drive/folders/1YQV6RX4SjOnA-L95GIdb9zts84IZqbkG?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:02:24'),
(337, 4, 140, 'Aktif', 'Lunas', NULL, '4.00', 'PC12', NULL, NULL, 'https://drive.google.com/drive/folders/1ROEaXDmuoXQr1trOEuMFO4sRNRZdOeqU?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 03:02:14'),
(338, 4, 141, 'Aktif', 'Lunas', NULL, '4.00', 'PC14', NULL, NULL, 'https://drive.google.com/drive/folders/1jAjQg1jJU5_NmDlStmJfrqsbb0H0SoMa?usp=drive_link', '', '2026-09-07 06:46:31', '2026-09-09 09:00:48'),
(339, 2, 142, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/abdul-rasyid2524226/kursusku-prototype', NULL, NULL, '', '2026-09-22 09:40:03', '2026-09-23 01:56:00'),
(340, 2, 143, 'Aktif', 'Lunas', NULL, NULL, NULL, 'https://github.com/ericojianhua-web/Kursuskuuu', NULL, NULL, '', '2026-09-22 09:40:23', '2026-09-23 01:55:43'),
(341, 2, 144, 'Aktif', 'Lunas', NULL, NULL, NULL, NULL, NULL, NULL, '', '2026-09-23 02:06:44', '2026-09-23 02:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL,
  `credits` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `program_id`, `code`, `name`, `credits`, `created_at`, `updated_at`) VALUES
(2, 2, '25.5.28.CP3.01', 'BAHASA PEMROGRAMAN III* (PHP/MYSQL)', 3, '2026-09-03 16:18:24', '2026-09-04 17:19:51'),
(3, 3, '24.5.25.CP4.03', 'Pemograman Komputer', 3, '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(5, 5, '29.05.33.CP4.2', 'Pemrograman Berorientasi Objek', 3, '2026-09-04 17:27:08', '2026-09-04 17:27:08'),
(6, 5, '29.05.05.CP4.2', 'Augmented and Virtual Reality', 2, '2026-09-04 17:28:11', '2026-09-04 17:28:11'),
(7, 5, '29.05.54.CP4.4', 'Kecerdasan Bisnis', 2, '2026-09-04 17:31:17', '2026-09-04 17:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `type` enum('Kuliah','Ujian','Deadline','Bimbingan','Kegiatan') NOT NULL DEFAULT 'Kegiatan',
  `event_date` date NOT NULL,
  `event_time` time DEFAULT NULL,
  `location` varchar(250) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_quiz_answers`
--

CREATE TABLE `live_quiz_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `player_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer_key` varchar(8) DEFAULT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `base_score` int(11) NOT NULL DEFAULT 0,
  `speed_bonus` int(11) NOT NULL DEFAULT 0,
  `total_score` int(11) NOT NULL DEFAULT 0,
  `response_ms` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `answered_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_quiz_players`
--

CREATE TABLE `live_quiz_players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `correct_count` int(11) NOT NULL DEFAULT 0,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_seen_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_quiz_sessions`
--

CREATE TABLE `live_quiz_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `join_code` varchar(8) NOT NULL,
  `status` enum('waiting','question','review','finished') NOT NULL DEFAULT 'waiting',
  `question_order_json` longtext NOT NULL,
  `current_index` int(11) NOT NULL DEFAULT -1,
  `current_question_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seconds_per_question` smallint(5) UNSIGNED NOT NULL DEFAULT 30,
  `question_started_at` datetime DEFAULT NULL,
  `question_ends_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `live_quiz_sessions`
--

INSERT INTO `live_quiz_sessions` (`id`, `quiz_id`, `class_id`, `created_by`, `join_code`, `status`, `question_order_json`, `current_index`, `current_question_id`, `seconds_per_question`, `question_started_at`, `question_ends_at`, `started_at`, `ended_at`, `created_at`, `updated_at`) VALUES
(2, 2, 8, 1, 'GSUMVC', 'waiting', '[32,29,25,34,30,21,28,35,22,26,23,31,24,27,33]', -1, NULL, 30, NULL, NULL, NULL, NULL, '2026-09-08 09:26:35', '2026-09-08 09:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL,
  `faculty` varchar(200) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `code`, `name`, `faculty`, `created_at`, `updated_at`) VALUES
(2, 'PTIK', 'Pendidikan Teknik Informatika dan Komputer', 'Fakultas Tarbiyah dan Ilmu Keguruan (FTIK)', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(3, 'PMTK', 'Pendidikan Matematika', 'Fakultas Tarbiyah dan Ilmu Keguruan (FTIK)', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(5, 'IF', 'Informatika', 'Sains dan Teknologi', '2026-09-04 17:26:33', '2026-09-04 17:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `status` enum('draft','published','closed') NOT NULL DEFAULT 'draft',
  `duration_minutes` smallint(5) UNSIGNED NOT NULL DEFAULT 30,
  `available_from` datetime DEFAULT NULL,
  `available_until` datetime DEFAULT NULL,
  `max_attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `shuffle_questions` tinyint(1) NOT NULL DEFAULT 0,
  `shuffle_options` tinyint(1) NOT NULL DEFAULT 0,
  `show_answers_after_submit` tinyint(1) NOT NULL DEFAULT 1,
  `show_explanations_after_submit` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `class_id`, `task_id`, `created_by`, `title`, `description`, `instructions`, `status`, `duration_minutes`, `available_from`, `available_until`, `max_attempts`, `shuffle_questions`, `shuffle_options`, `show_answers_after_submit`, `show_explanations_after_submit`, `created_at`, `updated_at`) VALUES
(2, 8, 36, 1, 'kuis 1 - Editor Essensial', '', 'Jawab seluruh soal dengan teliti dan kumpulkan jawaban sebelum waktu habis.', 'published', 30, '2026-09-08 16:00:00', '2026-09-08 16:30:00', 1, 1, 1, 1, 1, '2026-09-08 09:25:33', '2026-09-08 09:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attempt_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer_text` longtext DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `auto_score` decimal(9,2) NOT NULL DEFAULT 0.00,
  `manual_score` decimal(9,2) DEFAULT NULL,
  `feedback` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `attempt_no` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('in_progress','submitted','graded') NOT NULL DEFAULT 'in_progress',
  `question_order_json` longtext DEFAULT NULL,
  `started_at` datetime NOT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `auto_score` decimal(9,2) NOT NULL DEFAULT 0.00,
  `manual_score` decimal(9,2) NOT NULL DEFAULT 0.00,
  `final_score` decimal(7,2) DEFAULT NULL,
  `tab_switch_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `question_type` enum('mcq','essay') NOT NULL DEFAULT 'mcq',
  `question_text` longtext NOT NULL,
  `image_path` varchar(500) DEFAULT NULL,
  `options_json` longtext DEFAULT NULL,
  `option_images_json` longtext DEFAULT NULL,
  `correct_answer` longtext DEFAULT NULL,
  `explanation` longtext DEFAULT NULL,
  `points` decimal(7,2) NOT NULL DEFAULT 1.00,
  `sort_order` int(11) NOT NULL DEFAULT 10,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `quiz_id`, `question_type`, `question_text`, `image_path`, `options_json`, `option_images_json`, `correct_answer`, `explanation`, `points`, `sort_order`, `created_at`, `updated_at`) VALUES
(21, 2, 'mcq', 'Apa karakteristik utama dari Unity Studio berdasarkan materi pengantar?', NULL, '{\"A\":\"Aplikasi desktop yang membutuhkan instalasi besar dan bahasa pemrograman C#\",\"B\":\"Editor 3D interaktif berbasis web yang tidak memerlukan instalasi dan pengetahuan C#\",\"C\":\"Perangkat lunak khusus untuk membuat efek visual pada film 2D\",\"D\":\"Ekstensi browser yang hanya bisa digunakan untuk melihat (viewer) model 3D\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'B', 'Jawaban yang benar adalah B. Editor 3D interaktif berbasis web yang tidak memerlukan instalasi dan pengetahuan C#', '1.00', 10, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(22, 2, 'mcq', 'Lisensi apa yang dibutuhkan agar pengguna dapat mengakses aplikasi Unity Studio?', NULL, '{\"A\":\"Unity Free atau Unity Personal\",\"B\":\"Unity Pro atau Unity Enterprise\",\"C\":\"Unity Industry atau Unity Studio\",\"D\":\"Unity Education atau Unity Student\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'C', 'Jawaban yang benar adalah C. Unity Industry atau Unity Studio', '1.00', 20, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(23, 2, 'mcq', 'Panel apa yang berfungsi untuk mendaftar dan mengorganisir (menyusun) semua GameObject yang ada di dalam scene?', NULL, '{\"A\":\"Project panel\",\"B\":\"Inspector panel\",\"C\":\"Hierarchy panel\",\"D\":\"Camera Preview\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'C', 'Jawaban yang benar adalah C. Hierarchy panel', '1.00', 30, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(24, 2, 'mcq', 'Jika Anda ingin mencari dan mengelola asset library (perpustakaan aset) seperti model 3D, gambar, dan visual scripts, panel mana yang harus dibuka?', NULL, '{\"A\":\"Project panel\",\"B\":\"Inspector panel\",\"C\":\"Scene view\",\"D\":\"Hierarchy panel\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'A', 'Jawaban yang benar adalah A. Project panel', '1.00', 40, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(25, 2, 'mcq', 'Untuk mengubah ukuran (scale), warna, atau sifat perilaku (behavior) dari sebuah GameObject yang dipilih, Anda harus menggunakan...', NULL, '{\"A\":\"Scene view\",\"B\":\"Inspector panel\",\"C\":\"Hierarchy panel\",\"D\":\"Project panel\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'B', 'Jawaban yang benar adalah B. Inspector panel', '1.00', 50, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(26, 2, 'mcq', 'Saat berada di Scene view, tombol keyboard apa yang digunakan untuk memfokuskan kamera langsung kepada GameObject yang sedang dipilih?', NULL, '{\"A\":\"Tombol C\",\"B\":\"Tombol F\",\"C\":\"Tombol V\",\"D\":\"Tombol Z\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'B', 'Jawaban yang benar adalah B. Tombol F', '1.00', 60, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(27, 2, 'mcq', 'Shortcut keyboard angka \'3\' pada Unity Studio berfungsi untuk mengaktifkan alat (tool) apa?', NULL, '{\"A\":\"Move tool\",\"B\":\"Free Transform tool\",\"C\":\"Scale tool\",\"D\":\"Rotate tool\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'D', 'Jawaban yang benar adalah D. Rotate tool', '1.00', 70, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(28, 2, 'mcq', 'Pada panel alat transformasi, apa fungsi dari shortcut keyboard \'Z\'?', NULL, '{\"A\":\"Mengubah mode antara global space dan local space\",\"B\":\"Menghapus objek yang dipilih\",\"C\":\"Beralih antara memindahkan GameObject dari pusatnya (center) atau dari titik porosnya (pivot)\",\"D\":\"Menggandakan (duplicate) objek yang dipilih\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'C', 'Jawaban yang benar adalah C. Beralih antara memindahkan GameObject dari pusatnya (center) atau dari titik porosnya (pivot)', '1.00', 80, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(29, 2, 'mcq', 'Berdasarkan materi, selain mendukung file CAD seperti STEP menggunakan asset transformer, format file aset 3D apa saja yang didukung secara langsung (natively) oleh Unity Studio?', NULL, '{\"A\":\"PSD, AI, dan CDR\",\"B\":\"FBX, OBJ, dan GLB\",\"C\":\"MP4, AVI, dan MOV\",\"D\":\"DOCX, PDF, dan TXT\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'B', 'Jawaban yang benar adalah B. FBX, OBJ, dan GLB', '1.00', 90, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(30, 2, 'mcq', 'Di mana lokasi penyimpanan standar dari aset-aset yang baru saja Anda impor (upload) ke dalam Project?', NULL, '{\"A\":\"Di dalam folder \\\"My Assets\\\" pada Project panel\",\"B\":\"Langsung berada di Hierarchy panel\",\"C\":\"Di dalam folder \\\"Downloads\\\" pada komputer lokal\",\"D\":\"Di Inspector panel\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'A', 'Jawaban yang benar adalah A. Di dalam folder \"My Assets\" pada Project panel', '1.00', 100, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(31, 2, 'mcq', 'Pada komponen apa di dalam Inspector panel Anda harus memasukkan/menyematkan sebuah Material ke dalam GameObject?', NULL, '{\"A\":\"Transform component\",\"B\":\"Mesh Renderer atau Skinned Mesh Renderer component\",\"C\":\"Animation component\",\"D\":\"Camera component\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'B', 'Jawaban yang benar adalah B. Mesh Renderer atau Skinned Mesh Renderer component', '1.00', 110, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(32, 2, 'mcq', 'Ketika Anda mencoba mengedit properti dari material bawaan aset yang diimpor, seringkali propertinya berwarna abu-abu (tidak bisa diedit). Apa yang harus dilakukan untuk mengubahnya?', NULL, '{\"A\":\"Menghapus aset tersebut dan mengimpornya kembali\",\"B\":\"Mengklik tombol \\\"Edit Material\\\" agar Unity Studio membuat salinan (copy) yang bisa diedit di folder My Assets\",\"C\":\"Menggunakan script C# untuk memaksa properti terbuka\",\"D\":\"Mengganti format file model 3D menjadi CAD\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'B', 'Jawaban yang benar adalah B. Mengklik tombol \"Edit Material\" agar Unity Studio membuat salinan (copy) yang bisa diedit di folder My Assets', '1.00', 120, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(33, 2, 'mcq', 'Jika Anda ingin memberikan pergerakan atau animasi pada satu GameObject saja (tunggal), apa langkah pertama yang harus dilakukan di Inspector panel?', NULL, '{\"A\":\"Menambahkan Animation Director di Hierarchy\",\"B\":\"Mengklik tombol Play di Scene view\",\"C\":\"Mengklik Add Component lalu menambahkan komponen Animation\",\"D\":\"Mengubah Autoplay menjadi aktif\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'C', 'Jawaban yang benar adalah C. Mengklik Add Component lalu menambahkan komponen Animation', '1.00', 130, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(34, 2, 'mcq', 'Fitur apa yang digunakan jika Anda ingin mengkoordinasikan dan menganimasikan beberapa GameObject sekaligus dalam satu rentang waktu (timeline) yang sama?', NULL, '{\"A\":\"Camera Preview\",\"B\":\"Animation Director\",\"C\":\"Free Transform tool\",\"D\":\"Mesh Renderer\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'B', 'Jawaban yang benar adalah B. Animation Director', '1.00', 140, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(35, 2, 'mcq', 'Di bawah ini adalah pilihan opsi pemutaran (Playback options) untuk animasi di Unity Studio, KECUALI...', NULL, '{\"A\":\"Once\",\"B\":\"Loop\",\"C\":\"Ping Pong\",\"D\":\"Shuffle\"}', '{\"A\":\"\",\"B\":\"\",\"C\":\"\",\"D\":\"\"}', 'D', 'Jawaban yang benar adalah D. Shuffle', '1.00', 150, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(36, 2, 'essay', 'Sebutkan dan jelaskan secara singkat fungsi dari 5 panel utama yang terdapat pada antarmuka (interface) Unity Studio!', NULL, NULL, NULL, '5 Panel Utama:\nHierarchy panel: Terletak di sebelah kiri, berfungsi untuk mendaftar dan mengorganisir semua GameObject yang ada di dalam scene.\nProject panel: Terletak di bawah, berfungsi sebagai perpustakaan aset (asset library) untuk menyimpan model 3D, gambar, dan material.\nScene view: Area kerja utama di tengah untuk membangun, mengatur ruang, dan berinteraksi dengan scene 3D.\nInspector panel: Terletak di sebelah kanan, berfungsi untuk melihat dan mengatur properti dari GameObject yang dipilih (seperti ukuran, warna, material, komponen).\nCamera Preview: Panel untuk melihat tayangan langsung (real-time view) dari apa yang ditangkap oleh kamera utama (Main Camera) di dalam scene.', '5 Panel Utama:\nHierarchy panel: Terletak di sebelah kiri, berfungsi untuk mendaftar dan mengorganisir semua GameObject yang ada di dalam scene.\nProject panel: Terletak di bawah, berfungsi sebagai perpustakaan aset (asset library) untuk menyimpan model 3D, gambar, dan material.\nScene view: Area kerja utama di tengah untuk membangun, mengatur ruang, dan berinteraksi dengan scene 3D.\nInspector panel: Terletak di sebelah kanan, berfungsi untuk melihat dan mengatur properti dari GameObject yang dipilih (seperti ukuran, warna, material, komponen).\nCamera Preview: Panel untuk melihat tayangan langsung (real-time view) dari apa yang ditangkap oleh kamera utama (Main Camera) di dalam scene.', '5.00', 160, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(37, 2, 'essay', 'Jelaskan fungsi dari shortcut keyboard navigasi kamera berikut di Scene view: W, A, S, D, Q, dan E.', NULL, NULL, NULL, 'Fungsi Keyboard Navigasi: Tombol W, A, S, D digunakan masing-masing untuk menggerakkan kamera ke depan (forward), kiri (left), belakang (back), dan kanan (right). Sedangkan Q dan E digunakan untuk menggerakkan kamera ke bawah (down) dan ke atas (up).', 'Fungsi Keyboard Navigasi: Tombol W, A, S, D digunakan masing-masing untuk menggerakkan kamera ke depan (forward), kiri (left), belakang (back), dan kanan (right). Sedangkan Q dan E digunakan untuk menggerakkan kamera ke bawah (down) dan ke atas (up).', '5.00', 170, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(38, 2, 'essay', 'Jelaskan langkah-langkah dasar bagaimana cara mengimpor aset 3D milik Anda sendiri (misalnya file berformat .obj atau .glb) ke dalam proyek Unity Studio!', NULL, NULL, NULL, 'Langkah import aset 3D: Buka Project panel, klik tombol Add Assets (akan membuka Asset Manager). Klik tombol Add, pilih file dari komputer, lalu klik Upload. Setelah terunggah, centang checkbox pada aset tersebut dan klik Import. Aset akan tersimpan di dalam folder My Assets.', 'Langkah import aset 3D: Buka Project panel, klik tombol Add Assets (akan membuka Asset Manager). Klik tombol Add, pilih file dari komputer, lalu klik Upload. Setelah terunggah, centang checkbox pada aset tersebut dan klik Import. Aset akan tersimpan di dalam folder My Assets.', '5.00', 180, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(39, 2, 'essay', 'Bagaimana cara membuat material baru dan mengaplikasikannya (memasangnya) ke sebuah GameObject di dalam scene?', NULL, NULL, NULL, 'Cara membuat dan memasang material:\nDi Project panel, klik Add (+) lalu pilih Material dan beri nama.\nPilih GameObject di Scene view.\nPada Inspector panel, buka komponen Mesh Renderer (atau Skinned Mesh Renderer). Buka dropdown Materials, lalu drag (tarik) material baru dari Project panel ke dalam kotak Materials (atau gunakan ikon picker untuk memilihnya).', 'Cara membuat dan memasang material:\nDi Project panel, klik Add (+) lalu pilih Material dan beri nama.\nPilih GameObject di Scene view.\nPada Inspector panel, buka komponen Mesh Renderer (atau Skinned Mesh Renderer). Buka dropdown Materials, lalu drag (tarik) material baru dari Project panel ke dalam kotak Materials (atau gunakan ikon picker untuk memilihnya).', '5.00', 190, '2026-09-08 09:25:57', '2026-09-08 09:25:57'),
(40, 2, 'essay', 'Saat membuat animasi di Animation Timeline, jelaskan bagaimana cara sistem keyframe bekerja untuk merekam perubahan posisi atau pergerakan objek!', NULL, NULL, NULL, 'Cara kerja keyframe: Saat Animation Timeline terbuka dan GameObject dipilih, Anda cukup menggeser kursor timeline (waktu) ke titik yang diinginkan, kemudian lakukan perubahan pada GameObject tersebut langsung di Scene view (misalnya memindahkan atau memutarnya). Unity Studio akan secara otomatis membuat keyframe pada posisi kursor waktu tersebut untuk merekam perubahan yang baru saja dilakukan.', 'Cara kerja keyframe: Saat Animation Timeline terbuka dan GameObject dipilih, Anda cukup menggeser kursor timeline (waktu) ke titik yang diinginkan, kemudian lakukan perubahan pada GameObject tersebut langsung di Scene view (misalnya memindahkan atau memutarnya). Unity Studio akan secara otomatis membuat keyframe pada posisi kursor waktu tersebut untuk merekam perubahan yang baru saja dilakukan.', '5.00', 200, '2026-09-08 09:25:57', '2026-09-08 09:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`, `created_at`, `updated_at`) VALUES
(1, 'institution', 'UIN Sjech M. Djamil Djambek Bukittinggi', '2026-09-03 16:12:06', '2026-09-04 17:22:56'),
(2, 'default_lecturer', 'Dashboard monitoring dosen', '2026-09-03 16:12:06', '2026-09-04 17:22:56'),
(3, 'default_pass_threshold', '70', '2026-09-03 16:12:06', '2026-09-04 17:22:56'),
(4, 'trend_drop_threshold', '10', '2026-09-03 16:12:06', '2026-09-04 17:22:56'),
(5, 'siakad_headers', 'nim,nama,tugas,uts,uas,nilai_akhir,nilai_huruf', '2026-09-03 16:12:06', '2026-09-04 17:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `special_activities`
--

CREATE TABLE `special_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'KKN',
  `status` varchar(100) NOT NULL DEFAULT 'Belum Mengikuti',
  `location` varchar(250) NOT NULL DEFAULT '',
  `supervisor` varchar(200) NOT NULL DEFAULT '',
  `progress` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_activities`
--

INSERT INTO `special_activities` (`id`, `enrollment_id`, `type`, `status`, `location`, `supervisor`, `progress`, `note`, `created_at`, `updated_at`) VALUES
(1, 83, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(2, 84, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(3, 85, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(4, 86, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(5, 87, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(6, 88, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(7, 89, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(8, 90, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(9, 91, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(10, 92, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(11, 93, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(12, 94, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(13, 95, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(14, 96, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(15, 97, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(16, 98, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(17, 99, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(18, 100, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(19, 101, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(20, 102, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(21, 103, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(22, 104, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(23, 105, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(25, 107, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(26, 108, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(27, 109, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(28, 110, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(29, 111, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(30, 112, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(31, 113, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(32, 114, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(33, 115, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(34, 116, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(35, 117, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(36, 118, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(37, 119, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(38, 120, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(39, 121, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(40, 122, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(41, 123, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(42, 124, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(43, 125, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(44, 126, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(45, 127, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(46, 128, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(47, 129, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(48, 130, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(49, 131, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(50, 132, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(51, 133, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(52, 134, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(53, 135, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(54, 136, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(55, 137, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(56, 138, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(57, 139, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(58, 140, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(59, 141, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(60, 142, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(61, 143, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(62, 144, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(63, 145, 'KKN', 'Belum Mengikuti', '', '', 0, '', '2026-09-03 16:18:25', '2026-09-03 16:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nim` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(190) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `portal_pin_hash` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `nim`, `name`, `email`, `phone`, `portal_pin_hash`, `created_at`, `updated_at`) VALUES
(1, '2524246', 'MUHAMMAD HAFIZ', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(2, '2524241', 'GEVI MELITA SARI', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(3, '2524224', 'RASTI KHAIRUNNISA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(4, '2524238', 'MAWAR SALMIAH', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(5, '2524225', 'RAUDHATUL HUSNA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(6, '2524218', 'SUCI SALZABILLA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(7, '2524234', 'MARDATUL RAHMI', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(8, '2523248', 'MALIKAL LUH DEWA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-23 01:59:59'),
(9, '2524229', 'M. RASULI AKBAR', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(10, '2524245', 'HABIBI MARAY', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(11, '2524230', 'RANDI GUSNAWAN', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(12, '2524244', 'YULIA ZIKRA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(13, '2524212', 'DIVA RAHMADANI', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(14, '2524231', 'AVILA VIDELLA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(15, '2523128', 'VENA VENESA TANJUNG', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(16, '2524233', 'KUKUH PRASETYA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(17, '2524228', 'DWI FAYRA JUSITA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(18, '2524217', 'FAUZAN ARRAYHAN SIMANJUNTAK', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(19, '2524219', 'M. IQBAL HSB', '', '', NULL, '2026-09-03 16:12:06', '2026-09-23 02:06:32'),
(20, '2524235', 'PUTRI NIRWANA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(21, '2524227', 'DYNNA KHAIRUL NYSA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(22, '2524223', 'MUHAMAD ZAQI', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(23, '2524215', 'RAHMAD ILLAHI', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(24, '2524001', '', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:12:06'),
(25, '2524232', 'NIA WINATA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(26, '2524239', 'DEA ALFITA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(27, '2524221', 'RIRI HARTIKA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(28, '2524220', 'RENDY RISALDIN RAMADHAN', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(29, '2524216', 'LAILATUL FADHILAH', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(30, '2524240', 'IMA ASMARA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(31, '2524237', 'NURLIANA', '', '', NULL, '2026-09-03 16:12:06', '2026-09-03 16:18:24'),
(33, '2524182', 'AIRIN EPRILIANTI', '', '', '$2y$10$bYcKaqb3bYLVV3Qkkupgh.l1in8/DuhcfIvmLscORBbagVisFWeum', '2026-09-03 16:14:24', '2026-09-04 16:28:45'),
(35, '2524189', 'NURUL AULIA HARAHAP', '', '', NULL, '2026-09-03 16:14:24', '2026-09-03 16:14:24'),
(37, '2524188', 'SALMA ARSY SYU`ARA', '', '', NULL, '2026-09-03 16:14:24', '2026-09-03 16:14:24'),
(38, '2524204', 'AZIFA RAHMA', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(40, '2524177', 'TEJA LESMANA ZUHRI', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(42, '2524205', 'MANNA WASSALWA RAMBE', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(43, '2524192', 'MIFTAHUL GHANI', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(45, '2524178', 'SUCI AULIA', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(47, '2524191', 'REHAN FADILAH', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(49, '2524206', 'TAUFIK HIDAYAT', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(51, '2524179', 'SYUKRINA ANJANI ASMI', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(52, '2524088', 'MUHAMAD RIDWAN', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(54, '2524181', 'FAHRUR ROZI NST', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(55, '2524194', 'M. FADILLAH', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(57, '2524208', 'KEVIN PRAYOGA PUTRA', '', '', NULL, '2026-09-03 16:14:25', '2026-09-03 16:14:25'),
(59, '2524207', 'ILHAM FADLI', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(61, '2524195', 'ALDI NUARI', '', '', '$2y$10$Pb8klfouHqjfv6i2TYbNMu/UWKXZdJ5eQdsKEyRYhllceE8MK3oRu', '2026-09-03 16:14:26', '2026-09-04 16:28:49'),
(62, '2524197', 'VIOLA NAVISA', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(63, '2524209', 'M. FANZA ATHAYA', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(65, '2523261', 'M. RIFALD AKTOYOSVIAN', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(67, '2524183', 'KHAIROTUN NISA', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(68, '2524185', 'BIL HIKMAH HAQUE', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(70, '2524184', 'ENGLA TADISIA', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(72, '2524095', 'JUNANDA HANIF', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(73, '2524200', 'FADEL MUHAMMAD', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(74, '2522258', 'MUHAMMAD HUSEIN AL-HAFIDZ AL-PARISI', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(76, '2524187', 'INDAH DWI FEBRI', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(77, '2524186', 'MUHAMMAD AGUNG PRANOTO', '', '', NULL, '2026-09-03 16:14:26', '2026-09-03 16:14:26'),
(78, '2524203', 'VIONA JUNIA FOURTIKA', '', '', NULL, '2026-09-03 16:14:27', '2026-09-03 16:14:27'),
(80, '2524176', 'JINGGA PERMATASARI', '', '', NULL, '2026-09-03 16:14:27', '2026-09-03 16:14:27'),
(82, '2524202', 'MUHAMMAD ARIF PUTRA', '', '', NULL, '2026-09-03 16:14:27', '2026-09-03 16:14:27'),
(83, '2424042', 'KHAIRUNNISA', '', '', NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(84, '2924011', 'ROBI FERNANDO PUTRA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(85, '2924023', 'MIFTAH HULJANAH', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(86, '2924006', 'ELVI YANTI TANJUNG', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(87, '2924024', 'MAULANA ISHAQ', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(88, '2924034', 'CAESAR RAJA YUSRI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(89, '2924003', 'M ZAKY ALFADLANI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(90, '2924004', 'INDAH SAFITRI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(91, '2924001', 'ANNISA MIFTAHUL JANNAH', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(92, '2924013', 'MUHAMAD ILHAM', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(93, '2924026', 'JOYCE SETRYA FEBRYANA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(94, '2924025', 'FUJI SAKIYAH NASUTION', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(95, '2924007', 'MUHAMMAD YAWAD ARRAHMAN', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(96, '2924035', 'SITI HARDIYANTI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(97, '2924027', 'WIRA AFRIYANI PUTRI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(98, '2924029', 'REGZA JULINDO MAHESWARA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(99, '2924028', 'LASTRI YANTI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(100, '2924014', 'SALMAN AL ZIKRI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(101, '2924002', 'WAHYU ANNISA EFRIATI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(102, '2924017', 'MART KELLIN', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(103, '2924038', 'ALFARABI MA\'RUF', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(104, '2924030', 'MUAMMAR HUSEIN HASIBUAN', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(105, '2924008', 'SANTRI WANI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(106, '2924015', 'ALFIN ARDIANSYAH', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(107, '2924016', 'RAIS AMMAR BUDIMAN', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(108, '2924010', 'SASKIA KHOIRUNNISA NASUTION', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(109, '2924036', 'RAHMATIKA YUANDRA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(110, '2924005', 'HARYWAN MUHARRAN PASARIBU', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(111, '2924039', 'ZULKIFLI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(112, '2924031', 'ILZI FAHREZI', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(113, '2924019', 'FADHIL ISKANDAR', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(114, '2924012', 'MUTIARA JONI LEGITA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(115, '2924018', 'CINTA OLA HERNANDA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(116, '2924037', 'MHD. ABDI AL-ZIKRA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(117, '2924020', 'ABDUL REYHAN SYAIDINA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(118, '2924032', 'SALSABILLA SINAGA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(119, '2924009', 'PATIMAH PULUNGAN', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(120, '2924033', 'M. ATAS ROMADON', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(121, '2924022', 'VHIRGINIA CALLISTA AMANDA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(122, '2924021', 'AWA AIMASUGIRA', '', '', NULL, '2026-09-04 17:14:50', '2026-09-04 17:14:50'),
(123, '2424036', 'RAHMATUL AULYA', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(124, '2422074', 'FAJAR ENDY AGUS STIAWAN', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(125, '2424039', 'ZIKRA RAHMANA PUTRA', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(126, '2424043', 'AISYAH PUTRI', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(127, '2424033', 'SYAHYU RAHMADANI', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(128, '2424034', 'NADA MARDATILLAH', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(129, '2424029', 'AAN KURNIA', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(130, '2424030', 'NISWA HEZHIRATUL QUDSI', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(131, '2424040', 'RAIHAN GHAZI AL GHIFARI', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(132, '2424032', 'DIAN NISA FEBRIANTI', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(133, '2424031', 'AFNI ELI JUWITA', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(134, '2424045', 'AFIZA GUSDIANY', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(135, '2424025', 'DWI MELANI', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(136, '2424028', 'SOVIA NASZUAL HAJLA', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(137, '2424026', 'GITA JELFIA', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(138, '2424038', 'SEPTI AULIA SUSFIANDRI', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(139, '2424027', 'MIRAWATI', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(140, '2424041', 'MAYA', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(141, '2424048', 'RAHMA GHINA FITRIYAH', '', '', NULL, '2026-09-07 06:46:31', '2026-09-07 06:46:31'),
(142, '2524226', 'ABDUL RASYID', '', '', NULL, '2026-09-22 09:40:03', '2026-09-22 09:40:03'),
(143, '2524242', 'ERICO JIANHUA', '', '', NULL, '2026-09-22 09:40:23', '2026-09-22 09:40:23'),
(144, '2524214', 'M. IQBAL', '', '', NULL, '2026-09-23 02:06:44', '2026-09-23 02:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'Tugas Harian',
  `weight` decimal(5,2) NOT NULL DEFAULT 0.00,
  `max_score` decimal(7,2) NOT NULL DEFAULT 100.00,
  `meeting` tinyint(3) UNSIGNED DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `class_id`, `name`, `type`, `weight`, `max_score`, `meeting`, `due_date`, `description`, `sort_order`, `created_at`, `updated_at`) VALUES
(8, 2, 'Tugas (1-2)', 'Praktikum', '10.00', '100.00', 2, NULL, 'kursusku-prototype/\r\n|-- index.php\r\n|-- server-time.php\r\n|-- assets/\r\n|   |-- images/hero-kursus.jpg\r\n|   `-- video/intro-kursus.mp4\r\n`-- evidence/week-02/\r\n    |-- 01-desktop.png\r\n    |-- 02-mobile.png\r\n    |-- 03-media.png\r\n    `-- 04-view-source.png', 10, '2026-09-03 16:18:24', '2026-09-23 02:17:07'),
(9, 2, 'Tugas Mandiri (3-4)', 'Praktikum', '10.00', '100.00', 4, NULL, '├── week-03/\r\n    │   ├── kalkulator.png\r\n    │   ├── test-case.png\r\n    │   └── source-code.png\r\n    │\r\n    └── week-04/\r\n        ├── katalog-6-kursus.png\r\n        ├── status-kursus.png\r\n        └── test-functions.png', 20, '2026-09-03 16:18:24', '2026-09-23 02:19:03'),
(10, 2, 'Tugas 5', 'Praktikum', '10.00', '100.00', 5, NULL, '', 30, '2026-09-03 16:18:24', '2026-09-23 06:10:18'),
(11, 2, 'Tugas 6', 'Tugas Harian', '10.00', '100.00', 10, NULL, '', 40, '2026-09-03 16:18:24', '2026-09-24 02:12:06'),
(12, 2, 'Tugas 7', 'Tugas Harian', '10.00', '100.00', 12, NULL, '', 50, '2026-09-03 16:18:24', '2026-09-24 02:12:14'),
(13, 2, 'UTS', 'UTS', '20.00', '100.00', 8, NULL, '', 60, '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(14, 2, 'UAS', 'UAS', '30.00', '100.00', 16, NULL, '', 70, '2026-09-03 16:18:24', '2026-09-03 16:18:24'),
(15, 3, 'Tugas 2', 'Praktikum', '5.00', '100.00', 2, NULL, 'kursusku-prototype/\r\n|-- index.php\r\n|-- server-time.php\r\n|-- assets/\r\n|   |-- images/hero-kursus.jpg\r\n|   `-- video/intro-kursus.mp4\r\n`-- evidence/week-02/\r\n    |-- 01-desktop.png\r\n    |-- 02-mobile.png\r\n    |-- 03-media.png\r\n    `-- 04-view-source.png', 10, '2026-09-03 16:18:25', '2026-09-23 02:20:41'),
(16, 3, 'Tugas 3', 'Praktikum', '5.00', '100.00', 3, NULL, 'kursusku-prototype/\r\n|-- index.php\r\n|-- fee-calculator.php\r\n|-- README.md\r\n`-- evidence/\r\n`-- week-03/\r\n|-- kalkulator.png\r\n|-- test-case.png\r\n`-- source-code.png', 20, '2026-09-03 16:18:25', '2026-09-23 02:20:49'),
(17, 3, 'Tugas 4 (ONLINE)', 'Praktikum', '10.00', '100.00', 4, NULL, '└── week-04/\r\n        ├── katalog-6-kursus.png\r\n        ├── status-kursus.png\r\n        └── test-functions.png', 30, '2026-09-03 16:18:25', '2026-09-23 02:19:49'),
(18, 3, 'Tugas 5', 'Praktikum', '10.00', '100.00', 5, NULL, '', 40, '2026-09-03 16:18:25', '2026-09-23 02:22:23'),
(19, 3, 'Tugas 6', 'Praktikum', '10.00', '100.00', 6, NULL, '', 50, '2026-09-03 16:18:25', '2026-09-23 02:22:14'),
(20, 3, 'UTS', 'UTS', '20.00', '100.00', 8, NULL, '', 70, '2026-09-03 16:18:25', '2026-09-23 02:23:57'),
(21, 3, 'UAS', 'UAS', '30.00', '100.00', 16, NULL, '', 80, '2026-09-03 16:18:25', '2026-09-23 02:24:06'),
(22, 4, 'Praktikum (1-3)', 'Praktikum', '10.00', '100.00', 3, NULL, '', 10, '2026-09-03 16:18:25', '2026-09-09 11:54:38'),
(23, 4, 'Tugas 4 (Online)', 'Praktikum', '10.00', '100.00', 4, NULL, 'Buat fungsi keliling_persegi(sisi).\r\nBuat fungsi volume_balok(p, l, t).\r\nBuat fungsi menghitung nilai akhir mahasiswa.\r\nBuat Mini Library Matematika dengan minimal empat fungsi: luas persegi, luas segitiga, luas lingkaran, dan volume balok', 20, '2026-09-03 16:18:25', '2026-09-23 05:15:04'),
(24, 4, 'Tugas 5', 'Praktikum', '10.00', '100.00', 5, NULL, '', 30, '2026-09-03 16:18:25', '2026-09-23 05:15:13'),
(25, 4, 'Tugas 4', 'Tugas Harian', '10.00', '100.00', 10, NULL, '', 40, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(26, 4, 'Tugas 5', 'Tugas Harian', '10.00', '100.00', 12, NULL, '', 50, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(27, 4, 'UTS', 'UTS', '20.00', '100.00', 8, NULL, '', 60, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(28, 4, 'UAS', 'UAS', '30.00', '100.00', 16, NULL, '', 70, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(29, 7, 'Praktikum (1-2)', 'Praktikum', '10.00', '100.00', 2, NULL, '1. latihanbiayakursus\r\n2. latihanbidangdatar', 1, '2026-09-04 17:34:17', '2026-09-08 02:24:58'),
(30, 7, 'Praktikum Mandiri 3', 'Praktikum', '10.00', '100.00', 3, NULL, '1. Project/folder NetBeans yang memuat FormPendaftaranAwal.java.\r\n2. Screenshot form berhasil memproses data.\r\n3. Screenshot validasi ketika biaya bukan angka', 2, '2026-09-04 17:35:20', '2026-09-22 02:19:16'),
(31, 7, 'Tugas 3', 'Praktikum', '10.00', '100.00', 6, NULL, '', 30, '2026-09-04 17:36:42', '2026-09-04 17:40:15'),
(32, 7, 'Tugas 4', 'Tugas Harian', '10.00', '100.00', 10, NULL, '', 40, '2026-09-04 17:37:00', '2026-09-04 17:40:22'),
(33, 7, 'Tugas 5', 'Tugas Harian', '10.00', '100.00', 12, NULL, '', 50, '2026-09-04 17:37:14', '2026-09-04 17:40:29'),
(34, 7, 'UTS', 'UTS', '20.00', '100.00', 8, NULL, '', 60, '2026-09-04 17:37:25', '2026-09-04 17:40:35'),
(35, 7, 'Proyek', 'UAS', '30.00', '100.00', 16, NULL, '', 70, '2026-09-04 17:37:44', '2026-09-04 17:40:42'),
(36, 8, 'Praktikum (1-2)', 'Praktikum', '10.00', '100.00', 2, NULL, '', 10, '2026-09-08 03:36:10', '2026-09-08 03:36:10'),
(37, 3, 'Tugas 7', 'Praktikum', '10.00', '100.00', 7, NULL, '', 60, '2026-09-23 02:22:52', '2026-09-23 02:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `task_records`
--

CREATE TABLE `task_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','submitted','graded','late') NOT NULL DEFAULT 'pending',
  `score` decimal(7,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `github_url` varchar(500) DEFAULT NULL,
  `colab_url` varchar(500) DEFAULT NULL,
  `drive_url` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_records`
--

INSERT INTO `task_records` (`id`, `task_id`, `enrollment_id`, `status`, `score`, `note`, `github_url`, `colab_url`, `drive_url`, `created_at`, `updated_at`) VALUES
(1, 8, 83, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(2, 8, 84, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(3, 8, 85, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(4, 8, 86, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(5, 8, 87, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(6, 8, 89, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(7, 8, 91, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(8, 8, 92, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(9, 8, 93, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(10, 8, 94, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(11, 8, 95, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(12, 8, 96, 'graded', '75.00', 'rapihkan penamaan file dan file css letak di bagian assets', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(13, 8, 97, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(14, 8, 111, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(15, 8, 110, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(16, 8, 105, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(17, 8, 102, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(18, 8, 101, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(19, 8, 100, 'graded', '70.00', 'evidence tidak sesuai dengan tugas 1-2', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(20, 8, 99, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(21, 8, 98, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-03 16:18:24', '2026-09-23 08:13:34'),
(22, 15, 114, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(23, 15, 115, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(24, 15, 116, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(25, 15, 119, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(26, 15, 120, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(27, 15, 122, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(28, 15, 126, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(29, 15, 127, 'late', '60.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(30, 15, 128, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(31, 15, 129, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(32, 15, 144, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(33, 15, 139, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(34, 15, 137, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(35, 15, 136, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(36, 15, 135, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(37, 15, 134, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(38, 15, 133, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(39, 15, 132, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(40, 15, 131, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(41, 15, 130, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:36'),
(42, 16, 114, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:10'),
(43, 16, 115, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-14 04:10:10'),
(44, 17, 114, 'graded', '85.00', 'Gunakan CSS untuk mempercantik dan memperindah tampilan visual website di landing page', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-24 02:34:34'),
(45, 17, 115, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-24 02:34:34'),
(46, 18, 114, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(47, 18, 115, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(48, 19, 114, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(49, 19, 115, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(50, 20, 114, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(51, 20, 115, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(52, 21, 114, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(53, 21, 115, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-03 16:18:25', '2026-09-03 16:18:25'),
(56, 15, 117, 'pending', '75.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(59, 15, 138, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(62, 15, 140, 'pending', '75.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(63, 15, 143, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(72, 15, 125, 'graded', '60.00', 'belum lengkap', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(73, 15, 141, 'graded', '65.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(79, 15, 121, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(80, 15, 124, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(81, 15, 123, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(82, 15, 118, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(84, 15, 142, 'late', '60.00', '', NULL, NULL, NULL, '2026-09-03 17:00:34', '2026-09-14 04:10:36'),
(179, 16, 130, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(180, 16, 117, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(181, 16, 135, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(182, 16, 136, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(183, 16, 138, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(184, 16, 126, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(185, 16, 129, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(186, 16, 140, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(187, 16, 143, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(188, 16, 137, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(189, 16, 128, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(190, 16, 134, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(191, 16, 127, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(192, 16, 132, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(193, 16, 133, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(194, 16, 119, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(195, 16, 120, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(196, 16, 125, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(197, 16, 141, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(198, 16, 144, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(199, 16, 139, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(201, 16, 122, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(202, 16, 116, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(203, 16, 121, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(204, 16, 124, 'graded', '50.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(205, 16, 123, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(206, 16, 118, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(207, 16, 131, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(208, 16, 142, 'graded', '50.00', '', NULL, NULL, NULL, '2026-09-04 16:03:41', '2026-09-14 04:10:10'),
(210, 17, 130, 'graded', '60.00', 'Perbaiki/Sesuaikan dengan panduan praktikum struktur folder', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(211, 17, 117, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(212, 17, 135, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(213, 17, 136, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(214, 17, 138, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(215, 17, 126, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(216, 17, 129, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(217, 17, 140, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(218, 17, 143, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(219, 17, 137, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(220, 17, 128, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(221, 17, 134, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(222, 17, 127, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(223, 17, 132, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(224, 17, 133, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(225, 17, 119, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(226, 17, 120, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(227, 17, 125, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(228, 17, 141, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(229, 17, 144, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(230, 17, 139, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(232, 17, 122, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(233, 17, 116, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(234, 17, 121, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(235, 17, 124, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(236, 17, 123, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(237, 17, 118, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(238, 17, 131, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(239, 17, 142, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 16:24:38', '2026-09-24 02:34:34'),
(395, 29, 224, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(396, 29, 244, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(397, 29, 247, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(398, 29, 232, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(399, 29, 262, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(400, 29, 229, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(401, 29, 256, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(402, 29, 227, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(403, 29, 254, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(404, 29, 235, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(405, 29, 251, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(406, 29, 253, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(407, 29, 231, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(408, 29, 234, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(409, 29, 240, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(410, 29, 230, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(411, 29, 260, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(412, 29, 243, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(413, 29, 228, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(414, 29, 257, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(415, 29, 226, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(416, 29, 245, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(417, 29, 233, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(418, 29, 236, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(419, 29, 255, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(420, 29, 259, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(421, 29, 250, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(422, 29, 248, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(423, 29, 239, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(424, 29, 225, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(425, 29, 241, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(426, 29, 258, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(427, 29, 246, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(428, 29, 249, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(429, 29, 237, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(430, 29, 261, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(431, 29, 242, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(432, 29, 238, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(433, 29, 252, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-04 17:39:08', '2026-09-22 04:16:39'),
(435, 8, 108, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(438, 8, 103, 'late', '80.00', '', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(442, 8, 112, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(449, 8, 104, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(451, 8, 107, 'graded', '60.00', 'folder assets dan evidence belum ada', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(452, 8, 113, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(459, 8, 109, 'graded', '60.00', 'folder assets dan evidence belum ada', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(460, 8, 88, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(464, 8, 90, 'pending', '0.00', '', NULL, NULL, NULL, '2026-09-05 09:23:19', '2026-09-23 08:13:34'),
(496, 9, 96, 'graded', '75.00', 'rapihkan lagi struktur file dan folder.', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(497, 9, 108, 'graded', '60.00', 'folder assets dan evidence belum ada', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(498, 9, 95, 'graded', '75.00', 'rapihkan lagi struktur file dan folder.', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(499, 9, 99, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(500, 9, 103, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(501, 9, 100, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(502, 9, 84, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(503, 9, 92, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(504, 9, 112, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(505, 9, 98, 'graded', '50.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(506, 9, 111, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(507, 9, 101, 'graded', '60.00', 'perbaiki dan lengkapi seluruh komponen tugas', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(508, 9, 91, 'pending', '70.00', 'ada 3 mhs tugas identik dengan mahsiswa lain', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(509, 9, 89, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(510, 9, 86, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(511, 9, 104, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(512, 9, 83, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(513, 9, 107, 'graded', '70.00', 'lengkapi struktur folder nya', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(514, 9, 113, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(515, 9, 102, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(516, 9, 105, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(517, 9, 93, 'graded', '70.00', 'ada 3 mhs tugas identik dengan mahsiswa lain', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(518, 9, 85, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01');
INSERT INTO `task_records` (`id`, `task_id`, `enrollment_id`, `status`, `score`, `note`, `github_url`, `colab_url`, `drive_url`, `created_at`, `updated_at`) VALUES
(519, 9, 87, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(520, 9, 110, 'graded', '70.00', 'ada 3 mhs tugas identik dengan mahsiswa lain', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(521, 9, 109, 'graded', '60.00', 'lengkapi strutktur folder', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(522, 9, 88, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(523, 9, 97, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(524, 9, 94, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(526, 9, 90, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:42:49', '2026-09-23 09:17:01'),
(527, 10, 96, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(528, 10, 108, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(529, 10, 95, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(530, 10, 99, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(531, 10, 103, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(532, 10, 100, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(533, 10, 84, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(534, 10, 92, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(535, 10, 112, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(536, 10, 98, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(537, 10, 111, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(538, 10, 101, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(539, 10, 91, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(540, 10, 89, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(541, 10, 86, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(542, 10, 104, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(543, 10, 83, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(544, 10, 107, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(545, 10, 113, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(546, 10, 102, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(547, 10, 105, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(548, 10, 93, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(549, 10, 85, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(550, 10, 87, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(551, 10, 110, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(552, 10, 109, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(553, 10, 88, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(554, 10, 97, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(555, 10, 94, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(557, 10, 90, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:39', '2026-09-07 03:22:51'),
(558, 11, 96, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(559, 11, 108, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(560, 11, 95, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(561, 11, 99, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(562, 11, 103, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(563, 11, 100, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(564, 11, 84, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(565, 11, 92, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(566, 11, 112, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(567, 11, 98, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(568, 11, 111, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(569, 11, 101, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(570, 11, 91, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(571, 11, 89, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(572, 11, 86, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(573, 11, 104, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(574, 11, 83, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(575, 11, 107, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(576, 11, 113, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(577, 11, 102, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(578, 11, 105, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(579, 11, 93, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(580, 11, 85, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(581, 11, 87, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(582, 11, 110, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(583, 11, 109, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(584, 11, 88, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(585, 11, 97, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(586, 11, 94, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(588, 11, 90, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:47', '2026-09-07 03:23:00'),
(589, 12, 96, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(590, 12, 108, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(591, 12, 95, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(592, 12, 99, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(593, 12, 103, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(594, 12, 100, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(595, 12, 84, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(596, 12, 92, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(597, 12, 112, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(598, 12, 98, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(599, 12, 111, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(600, 12, 101, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(601, 12, 91, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(602, 12, 89, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(603, 12, 86, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(604, 12, 104, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(605, 12, 83, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(606, 12, 107, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(607, 12, 113, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(608, 12, 102, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(609, 12, 105, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(610, 12, 93, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(611, 12, 85, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(612, 12, 87, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(613, 12, 110, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(614, 12, 109, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(615, 12, 88, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(616, 12, 97, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(617, 12, 94, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(619, 12, 90, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:47:57', '2026-09-07 03:23:07'),
(744, 13, 96, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(745, 13, 108, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(746, 13, 95, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(747, 13, 99, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(748, 13, 103, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(749, 13, 100, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(750, 13, 84, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(751, 13, 92, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(752, 13, 112, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(753, 13, 98, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(754, 13, 111, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(755, 13, 101, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(756, 13, 91, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(757, 13, 89, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(758, 13, 86, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(759, 13, 104, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(760, 13, 83, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(761, 13, 107, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(762, 13, 113, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(763, 13, 102, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(764, 13, 105, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(765, 13, 93, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(766, 13, 85, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(767, 13, 87, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(768, 13, 110, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(769, 13, 109, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(770, 13, 88, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(771, 13, 97, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(772, 13, 94, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(774, 13, 90, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:10', '2026-09-07 03:23:17'),
(775, 14, 96, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(776, 14, 108, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(777, 14, 95, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(778, 14, 99, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(779, 14, 103, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(780, 14, 100, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(781, 14, 84, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(782, 14, 92, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(783, 14, 112, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(784, 14, 98, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(785, 14, 111, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(786, 14, 101, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(787, 14, 91, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(788, 14, 89, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(789, 14, 86, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(790, 14, 104, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(791, 14, 83, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(792, 14, 107, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(793, 14, 113, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(794, 14, 102, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(795, 14, 105, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(796, 14, 93, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(797, 14, 85, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(798, 14, 87, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(799, 14, 110, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(800, 14, 109, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(801, 14, 88, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(802, 14, 97, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(803, 14, 94, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(805, 14, 90, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-05 09:49:23', '2026-09-07 03:23:26'),
(1713, 22, 326, 'graded', '60.00', '', NULL, NULL, 'https://drive.google.com/drive/folders/10-JmgJkHOtos4S2QKUY_Zmv_HA7dWEjT?usp=sharing', '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1714, 22, 331, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1715, 22, 330, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1716, 22, 323, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1717, 22, 329, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1718, 22, 332, 'graded', '90.00', '', NULL, NULL, 'https://drive.google.com/drive/folders/1xeFySTOXtoQn6xoMoewbhoiOPbuYQJ5A?usp=drive_link', '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1719, 22, 321, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1720, 22, 334, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1721, 22, 145, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1722, 22, 337, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1723, 22, 336, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1724, 22, 325, 'graded', '75.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1725, 22, 327, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1726, 22, 338, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1727, 22, 320, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1728, 22, 328, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1729, 22, 335, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1730, 22, 333, 'graded', '90.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1731, 22, 324, 'graded', '70.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(1732, 22, 322, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-07 06:51:59', '2026-09-23 06:27:48'),
(2843, 30, 224, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2844, 30, 244, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2845, 30, 247, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2846, 30, 232, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2847, 30, 262, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2848, 30, 229, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2849, 30, 256, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2850, 30, 227, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2851, 30, 254, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2852, 30, 235, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2853, 30, 251, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2854, 30, 253, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2855, 30, 231, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2856, 30, 234, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2857, 30, 240, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2858, 30, 230, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2859, 30, 260, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2860, 30, 243, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2861, 30, 228, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2862, 30, 257, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24');
INSERT INTO `task_records` (`id`, `task_id`, `enrollment_id`, `status`, `score`, `note`, `github_url`, `colab_url`, `drive_url`, `created_at`, `updated_at`) VALUES
(2863, 30, 226, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2864, 30, 245, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2865, 30, 233, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2866, 30, 236, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2867, 30, 255, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2868, 30, 259, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2869, 30, 250, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2870, 30, 248, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2871, 30, 239, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2872, 30, 225, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2873, 30, 241, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2874, 30, 258, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2875, 30, 246, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2876, 30, 249, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2877, 30, 237, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2878, 30, 261, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2879, 30, 242, 'graded', '50.00', 'janggal', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2880, 30, 238, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(2881, 30, 252, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-15 14:21:44', '2026-09-22 04:16:24'),
(3794, 23, 326, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3795, 23, 331, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3796, 23, 330, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3797, 23, 323, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3798, 23, 329, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3799, 23, 332, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3800, 23, 321, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3801, 23, 334, 'pending', '85.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3802, 23, 145, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3803, 23, 337, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3804, 23, 336, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3805, 23, 325, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3806, 23, 327, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3807, 23, 338, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3808, 23, 320, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3809, 23, 328, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3810, 23, 335, 'graded', '85.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3811, 23, 333, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3812, 23, 324, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3813, 23, 322, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-22 16:01:49', '2026-09-22 16:01:49'),
(3814, 8, 339, 'graded', '60.00', '', NULL, NULL, NULL, '2026-09-23 02:08:28', '2026-09-23 08:13:34'),
(3820, 8, 340, 'late', '75.00', '', NULL, NULL, NULL, '2026-09-23 02:08:28', '2026-09-23 08:13:34'),
(3827, 8, 341, 'pending', '0.00', '', NULL, NULL, NULL, '2026-09-23 02:08:28', '2026-09-23 08:13:34'),
(3847, 9, 339, 'graded', '60.00', 'folder evidence belum ada', NULL, NULL, NULL, '2026-09-23 06:11:42', '2026-09-23 09:17:01'),
(3853, 9, 340, 'graded', '80.00', '', NULL, NULL, NULL, '2026-09-23 06:11:42', '2026-09-23 09:17:01'),
(3860, 9, 341, 'pending', NULL, '', NULL, NULL, NULL, '2026-09-23 06:11:42', '2026-09-23 09:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(190) NOT NULL DEFAULT '',
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','dosen','mahasiswa') NOT NULL DEFAULT 'dosen',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `student_id`, `username`, `email`, `password_hash`, `role`, `is_active`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'admin', 'admin@localhost', '$2y$12$fCFXnk/DAtCLc5Z9zkHv0.ORfxVX18f0Ytgo8Dw1k2pLF0SKLDzYe', 'admin', 1, '2026-09-23 19:10:47', '2026-09-03 16:12:06', '2026-09-24 02:10:47'),
(2, NULL, 'dosen', 'dosen@localhost', '$2y$12$P8Abf1fitdL1iAfcoQd8CO/bchazwPIDozDDeupRGPHKddZv3igCq', 'dosen', 1, '2026-09-22 23:25:51', '2026-09-03 16:12:06', '2026-09-23 06:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_class_access`
--

CREATE TABLE `user_class_access` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_class_access`
--

INSERT INTO `user_class_access` (`user_id`, `class_id`, `created_at`) VALUES
(2, 4, '2026-09-23 06:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `preference_key` varchar(100) NOT NULL,
  `preference_value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `preference_key`, `preference_value`, `created_at`, `updated_at`) VALUES
(1, 1, 'active_class_id', '3', '2026-09-03 16:13:33', '2026-09-24 02:12:20'),
(1441, 2, 'active_class_id', '4', '2026-09-23 06:26:02', '2026-09-23 06:26:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_user` (`user_id`),
  ADD KEY `idx_log_class_created` (`class_id`,`created_at`),
  ADD KEY `idx_log_type` (`type`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_attendance` (`enrollment_id`,`meeting`),
  ADD UNIQUE KEY `unique_attendance` (`enrollment_id`,`meeting`),
  ADD KEY `idx_attendance_meeting` (`meeting`),
  ADD KEY `idx_attendance_status` (`status`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_class_identity` (`course_id`,`name`,`academic_year`),
  ADD KEY `idx_class_program` (`program_id`),
  ADD KEY `idx_class_course` (`course_id`),
  ADD KEY `idx_class_period` (`academic_year`,`semester`);

--
-- Indexes for table `class_enrollments`
--
ALTER TABLE `class_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_class_student` (`class_id`,`student_id`),
  ADD UNIQUE KEY `uq_class_pc` (`class_id`,`pc`),
  ADD KEY `fk_enrollment_student` (`student_id`),
  ADD KEY `idx_enrollment_status` (`registration_status`),
  ADD KEY `idx_enrollment_class` (`class_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_course_program` (`program_id`),
  ADD KEY `idx_course_code` (`code`),
  ADD KEY `idx_course_name` (`name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_event_class_date` (`class_id`,`event_date`),
  ADD KEY `idx_event_type` (`type`);

--
-- Indexes for table `live_quiz_answers`
--
ALTER TABLE `live_quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_live_answer` (`player_id`,`question_id`),
  ADD KEY `idx_live_answer_session_question` (`session_id`,`question_id`),
  ADD KEY `fk_live_answer_question` (`question_id`);

--
-- Indexes for table `live_quiz_players`
--
ALTER TABLE `live_quiz_players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_live_player` (`session_id`,`enrollment_id`),
  ADD KEY `idx_live_player_rank` (`session_id`,`score`,`correct_count`),
  ADD KEY `fk_live_player_enrollment` (`enrollment_id`);

--
-- Indexes for table `live_quiz_sessions`
--
ALTER TABLE `live_quiz_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_live_join_code` (`join_code`),
  ADD KEY `idx_live_quiz` (`quiz_id`,`status`),
  ADD KEY `idx_live_class` (`class_id`,`status`),
  ADD KEY `fk_live_session_creator` (`created_by`),
  ADD KEY `fk_live_session_question` (`current_question_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_program_code` (`code`),
  ADD KEY `idx_program_name` (`name`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_quizzes_task` (`task_id`),
  ADD KEY `fk_quizzes_creator` (`created_by`),
  ADD KEY `idx_quiz_class_status` (`class_id`,`status`),
  ADD KEY `idx_quiz_availability` (`available_from`,`available_until`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_quiz_answer` (`attempt_id`,`question_id`),
  ADD KEY `idx_quiz_answer_question` (`question_id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_quiz_attempt_no` (`quiz_id`,`enrollment_id`,`attempt_no`),
  ADD KEY `idx_quiz_attempt_status` (`quiz_id`,`status`),
  ADD KEY `idx_quiz_attempt_student` (`enrollment_id`,`started_at`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_quiz_question_order` (`quiz_id`,`sort_order`,`id`),
  ADD KEY `idx_quiz_question_type` (`question_type`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `special_activities`
--
ALTER TABLE `special_activities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollment_id` (`enrollment_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD KEY `idx_student_name` (`name`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_task_class_order` (`class_id`,`sort_order`),
  ADD KEY `idx_task_due` (`due_date`);

--
-- Indexes for table `task_records`
--
ALTER TABLE `task_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_task_record` (`task_id`,`enrollment_id`),
  ADD KEY `fk_task_record_enrollment` (`enrollment_id`),
  ADD KEY `idx_task_record_status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `uq_user_student` (`student_id`),
  ADD KEY `idx_user_role` (`role`),
  ADD KEY `idx_user_active` (`is_active`);

--
-- Indexes for table `user_class_access`
--
ALTER TABLE `user_class_access`
  ADD PRIMARY KEY (`user_id`,`class_id`),
  ADD KEY `fk_access_class` (`class_id`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_user_preference` (`user_id`,`preference_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2060;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `class_enrollments`
--
ALTER TABLE `class_enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_quiz_answers`
--
ALTER TABLE `live_quiz_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_quiz_players`
--
ALTER TABLE `live_quiz_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `live_quiz_sessions`
--
ALTER TABLE `live_quiz_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `special_activities`
--
ALTER TABLE `special_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `task_records`
--
ALTER TABLE `task_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4735;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1560;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `fk_log_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_log_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_attendance_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `class_enrollments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `fk_classes_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_classes_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `class_enrollments`
--
ALTER TABLE `class_enrollments`
  ADD CONSTRAINT `fk_enrollment_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enrollment_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_courses_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live_quiz_answers`
--
ALTER TABLE `live_quiz_answers`
  ADD CONSTRAINT `fk_live_answer_player` FOREIGN KEY (`player_id`) REFERENCES `live_quiz_players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_live_answer_question` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_live_answer_session` FOREIGN KEY (`session_id`) REFERENCES `live_quiz_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live_quiz_players`
--
ALTER TABLE `live_quiz_players`
  ADD CONSTRAINT `fk_live_player_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `class_enrollments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_live_player_session` FOREIGN KEY (`session_id`) REFERENCES `live_quiz_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live_quiz_sessions`
--
ALTER TABLE `live_quiz_sessions`
  ADD CONSTRAINT `fk_live_session_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_live_session_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_live_session_question` FOREIGN KEY (`current_question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_live_session_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `fk_quizzes_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_quizzes_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_quizzes_task` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `fk_quiz_answer_attempt` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_quiz_answer_question` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `fk_quiz_attempt_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `class_enrollments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_quiz_attempt_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `fk_quiz_question_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `special_activities`
--
ALTER TABLE `special_activities`
  ADD CONSTRAINT `fk_special_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `class_enrollments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_tasks_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_records`
--
ALTER TABLE `task_records`
  ADD CONSTRAINT `fk_task_record_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `class_enrollments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_task_record_task` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_class_access`
--
ALTER TABLE `user_class_access`
  ADD CONSTRAINT `fk_access_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_access_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `fk_preference_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
