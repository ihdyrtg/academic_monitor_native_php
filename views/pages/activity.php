<section class="page active">
    <div class="page-head">
        <div>
            <h3>Log Aktivitas Kelas</h3>
            <p>Jejak perubahan data mahasiswa, presensi, tugas, nilai, agenda, posisi duduk, dan kegiatan.</p>
        </div>

        <div class="actions">
            <form method="post" action="<?= e(app_url('action.php')) ?>">
                <?= Csrf::field() ?>
                <input type="hidden" name="action" value="logs.clear">
                <input type="hidden" name="class_id" value="<?= $classId ?>">
                <input type="hidden" name="return_to" value="dashboard.php?page=activity&class_id=<?= $classId ?>">
                <button
                    class="btn"
                    type="submit"
                    data-confirm="Bersihkan seluruh log aktivitas kelas aktif?"
                >Bersihkan Log</button>
            </form>
        </div>
    </div>

    <div class="log-list">
        <?php if ($logs === []): ?>
            <div class="card empty-state">Belum ada aktivitas.</div>
        <?php endif; ?>

        <?php foreach ($logs as $logItem): ?>
            <div class="log-row">
                <div class="log-type"><?= e($logItem['type']) ?></div>
                <div>
                    <?= e($logItem['text']) ?>
                    <?php if ($logItem['username']): ?>
                        <small class="muted"> • oleh <?= e($logItem['username']) ?></small>
                    <?php endif; ?>
                </div>
                <time><?= e(date('d/m/Y H:i', strtotime((string) $logItem['created_at']))) ?></time>
            </div>
        <?php endforeach; ?>
    </div>
</section>
