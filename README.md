# Academic Monitor — PHP Native + MySQL

Versi ini merupakan refactor dari `dashboard_monitoring_multi_kelas_v3.html` menjadi aplikasi **PHP Native** yang terstruktur, menggunakan **MySQL/MariaDB**, **PDO**, autentikasi session, role-based access, CSRF, dan CRUD database.

File HTML sumber tetap disimpan **utuh tanpa diubah** pada:

`legacy/dashboard_monitoring_multi_kelas_v3.html`

## Fitur yang dipertahankan

- Multi Program Studi, Mata Kuliah, dan Kelas.
- Profil mahasiswa dan status registrasi/pembayaran.
- IPK sementara dan target IPK.
- GitHub, Google Colab, dan Google Drive.
- Presensi H/I/S/A per pertemuan.
- Tugas, laporan, praktikum, proyek, UTS, UAS, bobot, deadline, status, nilai, catatan.
- Link GitHub/Colab/Drive global mahasiswa dan link khusus per tugas.
- Kalender akademik dan deadline tugas otomatis.
- Analitik tren pemahaman kelas.
- Prediksi kelulusan berbasis bobot nilai tersisa.
- KKN/MBKM/Magang/Studi Independen/Pertukaran.
- Denah PC01–PC40 dengan drag-and-drop.
- Portal mahasiswa terbatas.
- Log aktivitas.
- Export mahasiswa, presensi, nilai, dan CSV SIAKAD.
- Backup JSON.
- Import CSV mahasiswa.
- Migrasi Backup JSON dari dashboard HTML/localStorage lama.

## Fitur baru

- Login server-side.
- Role `admin`, `dosen`, dan `mahasiswa`.
- Halaman administrasi khusus.
- CRUD user dan role.
- Hak akses dosen per kelas.
- Akun mahasiswa dapat dihubungkan langsung dengan NIM.
- Database relasional dan foreign key.
- Prepared statement PDO.
- Proteksi CSRF.
- Session cookie `HttpOnly` + `SameSite=Lax`.
- Audit log yang menyimpan pengguna pelaku perubahan.
- Struktur kode dipisahkan menjadi App / Views / Public / Database / Scripts.
- Legacy importer agar data dashboard HTML lama tidak hilang.

## Struktur Folder

```text
academic_monitor_native_php/
├── app/
│   ├── AnalyticsService.php
│   ├── Auth.php
│   ├── bootstrap.php
│   ├── Config.php
│   ├── Csrf.php
│   ├── Database.php
│   ├── helpers.php
│   ├── LegacyImporter.php
│   └── Repository.php
├── database/
│   ├── schema.sql
│   └── seed.sql
├── legacy/
│   └── dashboard_monitoring_multi_kelas_v3.html
├── public/
│   ├── assets/
│   ├── .htaccess
│   ├── action.php
│   ├── admin.php
│   ├── dashboard.php
│   ├── export.php
│   ├── import_legacy.php
│   ├── index.php
│   ├── login.php
│   └── logout.php
├── scripts/
│   └── install.php
├── views/
│   ├── admin/
│   ├── pages/
│   └── partials/
├── .env.example
├── .gitignore
├── index.php
└── README.md
```

## Requirement

- PHP 8.1 atau lebih baru.
- Extension `pdo_mysql`.
- MySQL 8+ atau MariaDB 10.5+.
- Apache/Nginx atau PHP built-in server.

## Instalasi dengan XAMPP / Laragon

1. Salin folder `academic_monitor_native_php` ke `htdocs` atau `www`.
2. Copy `.env.example` menjadi `.env`.
3. Atur koneksi database pada `.env`.

Contoh XAMPP:

```ini
APP_URL=http://localhost/academic_monitor_native_php/public
DB_HOST=127.0.0.1
DB_PORT=3306
DB_NAME=academic_monitor
DB_USER=root
DB_PASS=
```

4. Buka terminal pada folder project.
5. Jalankan:

```bash
php scripts/install.php
```

6. Buka:

```text
http://localhost/academic_monitor_native_php/public/
```

## Menjalankan dengan PHP Built-in Server

Pastikan MySQL sudah berjalan dan `.env` telah benar.

```bash
php scripts/install.php
php -S 127.0.0.1:8000 -t public
```

Ubah `APP_URL` menjadi:

```ini
APP_URL=http://127.0.0.1:8000
```

Kemudian buka:

```text
http://127.0.0.1:8000
```

## Akun Awal

| Role | Username | Password |
|---|---|---|
| Admin | `admin` | `Admin123!` |
| Dosen | `dosen` | `Dosen123!` |

**Wajib:** ganti password default setelah login.

## Database Seed

`database/seed.sql` berisi data awal dari HTML sumber:

- UIN Sjech M. Djamil Djambek Bukittinggi.
- Prodi PTIK.
- Mata Kuliah `Pemrograman Web / PHP & MySQL`.
- Kelas `PTIK 5F`.
- Tahun akademik `2026/2027`.
- Target 47 mahasiswa.
- 16 pertemuan.
- Seluruh 31 NIM yang terdapat pada HTML.
- Posisi PC asli.
- Seluruh link GitHub asli yang terdapat pada HTML.
- Tugas 1–5, UTS, dan UAS beserta bobot awal.

Kolom nama yang memang kosong pada file HTML **tetap kosong**. Sistem menampilkannya sebagai `Nama belum diisi`, sama dengan perilaku dashboard lama.

## Memindahkan Data localStorage yang Sudah Anda Edit

Data yang pernah diedit saat membuka file HTML tidak selalu berada di source HTML; data tersebut dapat berada di `localStorage` browser.

Agar data tersebut tidak hilang:

1. Buka dashboard HTML lama pada browser yang masih memiliki datanya.
2. Klik **Backup JSON**.
3. Login sebagai Admin pada versi PHP.
4. Buka **Administrasi Sistem → Migrasi Backup Lama**.
5. Upload file JSON tadi.
6. Importer akan memetakan data ke MySQL.

Data yang dimigrasikan:

- Settings.
- Prodi.
- Mata kuliah.
- Kelas.
- Mahasiswa.
- Status registrasi dan pembayaran.
- IPK/target IPK.
- PC.
- GitHub/Colab/Drive.
- Presensi.
- Tugas.
- Nilai dan catatan.
- Link khusus tugas.
- Kalender.
- KKN/MBKM.
- Log aktivitas.

## Role

### Admin

Memiliki akses penuh:

- Dashboard semua kelas.
- User & role.
- Prodi.
- Mata kuliah.
- Kelas.
- Settings.
- Migrasi legacy.
- Seluruh CRUD dashboard.

### Dosen

Hanya dapat membuka kelas yang diberikan oleh Admin melalui `user_class_access`.

Dosen dapat:

- Kelola mahasiswa kelas.
- Presensi.
- Tugas/nilai.
- Kalender.
- KKN/MBKM.
- Denah.
- Portal simulasi mahasiswa.
- Export.

### Mahasiswa

Akun harus dihubungkan dengan data mahasiswa pada menu **Admin → Users & Roles**.

Mahasiswa hanya diarahkan ke **Dashboard Saya** dan hanya melihat enrollment miliknya pada kelas yang diikutinya.

## Catatan Pengembangan

Project sengaja tetap PHP Native tanpa framework agar mudah dipelajari dan dikembangkan. Arsitektur sudah dipisah sehingga nanti mudah ditambahkan:

- API REST.
- AJAX penuh.
- upload file tugas.
- notifikasi WhatsApp/email.
- integrasi SIAKAD.
- integrasi OAuth Google/GitHub.
- refresh token/API mobile.
- pagination server-side.
- permission lebih granular.
- dashboard pimpinan/prodi.
- multi semester.
- database migration versioning.
- PHPUnit.
