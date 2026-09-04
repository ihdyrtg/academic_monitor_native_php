<?php
$editEventId = filter_input(INPUT_GET, 'edit_event', FILTER_VALIDATE_INT) ?: 0;
$showEventForm = isset($_GET['new_event']) || $editEventId > 0;
$editEvent = $editEventId > 0 ? $repository->event($classId, $editEventId) : null;
$eventFilter = trim((string) ($_GET['type'] ?? ''));

$mergedEvents = [];
foreach ($events as $event) {
    $event['source'] = 'manual';
    $mergedEvents[] = $event;
}
foreach ($tasks as $task) {
    if (!$task['due_date']) {
        continue;
    }
    $mergedEvents[] = [
        'id' => 0,
        'class_id' => $classId,
        'title' => 'Deadline: ' . $task['name'],
        'type' => 'Deadline',
        'event_date' => $task['due_date'],
        'event_time' => null,
        'location' => '',
        'description' => $task['description'],
        'source' => 'task',
    ];
}
usort(
    $mergedEvents,
    static fn (array $a, array $b): int =>
        strcmp(
            (string) $a['event_date'] . (string) ($a['event_time'] ?? ''),
            (string) $b['event_date'] . (string) ($b['event_time'] ?? '')
        )
);
if ($eventFilter !== '') {
    $mergedEvents = array_values(array_filter(
        $mergedEvents,
        static fn (array $event): bool => $event['type'] === $eventFilter
    ));
}
$today = date('Y-m-d');
$upcomingCount = count(array_filter(
    $mergedEvents,
    static fn (array $event): bool => $event['event_date'] >= $today
));
?>
<section class="page active">
    <div class="page-head">
        <div>
            <h3>Kalender & Jadwal Akademik</h3>
            <p>Jadwal kuliah, ujian, deadline tugas, bimbingan, dan agenda akademik kelas.</p>
        </div>

        <div class="actions">
            <a
                class="btn primary"
                href="<?= e(app_url('dashboard.php?page=calendar&class_id=' . $classId . '&new_event=1#event-form')) ?>"
            >＋ Agenda</a>
        </div>
    </div>

    <?php if ($showEventForm): ?>
        <?php
        $eventForm = $editEvent ?: [
            'id' => 0,
            'title' => '',
            'type' => 'Kuliah',
            'event_date' => '',
            'event_time' => '',
            'location' => '',
            'description' => '',
        ];
        ?>
        <div class="card panel-form" id="event-form" style="margin-bottom:16px">
            <div class="section-title">
                <h4><?= $editEvent ? 'Edit Agenda' : 'Tambah Agenda' ?></h4>
                <a
                    class="btn small"
                    href="<?= e(app_url('dashboard.php?page=calendar&class_id=' . $classId)) ?>"
                >Tutup</a>
            </div>

            <form method="post" action="<?= e(app_url('action.php')) ?>">
                <?= Csrf::field() ?>
                <input type="hidden" name="action" value="event.save">
                <input type="hidden" name="class_id" value="<?= $classId ?>">
                <input type="hidden" name="event_id" value="<?= (int) ($eventForm['id'] ?? 0) ?>">
                <input type="hidden" name="return_to" value="dashboard.php?page=calendar&class_id=<?= $classId ?>">

                <div class="form-grid">
                    <div class="field full">
                        <label>Judul</label>
                        <input name="title" value="<?= e($eventForm['title']) ?>" required>
                    </div>

                    <div class="field">
                        <label>Jenis</label>
                        <select name="type">
                            <?php foreach (['Kuliah', 'Ujian', 'Deadline', 'Bimbingan', 'Kegiatan'] as $type): ?>
                                <option <?= selected($eventForm['type'], $type) ?>><?= e($type) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="field">
                        <label>Tanggal</label>
                        <input type="date" name="event_date" value="<?= e($eventForm['event_date']) ?>" required>
                    </div>

                    <div class="field">
                        <label>Waktu</label>
                        <input type="time" name="event_time" value="<?= e(substr((string) ($eventForm['event_time'] ?? ''), 0, 5)) ?>">
                    </div>

                    <div class="field">
                        <label>Lokasi</label>
                        <input name="location" value="<?= e($eventForm['location']) ?>">
                    </div>

                    <div class="field full">
                        <label>Keterangan</label>
                        <textarea name="description"><?= e($eventForm['description']) ?></textarea>
                    </div>
                </div>

                <div class="form-actions">
                    <button class="btn primary" type="submit">Simpan Agenda</button>
                </div>
            </form>
        </div>
    <?php endif; ?>

    <div class="calendar-grid">
        <div class="card section-card">
            <h4 style="margin-top:0">Agenda Baru / Terdekat</h4>

            <div class="notice">
                Deadline dari komponen tugas otomatis ikut muncul di kalender.
                Agenda manual dapat digunakan untuk jadwal kuliah, ujian,
                bimbingan, atau kegiatan lain.
            </div>

            <div class="metric-list">
                <div class="metric-row"><span>Agenda mendatang</span><strong><?= $upcomingCount ?></strong></div>
                <div class="metric-row"><span>Deadline tugas</span><strong><?= count(array_filter($tasks, static fn (array $task): bool => !empty($task['due_date']))) ?></strong></div>
                <div class="metric-row"><span>Ujian terjadwal</span><strong><?= count(array_filter($mergedEvents, static fn (array $event): bool => $event['type'] === 'Ujian')) ?></strong></div>
                <div class="metric-row"><span>Agenda manual</span><strong><?= count($events) ?></strong></div>
            </div>
        </div>

        <div class="card section-card">
            <div class="section-title">
                <h4>Daftar Agenda</h4>

                <form method="get">
                    <input type="hidden" name="page" value="calendar">
                    <input type="hidden" name="class_id" value="<?= $classId ?>">
                    <select name="type" data-auto-submit>
                        <option value="">Semua jenis</option>
                        <?php foreach (['Kuliah', 'Ujian', 'Deadline', 'Bimbingan', 'Kegiatan'] as $type): ?>
                            <option value="<?= e($type) ?>" <?= selected($eventFilter, $type) ?>><?= e($type) ?></option>
                        <?php endforeach; ?>
                    </select>
                </form>
            </div>

            <div class="event-list">
                <?php if ($mergedEvents === []): ?>
                    <div class="empty-state">Belum ada agenda.</div>
                <?php endif; ?>

                <?php foreach ($mergedEvents as $event): ?>
                    <?php
                    $className = $event['type'] === 'Ujian'
                        ? 'exam'
                        : ($event['type'] === 'Deadline' ? 'deadline' : ($event['type'] === 'Kegiatan' ? 'special' : ''));
                    ?>
                    <div class="event-item <?= e($className) ?>">
                        <div class="event-date">
                            <?= e(date('d/m/Y', strtotime((string) $event['event_date']))) ?>
                            <?= $event['event_time'] ? ' • ' . e(substr((string) $event['event_time'], 0, 5)) : '' ?>
                        </div>

                        <div class="event-title"><?= e($event['title']) ?></div>

                        <div class="event-meta">
                            <?= e($event['type']) ?>
                            <?= $event['location'] ? ' • ' . e($event['location']) : '' ?>
                            <?= $event['description'] ? '<br>' . nl2br(e($event['description'])) : '' ?>
                        </div>

                        <?php if (($event['source'] ?? '') === 'manual'): ?>
                            <div class="actions" style="margin-top:8px">
                                <a
                                    class="btn small"
                                    href="<?= e(app_url('dashboard.php?page=calendar&class_id=' . $classId . '&edit_event=' . (int) $event['id'] . '#event-form')) ?>"
                                >Edit</a>

                                <form method="post" action="<?= e(app_url('action.php')) ?>">
                                    <?= Csrf::field() ?>
                                    <input type="hidden" name="action" value="event.delete">
                                    <input type="hidden" name="class_id" value="<?= $classId ?>">
                                    <input type="hidden" name="event_id" value="<?= (int) $event['id'] ?>">
                                    <input type="hidden" name="return_to" value="dashboard.php?page=calendar&class_id=<?= $classId ?>">
                                    <button
                                        class="btn small danger"
                                        type="submit"
                                        data-confirm="Hapus agenda <?= e($event['title']) ?>?"
                                    >Hapus</button>
                                </form>
                            </div>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>
