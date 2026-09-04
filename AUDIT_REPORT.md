# Audit Project Academic Monitor PHP Native

## Status
Audit dilakukan pada project PHP Native + MySQL yang diberikan.

## Perbaikan bug Presensi
Akar masalah ada pada UI presensi:
- `views/pages/attendance.php` menggunakan `label + radio hidden`.
- `public/assets/js/app.js` tidak memiliki event handler untuk mengubah status visual ketika radio dipilih.
- CSS aktif lama bergantung pada class server-side sehingga klik pengguna tidak terlihat aktif sebelum submit.

Perbaikan:
1. Tombol Hadir/Izin/Sakit/Alpa diubah menjadi `<button type="button">`.
2. Nilai status disimpan ke hidden input `statuses[enrollment_id]`.
3. JavaScript mengubah tombol aktif secara langsung.
4. Rekap Hadir/Izin/Sakit/Alpa/Belum diperbarui langsung di browser.
5. Data tetap dikirim melalui action `attendance.save`.
6. Backend Repository tetap menggunakan transaksi dan UPSERT.
7. Tabel `attendance` sudah memiliki `UNIQUE KEY uq_attendance (enrollment_id, meeting)`.

File yang diperbarui:
- `views/pages/attendance.php`
- `public/assets/js/app.js`
- `public/assets/css/app.css`

## Hasil audit struktur

### Baik / sudah benar
- PDO menggunakan prepared statements dan `ATTR_EMULATE_PREPARES=false`.
- Password memakai `password_hash()` / `password_verify()`.
- Session ID diregenerasi setelah login.
- Cookie session `HttpOnly`, `SameSite=Lax`, dan `Secure` otomatis saat HTTPS.
- CSRF diterapkan pada form POST.
- Role tersedia: `admin`, `dosen`, `mahasiswa`.
- Akses kelas dosen diperiksa melalui `user_class_access`.
- Mahasiswa dibatasi ke kelas yang memang diikuti.
- Export memeriksa role dan akses kelas.
- Resource URL GitHub/Colab/Drive divalidasi berdasarkan host.
- CSV escape memiliki mitigasi formula injection.
- Foreign key dan unique constraint database cukup baik.
- Presensi menggunakan unique `(enrollment_id, meeting)`.
- Tugas/nilai menggunakan unique `(task_id, enrollment_id)`.
- CRUD penting memakai Repository dan transaction pada operasi multi-query.

### Temuan Prioritas Tinggi
1. **Password akun seed masih default**
   - `admin / Admin123!`
   - `dosen / Dosen123!`
   - Wajib diganti setelah instalasi.
   - Untuk production sebaiknya jangan menyimpan akun default di seed production.

2. **Belum ada rate limiting login**
   - Login dapat dicoba berulang kali.
   - Tambahkan pembatasan percobaan berdasarkan username + IP atau lock sementara.

### Temuan Prioritas Menengah
3. **Belum ada password policy pada Admin User CRUD**
   - Sistem menerima password baru tanpa syarat minimal yang kuat.
   - Disarankan minimal 10-12 karakter.

4. **Error migrasi legacy dapat ditampilkan langsung**
   - `import_legacy.php` menampilkan `$exception->getMessage()`.
   - Pada production lebih aman tampilkan pesan umum dan log detail di server.

5. **Belum ada Content-Security-Policy**
   - Header keamanan dasar sudah tersedia.
   - CSP dapat ditambahkan setelah inline style/script dirapikan.

6. **Audit log belum mencatat detail before/after**
   - Sudah ada log aktivitas, tetapi belum cocok untuk audit perubahan penuh.
   - Untuk production dapat ditambah `entity_type`, `entity_id`, `old_values`, `new_values`, `ip_address`.

### Temuan Prioritas Rendah / Pengembangan
7. Tambahkan pagination pada mahasiswa/log jika data besar.
8. Tambahkan database migration/versioning agar update schema aman.
9. Tambahkan automated test untuk Auth, Repository, presensi, task record, dan access control.
10. Tambahkan backup database terjadwal di server production.

## Audit Modul

### Login & Auth
Status: BAIK, perlu rate limiting dan password policy.

### CRUD Akademik
Status: BAIK.
Program, mata kuliah, kelas, mahasiswa, users memakai prepared query melalui Repository.

### Presensi
Status setelah patch: DIPERBAIKI.
Alur:
`attendance.php -> statuses[enrollment_id] -> action.php attendance.save -> Repository::saveAttendance() -> MySQL`

### Tugas & Nilai
Status: BAIK.
Mendukung status, score, note, dan link GitHub/Colab/Drive per tugas.

### Admin
Status: BAIK.
Role admin membatasi menu user/master/settings.

### Database
Status: BAIK.
Foreign key, unique constraint, dan InnoDB telah digunakan.

## Pemeriksaan Sintaks
- Semua file `.php`: lolos `php -l`.
- `public/assets/js/app.js`: lolos `node --check`.

## Uji Presensi di Laragon
1. Ganti project lama dengan project hasil patch atau copy 3 file patch.
2. Restart Apache Laragon.
3. Login sebagai admin/dosen.
4. Buka Presensi.
5. Klik Hadir -> tombol hijau.
6. Klik Izin -> tombol biru dan Hadir nonaktif.
7. Klik Sakit -> tombol kuning.
8. Klik Alpa -> tombol merah.
9. Ringkasan di atas harus berubah langsung.
10. Klik Simpan Presensi.
11. Refresh halaman.
12. Status harus tetap sama dari database.

## Database check
Jalankan:
```sql
SHOW CREATE TABLE attendance;
```

Project ini sudah memiliki:
```sql
UNIQUE KEY uq_attendance (enrollment_id, meeting)
```
sehingga `ON DUPLICATE KEY UPDATE` pada Repository dapat bekerja dengan benar.
