# Pemetaan HTML Lama → PHP/MySQL

Refactor ini tidak menghapus file sumber. `legacy/dashboard_monitoring_multi_kelas_v3.html`
adalah salinan byte-for-byte dari file yang diberikan.

## Pemetaan Data

| HTML / localStorage | MySQL |
|---|---|
| `settings` | `settings` |
| `programs` | `programs` |
| `courses` | `courses` |
| `classes` | `classes` |
| `classData[class].students` | `students` + `class_enrollments` |
| status registrasi | `class_enrollments.registration_status` |
| status pembayaran | `class_enrollments.payment_status` |
| IPK / target IPK | `class_enrollments.gpa` / `target_gpa` |
| PC | `class_enrollments.pc` |
| GitHub / Colab / Drive | `class_enrollments.*_url` |
| `attendance` | `attendance` |
| `tasks` | `tasks` |
| `taskRecords` | `task_records` |
| link khusus tugas | `task_records.github_url/colab_url/drive_url` |
| `events` | `events` |
| `student.special` | `special_activities` |
| `logs` | `activity_logs` |

## Data yang berada di localStorage

Source HTML hanya memuat seed awal. Perubahan yang dibuat saat file HTML berjalan dapat berada
di localStorage browser dan tidak otomatis menjadi bagian dari source HTML.

Untuk memindahkannya:

1. Buka dashboard HTML lama pada browser/perangkat yang menyimpan datanya.
2. Export `Backup JSON`.
3. Login ke versi PHP sebagai Admin.
4. Buka `Administrasi Sistem → Migrasi Backup Lama`.
5. Upload JSON.
6. Importer melakukan upsert berdasarkan identitas Prodi/MK/Kelas/NIM dan mempertahankan
   presensi, tugas, nilai, link, agenda, special activity, serta log.
