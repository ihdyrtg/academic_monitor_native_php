SET NAMES utf8mb4;

INSERT INTO settings (setting_key, setting_value) VALUES
('institution', 'UIN Sjech M. Djamil Djambek Bukittinggi'),
('default_lecturer', 'Dashboard monitoring dosen'),
('default_pass_threshold', '60'),
('trend_drop_threshold', '10'),
('siakad_headers', 'nim,nama,tugas,uts,uas,nilai_akhir,nilai_huruf')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

INSERT INTO programs (id, code, name, faculty) VALUES
(1, 'PTIK', 'Pendidikan Teknik Informatika dan Komputer', '')
ON DUPLICATE KEY UPDATE code = VALUES(code), name = VALUES(name), faculty = VALUES(faculty);

INSERT INTO courses (id, program_id, code, name, credits) VALUES
(1, 1, '', 'Pemrograman Web / PHP & MySQL', 3)
ON DUPLICATE KEY UPDATE program_id = VALUES(program_id), code = VALUES(code), name = VALUES(name), credits = VALUES(credits);

INSERT INTO classes (id, program_id, course_id, name, semester, academic_year, target, meetings, lecturer, pass_threshold) VALUES
(1, 1, 1, 'PTIK 5F', '5', '2026/2027', 47, 16, 'Dashboard monitoring dosen', 60)
ON DUPLICATE KEY UPDATE program_id = VALUES(program_id), course_id = VALUES(course_id), name = VALUES(name), semester = VALUES(semester), academic_year = VALUES(academic_year), target = VALUES(target), meetings = VALUES(meetings), lecturer = VALUES(lecturer), pass_threshold = VALUES(pass_threshold);

INSERT INTO students (id, nim, name, email, phone) VALUES
(1, '2524246', '', '', ''),
(2, '2524241', '', '', ''),
(3, '2524224', '', '', ''),
(4, '2524238', '', '', ''),
(5, '2524225', '', '', ''),
(6, '2524218', '', '', ''),
(7, '2524234', '', '', ''),
(8, '2524248', '', '', ''),
(9, '2524229', '', '', ''),
(10, '2524245', '', '', ''),
(11, '2524230', '', '', ''),
(12, '2524244', '', '', ''),
(13, '2524212', '', '', ''),
(14, '2524231', '', '', ''),
(15, '2523128', '', '', ''),
(16, '2524233', '', '', ''),
(17, '2524228', '', '', ''),
(18, '2524217', '', '', ''),
(19, '2524219', '', '', ''),
(20, '2524235', '', '', ''),
(21, '2524227', '', '', ''),
(22, '2524223', '', '', ''),
(23, '2524215', '', '', ''),
(24, '2524001', '', '', ''),
(25, '2524232', '', '', ''),
(26, '2524239', '', '', ''),
(27, '2524221', '', '', ''),
(28, '2524220', '', '', ''),
(29, '2524216', '', '', ''),
(30, '2524240', '', '', ''),
(31, '2524237', '', '', '')
ON DUPLICATE KEY UPDATE name = VALUES(name), email = VALUES(email), phone = VALUES(phone);

INSERT INTO class_enrollments (id, class_id, student_id, registration_status, payment_status, gpa, target_gpa, pc, github_url, colab_url, drive_url, note) VALUES
(1, 1, 1, 'Aktif', 'Lunas', NULL, NULL, 'PC01', 'https://github.com/alahamnati5-web/kursusku', NULL, NULL, ''),
(2, 1, 2, 'Aktif', 'Lunas', NULL, NULL, 'PC02', 'https://github.com/gevimelitas-design/kursusku-prototype', NULL, NULL, ''),
(3, 1, 3, 'Aktif', 'Lunas', NULL, NULL, 'PC03', 'https://github.com/atinisa17-blip/kursusku-prototype', NULL, NULL, ''),
(4, 1, 4, 'Aktif', 'Lunas', NULL, NULL, 'PC04', 'https://github.com/mawarhutauruk74-dev/kursusku-prototype', NULL, NULL, ''),
(5, 1, 5, 'Aktif', 'Lunas', NULL, NULL, 'PC05', 'https://github.com/husnaraudhatul050-lab/kursusku-prototype', NULL, NULL, ''),
(6, 1, 6, 'Aktif', 'Lunas', NULL, NULL, 'PC06', NULL, NULL, NULL, ''),
(7, 1, 7, 'Aktif', 'Lunas', NULL, NULL, 'PC07', 'https://github.com/mardatulrahmi/kursusku-prototype', NULL, NULL, ''),
(8, 1, 8, 'Aktif', 'Lunas', NULL, NULL, 'PC08', NULL, NULL, NULL, ''),
(9, 1, 9, 'Aktif', 'Lunas', NULL, NULL, 'PC15', 'https://github.com/mrasuliakbar24/kursusku', NULL, NULL, ''),
(10, 1, 10, 'Aktif', 'Lunas', NULL, NULL, 'PC14', 'https://github.com/HABIBIMARAY/kursus-ku', NULL, NULL, ''),
(11, 1, 11, 'Aktif', 'Lunas', NULL, NULL, 'PC13', NULL, NULL, NULL, ''),
(12, 1, 12, 'Aktif', 'Lunas', NULL, NULL, 'PC12', 'https://github.com/yuliazikra145/kursusku-prototype', NULL, NULL, ''),
(13, 1, 13, 'Aktif', 'Lunas', NULL, NULL, 'PC11', 'https://github.com/divarahmadani345/kursusku-prototype', NULL, NULL, ''),
(14, 1, 14, 'Aktif', 'Lunas', NULL, NULL, 'PC10', 'https://github.com/avilavidella2005-source/kursusku-prototype', NULL, NULL, ''),
(15, 1, 15, 'Aktif', 'Lunas', NULL, NULL, 'PC09', NULL, NULL, NULL, ''),
(16, 1, 16, 'Aktif', 'Lunas', NULL, NULL, 'PC17', NULL, NULL, NULL, ''),
(17, 1, 17, 'Aktif', 'Lunas', NULL, NULL, 'PC18', 'https://github.com/dwifayraj-228/kursusku-prototype', NULL, NULL, ''),
(18, 1, 18, 'Aktif', 'Lunas', NULL, NULL, 'PC19', 'https://github.com/n4yenayeee/kursusku-prototype/tree/main', NULL, NULL, ''),
(19, 1, 19, 'Aktif', 'Lunas', NULL, NULL, 'PC20', 'https://github.com/iqbal-hsb/kursusku-prototype', NULL, NULL, ''),
(20, 1, 20, 'Aktif', 'Lunas', NULL, NULL, 'PC21', 'https://github.com/putrinirwana300/kursusku-prototype', NULL, NULL, ''),
(21, 1, 21, 'Aktif', 'Lunas', NULL, NULL, 'PC24', 'https://github.com/dynakhairunnysa-star/kursusku-prototype', NULL, NULL, ''),
(22, 1, 22, 'Aktif', 'Lunas', NULL, NULL, 'PC31', NULL, NULL, NULL, ''),
(23, 1, 23, 'Aktif', 'Lunas', NULL, NULL, 'PC30', NULL, NULL, NULL, ''),
(24, 1, 24, 'Aktif', 'Lunas', NULL, NULL, 'PC28', NULL, NULL, NULL, ''),
(25, 1, 25, 'Aktif', 'Lunas', NULL, NULL, 'PC27', NULL, NULL, NULL, ''),
(26, 1, 26, 'Aktif', 'Lunas', NULL, NULL, 'PC26', NULL, NULL, NULL, ''),
(27, 1, 27, 'Aktif', 'Lunas', NULL, NULL, 'PC25', NULL, NULL, NULL, ''),
(28, 1, 28, 'Aktif', 'Lunas', NULL, NULL, 'PC34', 'https://github.com/imaasmara5-boop/kursusku-prototype', NULL, NULL, ''),
(29, 1, 29, 'Aktif', 'Lunas', NULL, NULL, 'PC36', 'https://github.com/ulfadhil10/kursusku-prototype', NULL, NULL, ''),
(30, 1, 30, 'Aktif', 'Lunas', NULL, NULL, 'PC38', NULL, NULL, NULL, ''),
(31, 1, 31, 'Aktif', 'Lunas', NULL, NULL, 'PC39', NULL, NULL, NULL, '')
ON DUPLICATE KEY UPDATE registration_status = VALUES(registration_status), payment_status = VALUES(payment_status), pc = VALUES(pc), github_url = VALUES(github_url);

INSERT INTO tasks (id, class_id, name, type, weight, max_score, meeting, due_date, description, sort_order) VALUES
(1, 1, 'Tugas 1', 'Tugas Harian', 10, 100, 2, NULL, '', 10),
(2, 1, 'Tugas 2', 'Tugas Harian', 10, 100, 4, NULL, '', 20),
(3, 1, 'Tugas 3', 'Tugas Harian', 10, 100, 6, NULL, '', 30),
(4, 1, 'Tugas 4', 'Tugas Harian', 10, 100, 10, NULL, '', 40),
(5, 1, 'Tugas 5', 'Tugas Harian', 10, 100, 12, NULL, '', 50),
(6, 1, 'UTS', 'UTS', 20, 100, 8, NULL, '', 60),
(7, 1, 'UAS', 'UAS', 30, 100, 16, NULL, '', 70)
ON DUPLICATE KEY UPDATE name = VALUES(name), type = VALUES(type), weight = VALUES(weight), max_score = VALUES(max_score), meeting = VALUES(meeting), sort_order = VALUES(sort_order);

INSERT INTO users (id, student_id, username, email, password_hash, role, is_active) VALUES
(1, NULL, 'admin', 'admin@localhost', '$2y$12$fCFXnk/DAtCLc5Z9zkHv0.ORfxVX18f0Ytgo8Dw1k2pLF0SKLDzYe', 'admin', 1),
(2, NULL, 'dosen', 'dosen@localhost', '$2y$12$ojEnW81ELbS1wrmetSqFtu7OHPurEertnOC7ZA1/onKSLFbOMC05K', 'dosen', 1)
ON DUPLICATE KEY UPDATE email = VALUES(email), role = VALUES(role), is_active = VALUES(is_active);

INSERT IGNORE INTO user_class_access (user_id, class_id) VALUES (2, 1);

INSERT INTO activity_logs (class_id, user_id, type, text) VALUES
(1, 1, 'Sistem', 'Database dibuat dari dashboard HTML PTIK 5F dan seluruh data awal dipertahankan.');