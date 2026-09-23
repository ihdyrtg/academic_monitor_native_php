<div align="center">

<img src="public/assets/images/logo.png" alt="Academic Monitor Logo" width="110">

# 🎓 Academic Monitor

### Dashboard Monitoring Akademik Multi-Kelas berbasis Native PHP & MySQL

Sistem monitoring akademik untuk membantu dosen mengelola kelas, mahasiswa, presensi, tugas, nilai, analitik perkembangan, kegiatan KKN/MBKM, denah tempat duduk, dan portal progres mahasiswa dalam satu dashboard terintegrasi.

[![PHP](https://img.shields.io/badge/PHP-8.1%2B-777BB4?logo=php&logoColor=white)](https://www.php.net/)
[![MySQL](https://img.shields.io/badge/MySQL%20%2F%20MariaDB-Database-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Native PHP](https://img.shields.io/badge/Framework-Native%20PHP-success)](#)
[![Status](https://img.shields.io/badge/Status-Active%20Development-orange)](#)
[![Repository](https://img.shields.io/badge/GitHub-ihdyrtg%2Facademic__monitor__native__php-181717?logo=github)](https://github.com/ihdyrtg/academic_monitor_native_php)

**UIN Sjech M. Djamil Djambek Bukittinggi**

</div>

---

## 📌 Tentang Project

**Academic Monitor** adalah aplikasi web berbasis **Native PHP** dan **MySQL/MariaDB** yang dirancang untuk memusatkan proses monitoring aktivitas akademik mahasiswa.

Aplikasi ini tidak hanya menyimpan data mahasiswa, tetapi juga membantu dosen melihat perkembangan kelas melalui data presensi, tugas, nilai, status akademik, tautan portofolio, analitik performa, indikasi risiko akademik, kalender kegiatan, hingga aktivitas khusus seperti **KKN/MBKM**.

Project ini dikembangkan dengan struktur modular sederhana sehingga tetap mudah dipelajari, dipelihara, dan dikembangkan tanpa ketergantungan pada framework PHP besar.

---

## ✨ Fitur Utama

### 🏠 1. Ringkasan Kelas
- Ringkasan informasi kelas aktif.
- Monitoring jumlah mahasiswa dan progres akademik.
- Ringkasan presensi dan penyelesaian tugas.
- Informasi performa dan indikator mahasiswa yang perlu perhatian.

### 🗂️ 2. Master Akademik
- Kelola program studi.
- Kelola mata kuliah.
- Kelola kelas.
- Semester dan tahun akademik.
- Jumlah pertemuan.
- Dosen pengampu.
- Batas minimum kelulusan.

### 👨‍🎓 3. Data Mahasiswa
- NIM dan nama mahasiswa.
- Email dan nomor telepon.
- Status registrasi.
- Status pembayaran.
- IPK dan target IPK.
- Nomor/posisi PC praktikum.
- Catatan mahasiswa.
- Tautan GitHub, Google Colab, dan Google Drive.

### 🗓️ 4. Presensi Perkuliahan
Monitoring presensi setiap pertemuan dengan status:

| Kode | Status |
|---|---|
| `H` | Hadir |
| `I` | Izin |
| `S` | Sakit |
| `A` | Alfa |

Data presensi digunakan sebagai salah satu indikator monitoring perkembangan mahasiswa.

### 📝 5. Tugas & Nilai
- Membuat komponen tugas secara dinamis.
- Menentukan jenis tugas.
- Mengatur bobot penilaian.
- Menentukan nilai maksimum.
- Menghubungkan tugas dengan pertemuan tertentu.
- Menentukan tenggat waktu.
- Menyimpan status pengumpulan.
- Input nilai dan catatan dosen.
- Menyimpan tautan GitHub, Colab, atau Drive untuk setiap tugas.

Status tugas yang didukung:

```text
pending | submitted | graded | late
```

### 📊 6. Analitik & Prediksi Akademik
Academic Monitor memiliki modul analitik untuk membantu membaca perkembangan mahasiswa, antara lain:

- Persentase kehadiran.
- Persentase penyelesaian tugas.
- Nilai berbobot.
- Estimasi nilai akhir.
- Nilai terbaik yang masih mungkin diperoleh.
- Nilai minimum yang dibutuhkan untuk mencapai batas kelulusan.
- Tren nilai antar-komponen penilaian.
- Deteksi penurunan performa kelas.
- Identifikasi mahasiswa dengan indikator risiko.
- Pemeriksaan kelengkapan data mahasiswa (*data health*).

> **Catatan:** prediksi pada aplikasi merupakan indikator monitoring berbasis data yang tersedia, bukan keputusan akademik otomatis. Keputusan akhir tetap berada pada dosen/pengelola akademik.

### ⚠️ 7. Indikator Risiko Mahasiswa
Sistem dapat menampilkan alasan mahasiswa perlu mendapat perhatian, misalnya:

- Kehadiran di bawah ambang tertentu.
- Status registrasi tidak aktif.
- Status pembayaran belum sesuai.
- Prediksi nilai berada pada kategori berisiko.
- Terdapat tugas yang terlambat.

### 📅 8. Kalender Akademik
Kelola berbagai agenda kelas seperti:

- Kuliah.
- Ujian.
- Deadline.
- Bimbingan.
- Kegiatan akademik lainnya.

### 🌱 9. Monitoring KKN / MBKM
- Jenis kegiatan.
- Status kegiatan.
- Lokasi.
- Pembimbing.
- Persentase progres.
- Catatan perkembangan.

### 💺 10. Denah Duduk / Posisi PC
Academic Monitor mendukung pencatatan posisi mahasiswa berdasarkan PC/tempat duduk sehingga dosen dapat lebih mudah melakukan monitoring kegiatan praktikum di laboratorium.

### 🎓 11. Portal Mahasiswa
Mahasiswa dapat melihat perkembangan akademiknya melalui portal khusus menggunakan **NIM** tanpa harus masuk ke dashboard dosen.

Portal dapat menampilkan data yang relevan seperti:

- Identitas akademik.
- Presensi.
- Tugas dan nilai.
- Progres akademik.
- Tautan portofolio.

### 🧾 12. Log Aktivitas
Perubahan dan aktivitas penting dapat direkam sebagai histori untuk membantu pelacakan proses pengelolaan kelas.

### ⚙️ 13. Pengaturan Sistem
Beberapa parameter akademik dapat disesuaikan, termasuk:

- Nama institusi.
- Dosen default.
- Batas kelulusan.
- Ambang penurunan tren.
- Pengaturan data akademik lainnya.

### 🔄 14. Import Data Legacy
Aplikasi memiliki dukungan migrasi data dari versi dashboard HTML/JSON lama ke struktur database relasional.

---

## 👥 Role Pengguna

Database mendukung tiga role utama:

| Role | Fungsi Umum |
|---|---|
| `admin` | Pengelolaan sistem dan data akademik |
| `dosen` | Monitoring dan pengelolaan kelas |
| `mahasiswa` | Akses data mahasiswa yang diizinkan |

Selain role pengguna di atas, tersedia juga **Portal Mahasiswa berbasis NIM** untuk melihat progres tanpa login dashboard staf.

---

## 🧠 Cara Kerja Sederhana

Bayangkan aplikasi ini seperti **buku kontrol akademik digital**.

Pada buku kontrol biasa, dosen harus membuka beberapa catatan berbeda untuk mengetahui presensi, tugas, nilai, atau mahasiswa yang tertinggal. Academic Monitor menggabungkan catatan-catatan tersebut ke satu sistem.

```text
Data Mahasiswa
      │
      ├── Presensi
      ├── Tugas
      ├── Nilai
      ├── Portofolio
      ├── KKN / MBKM
      │
      ▼
Academic Monitor
      │
      ├── Dashboard
      ├── Analitik
      ├── Prediksi
      └── Indikator Risiko
```

Dengan demikian, dashboard bukan sekadar tempat menyimpan data, tetapi menjadi alat bantu dosen untuk membaca kondisi kelas secara lebih cepat.

---

## 🛠️ Teknologi

| Komponen | Teknologi |
|---|---|
| Backend | PHP 8.1+ |
| Arsitektur | Native PHP modular |
| Database | MySQL / MariaDB |
| Database Access | PDO |
| Frontend | HTML5, CSS3, JavaScript |
| Authentication | PHP Session |
| Password | `password_hash()` / `password_verify()` |
| Proteksi Form | CSRF Token |
| Web Server | Apache / Laragon / XAMPP atau server PHP yang sesuai |
| Character Set | UTF-8 / `utf8mb4` |

---

## 📁 Struktur Project

```text
academic_monitor_native_php/
│
├── app/
│   ├── AnalyticsService.php    # Perhitungan analitik akademik
│   ├── Auth.php                # Autentikasi dan otorisasi
│   ├── bootstrap.php           # Bootstrap aplikasi
│   ├── Config.php              # Pembacaan konfigurasi environment
│   ├── Csrf.php                # Proteksi CSRF
│   ├── Database.php            # Koneksi database
│   ├── LegacyImporter.php      # Import/migrasi data dashboard lama
│   ├── Repository.php          # Akses dan manipulasi data
│   └── helpers.php             # Helper aplikasi
│
├── database/
│   ├── schema.sql              # Struktur database
│   └── seed.sql                # Data awal/demo
│
├── legacy/                     # Data / komponen versi sebelumnya
│
├── public/
│   ├── assets/
│   ├── dashboard.php           # Dashboard utama
│   ├── index.php               # Entry point folder public
│   ├── login.php               # Login staf
│   └── portal.php              # Portal mahasiswa
│
├── scripts/                    # Utility / script pendukung
│
├── storage/                    # Data runtime / penyimpanan aplikasi
│
├── views/
│   ├── pages/                  # Halaman dashboard
│   └── partials/               # Layout reusable
│
├── .env.example               # Contoh environment configuration
├── .gitignore
├── .htaccess
├── index.php                   # Entry point root
└── README.md
```

---

## 🗄️ Struktur Data Utama

Database aplikasi mencakup tabel utama berikut:

```text
settings
programs
courses
classes
students
users
class_enrollments
attendance
tasks
task_records
events
special_activities
activity_logs
user_class_access
user_preferences
```

Relasi inti secara sederhana:

```text
Program Studi
    │
    └── Mata Kuliah
          │
          └── Kelas
               │
               ├── Mahasiswa / Enrollment
               │      ├── Presensi
               │      ├── Rekam Tugas
               │      └── KKN / MBKM
               │
               ├── Tugas
               ├── Kalender
               └── Log Aktivitas
```

---

# 🚀 Instalasi Lokal

## 1. Persyaratan

Pastikan komputer memiliki:

- PHP **8.1 atau lebih baru**.
- MySQL atau MariaDB.
- Ekstensi PHP `pdo_mysql` aktif.
- Web server Apache.
- Laragon/XAMPP direkomendasikan untuk penggunaan lokal.
- Git jika ingin melakukan clone repository.

---

## 2. Clone Repository

```bash
git clone https://github.com/ihdyrtg/academic_monitor_native_php.git
cd academic_monitor_native_php
```

Atau unduh repository dalam format ZIP kemudian ekstrak ke folder web server.

Contoh Laragon:

```text
C:\laragon\www\academic_monitor_native_php
```

---

## 3. Buat Database

Buat database baru:

```sql
CREATE DATABASE academic_monitor
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

Kemudian import:

```text
database/schema.sql
```

Jika membutuhkan data awal/demo, import juga:

```text
database/seed.sql
```

> Sebelum menggunakan `seed.sql` pada lingkungan nyata, tinjau kembali data contoh yang ada di dalamnya.

---

## 4. Konfigurasi Environment

Salin file:

```text
.env.example
```

menjadi:

```text
.env
```

Contoh konfigurasi lokal:

```env
APP_ENV=local
APP_DEBUG=false
APP_URL=http://localhost/academic_monitor_native_php/public

DB_HOST=127.0.0.1
DB_PORT=3306
DB_NAME=academic_monitor
DB_USER=root
DB_PASS=

SESSION_NAME=academic_monitor_session
```

Jika menggunakan **Laragon Auto Virtual Host**, `APP_URL` dapat disesuaikan dengan virtual host project Anda.

---

## 5. Pastikan Konfigurasi Database Membaca `.env`

Untuk keamanan, kredensial database **harus dibaca dari `.env` melalui `Config`** dan tidak ditulis langsung (*hard-coded*) di source code.

Konsep konfigurasi yang digunakan:

```php
$host = Config::get('DB_HOST', '127.0.0.1');
$port = Config::get('DB_PORT', '3306');
$name = Config::get('DB_NAME', 'academic_monitor');
$user = Config::get('DB_USER', 'root');
$pass = Config::get('DB_PASS', '');
```

File `.env` telah dimasukkan ke `.gitignore`, sehingga kredensial lokal tidak ikut terdorong ke repository.

---

## 6. Jalankan Aplikasi

Aktifkan Apache dan MySQL melalui Laragon/XAMPP, kemudian akses folder `public` dari browser.

Contoh:

```text
http://localhost/academic_monitor_native_php/public
```

Aplikasi akan mengarahkan pengguna ke halaman login.

---

## 🔐 Autentikasi

Login staf menggunakan:

```text
Username
Password
```

Password disimpan dalam bentuk hash dan diverifikasi menggunakan mekanisme bawaan PHP.

Repository menyediakan data user awal pada `database/seed.sql`, tetapi untuk deployment nyata sangat disarankan untuk:

1. Mengganti seluruh password bawaan.
2. Tidak menggunakan akun demo pada production.
3. Menggunakan password yang kuat dan unik.

---

## 🛡️ Keamanan

Beberapa mekanisme keamanan yang tersedia pada project:

- Session-based authentication.
- Regenerasi session ID setelah login.
- Password verification menggunakan hashing PHP.
- CSRF token untuk request form.
- PDO database connection.
- Native prepared statement pada proses autentikasi dan berbagai operasi data.
- Cookie session `HttpOnly`.
- `SameSite=Lax` untuk cookie session.
- Security headers seperti:
  - `X-Content-Type-Options`.
  - `X-Frame-Options`.
  - `Referrer-Policy`.
  - `Permissions-Policy`.
- `.env` diabaikan oleh Git.

### ⚠️ Sangat Penting

Jangan pernah menyimpan informasi berikut langsung di repository publik:

```text
DB_HOST production
DB_USER production
DB_PASS production
API key
Access token
Private key
Password akun
```

Jika sebuah credential pernah ter-commit ke repository publik, **menghapusnya dari commit terbaru saja tidak cukup**. Credential tersebut harus dianggap telah terekspos dan perlu segera diganti/dirotasi.

---

## 📈 Logika Analitik

### Persentase Presensi

Secara sederhana:

```text
Persentase Kehadiran
= Jumlah Hadir / Jumlah Pertemuan yang Sudah Dicatat × 100%
```

### Nilai Berbobot

```text
Poin Komponen
= Nilai Normalisasi × Bobot Komponen
```

### Prediksi Nilai

Sistem menggunakan nilai yang sudah tersedia dan bobot penilaian yang belum selesai untuk menghasilkan estimasi perkembangan nilai mahasiswa.

Output dapat mencakup:

```text
current_points
remaining_weight
best_possible
needed
estimated
status
```

Analitik ini dimaksudkan sebagai **early-warning system sederhana**, bukan pengganti penilaian akademik dosen.

---

## 🧪 Rubrik Praktikum

Project juga memuat referensi rubrik praktikum dengan komponen:

| Aspek | Bobot |
|---|---:|
| Ketepatan Hasil | 35% |
| Kelengkapan | 25% |
| Kemandirian | 20% |
| Ketepatan Waktu | 15% |
| Inisiatif & Kreativitas | 5% |

Rubrik dapat dikembangkan lebih lanjut sesuai kebutuhan mata kuliah.

---

## 🔄 Migrasi dari Dashboard Lama

Academic Monitor menyediakan `LegacyImporter` untuk membantu migrasi data dari backup dashboard versi HTML/JSON lama.

Jenis data yang dapat dipetakan antara lain:

- Program studi.
- Mata kuliah.
- Kelas.
- Mahasiswa.
- Tugas.
- Presensi.
- Nilai/rekam tugas.
- Kalender kegiatan.
- KKN/MBKM.
- Log aktivitas.

Sebelum migrasi data besar, lakukan backup database terlebih dahulu.

---

## 📸 Screenshot

Tambahkan screenshot aplikasi pada folder, misalnya:

```text
docs/screenshots/
```

Kemudian tampilkan pada README:

```markdown
![Dashboard](docs/screenshots/dashboard.png)
![Presensi](docs/screenshots/presensi.png)
![Tugas dan Nilai](docs/screenshots/tugas-nilai.png)
![Analitik](docs/screenshots/analitik.png)
![Portal Mahasiswa](docs/screenshots/portal-mahasiswa.png)
```

Screenshot yang direkomendasikan:

1. Halaman login.
2. Ringkasan kelas.
3. Data mahasiswa.
4. Presensi.
5. Tugas & nilai.
6. Analitik & prediksi.
7. Denah duduk.
8. Portal mahasiswa.

---

## 🧭 Roadmap Pengembangan

Beberapa pengembangan yang dapat dilakukan selanjutnya:

- [ ] Export laporan ke Excel/PDF.
- [ ] Import mahasiswa dari Excel/CSV.
- [ ] Dashboard lintas semester.
- [ ] Rekap nilai akhir otomatis.
- [ ] Notifikasi mahasiswa berisiko.
- [ ] Grafik tren individu mahasiswa.
- [ ] Audit trail yang lebih lengkap.
- [ ] Reset password melalui antarmuka admin.
- [ ] Backup dan restore database dari dashboard.
- [ ] API internal untuk integrasi aplikasi lain.
- [ ] Peningkatan pengujian otomatis.
- [ ] Hardening keamanan untuk production.

---

## 🤝 Kontribusi

Kontribusi dapat dilakukan melalui alur berikut:

```bash
git checkout -b feature/nama-fitur

git add .
git commit -m "feat: menambahkan nama fitur"
git push origin feature/nama-fitur
```

Selanjutnya buat Pull Request dan jelaskan perubahan yang dilakukan.

Contoh prefix commit:

```text
feat: fitur baru
fix: perbaikan bug
refactor: perapihan kode
style: perubahan tampilan
chore: konfigurasi atau maintenance
docs: dokumentasi
```

---

## 🐛 Pelaporan Bug

Saat melaporkan masalah, sertakan:

- Deskripsi masalah.
- Langkah untuk mereproduksi error.
- Hasil yang diharapkan.
- Hasil yang muncul.
- Versi PHP.
- Versi MySQL/MariaDB.
- Screenshot error jika ada.
- Log terkait jika aman untuk dibagikan.

> Jangan pernah menyertakan password, `.env`, token, atau credential production dalam issue publik.

---

## 📚 Cocok Digunakan Untuk

Project ini dapat dikembangkan untuk:

- Monitoring perkuliahan.
- Mata kuliah berbasis praktikum.
- Monitoring tugas berbasis GitHub/Colab.
- Laboratorium komputer.
- Pendampingan akademik mahasiswa.
- Monitoring kelas berbasis project.
- Dashboard aktivitas dosen.
- Prototype sistem informasi akademik skala kelas.

---

## 📜 Lisensi

Repository saat ini belum mencantumkan file lisensi khusus.

Jika project akan dibagikan atau dikembangkan secara terbuka, tambahkan file `LICENSE` dan tentukan lisensi yang sesuai sebelum pihak lain melakukan redistribusi atau penggunaan ulang.

---

## 👨‍💻 Maintainer

**GitHub:** `ihdyrtg`  
**Project:** `academic_monitor_native_php`  
**Institusi:** UIN Sjech M. Djamil Djambek Bukittinggi

---

## ⭐ Dukungan

Jika project ini bermanfaat untuk pengembangan sistem monitoring pembelajaran, Anda dapat memberikan ⭐ pada repository dan mengembangkan fitur baru melalui branch terpisah.

---

<div align="center">

### Academic Monitor

**Monitor • Evaluate • Improve**

Dikembangkan untuk membantu proses monitoring pembelajaran menjadi lebih terstruktur, terukur, dan mudah ditindaklanjuti.

</div>
