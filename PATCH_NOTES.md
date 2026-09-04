# Patch Presensi

Versi ini memperbaiki interaksi tombol Hadir / Izin / Sakit / Alpa.

Perubahan:
- UI tombol presensi aktif.
- Warna status sesuai pilihan.
- Ringkasan jumlah status berubah langsung.
- Hidden input tetap kompatibel dengan `attendance.save`.
- Tidak mengubah schema atau data database.
- Tidak menghapus fitur lain.

File patch:
- views/pages/attendance.php
- public/assets/js/app.js
- public/assets/css/app.css
