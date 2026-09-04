<?php
$selectedTaskId = filter_input(INPUT_GET, 'task_id', FILTER_VALIDATE_INT) ?: 0;
if ($selectedTaskId <= 0 && $tasks !== []) {
    $selectedTaskId = (int) $tasks[0]['id'];
}
$selectedTask = $selectedTaskId > 0
    ? $repository->task($classId, $selectedTaskId)
    : null;

$editTaskId = filter_input(INPUT_GET, 'edit_task', FILTER_VALIDATE_INT);
$showTaskForm = isset($_GET['new_task']) || $editTaskId;
$editTask = $editTaskId ? $repository->task($classId, (int) $editTaskId) : null;
?>
<section class="page active">
    <div class="page-head">
        <div>
            <h3>Tugas & Nilai</h3>
            <p>Monitor status pengumpulan, bobot, tenggat, dan nilai setiap komponen penilaian.</p>
        </div>

        <div class="actions">
            <a
                class="btn"
                href="<?= e(app_url('export.php?type=tasks&class_id=' . $classId)) ?>"
            >↧ CSV</a>

            <?php if ($selectedTask): ?>
                <a
                    class="btn"
                    href="<?= e(app_url('dashboard.php?page=tasks&class_id=' . $classId . '&task_id=' . (int) $selectedTask['id'] . '&edit_task=' . (int) $selectedTask['id'] . '#task-form')) ?>"
                >✎ Edit Komponen</a>

                <form method="post" action="<?= e(app_url('action.php')) ?>">
                    <?= Csrf::field() ?>
                    <input type="hidden" name="action" value="task.delete">
                    <input type="hidden" name="class_id" value="<?= $classId ?>">
                    <input type="hidden" name="task_id" value="<?= (int) $selectedTask['id'] ?>">
                    <input type="hidden" name="return_to" value="dashboard.php?page=tasks&class_id=<?= $classId ?>">
                    <button
                        class="btn danger"
                        type="submit"
                        data-confirm="Hapus komponen <?= e($selectedTask['name']) ?> beserta seluruh nilai mahasiswa?"
                    >🗑 Hapus</button>
                </form>
            <?php endif; ?>

            <a
                class="btn primary"
                href="<?= e(app_url('dashboard.php?page=tasks&class_id=' . $classId . '&new_task=1#task-form')) ?>"
            >＋ Komponen</a>
        </div>
    </div>

    <?php if ($showTaskForm): ?>
        <?php
        $taskForm = $editTask ?: [
            'id' => 0,
            'name' => '',
            'type' => 'Tugas Harian',
            'weight' => 10,
            'max_score' => 100,
            'meeting' => null,
            'due_date' => null,
            'description' => '',
            'sort_order' => (count($tasks) + 1) * 10,
        ];
        ?>
        <div class="card panel-form" id="task-form" style="margin-bottom:16px">
            <div class="section-title">
                <h4><?= $editTask ? 'Edit Komponen Penilaian' : 'Tambah Komponen Penilaian' ?></h4>
                <a
                    class="btn small"
                    href="<?= e(app_url('dashboard.php?page=tasks&class_id=' . $classId . ($selectedTask ? '&task_id=' . (int) $selectedTask['id'] : ''))) ?>"
                >Tutup</a>
            </div>

            <form method="post" action="<?= e(app_url('action.php')) ?>">
                <?= Csrf::field() ?>
                <input type="hidden" name="action" value="task.save">
                <input type="hidden" name="class_id" value="<?= $classId ?>">
                <input type="hidden" name="task_id" value="<?= (int) ($taskForm['id'] ?? 0) ?>">
                <input type="hidden" name="return_to" value="dashboard.php?page=tasks&class_id=<?= $classId ?>">

                <div class="form-grid">
                    <div class="field full">
                        <label>Nama Komponen</label>
                        <input name="name" value="<?= e($taskForm['name']) ?>" required>
                    </div>

                    <div class="field">
                        <label>Jenis</label>
                        <select name="type">
                            <?php foreach ([
                                'Tugas Harian',
                                'Laporan Mingguan',
                                'Praktikum',
                                'Kuis',
                                'Proyek',
                                'UTS',
                                'UAS',
                                'Lainnya',
                            ] as $type): ?>
                                <option <?= selected($taskForm['type'], $type) ?>><?= e($type) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="field">
                        <label>Pertemuan</label>
                        <input
                            type="number"
                            min="1"
                            max="32"
                            name="meeting"
                            value="<?= e($taskForm['meeting'] ?? '') ?>"
                        >
                    </div>

                    <div class="field">
                        <label>Bobot (%)</label>
                        <input
                            type="number"
                            min="0"
                            max="100"
                            step="0.1"
                            name="weight"
                            value="<?= e($taskForm['weight']) ?>"
                        >
                    </div>

                    <div class="field">
                        <label>Nilai Maksimum</label>
                        <input
                            type="number"
                            min="1"
                            step="0.01"
                            name="max_score"
                            value="<?= e($taskForm['max_score']) ?>"
                        >
                    </div>

                    <div class="field">
                        <label>Tenggat</label>
                        <input type="date" name="due_date" value="<?= e($taskForm['due_date'] ?? '') ?>">
                    </div>

                    <div class="field">
                        <label>Urutan</label>
                        <input type="number" name="sort_order" value="<?= (int) $taskForm['sort_order'] ?>">
                    </div>

                    <div class="field full">
                        <label>Keterangan / Materi</label>
                        <textarea name="description"><?= e($taskForm['description']) ?></textarea>
                    </div>
                </div>

                <div class="form-actions">
                    <button class="btn primary" type="submit">Simpan Komponen</button>
                </div>
            </form>
        </div>
    <?php endif; ?>

    <div class="task-layout">
        <div class="card task-list">
            <?php if ($tasks === []): ?>
                <div class="empty-state">Belum ada komponen penilaian.</div>
            <?php endif; ?>

            <?php foreach ($tasks as $task): ?>
                <a
                    class="task-item <?= (int) $task['id'] === $selectedTaskId ? 'active' : '' ?>"
                    href="<?= e(app_url('dashboard.php?page=tasks&class_id=' . $classId . '&task_id=' . (int) $task['id'])) ?>"
                    style="display:block;text-decoration:none;color:inherit"
                >
                    <strong><?= e($task['name']) ?></strong>
                    <span>
                        <?= e($task['type']) ?>
                        • Bobot <?= e(number_format((float) $task['weight'], 2)) ?>%
                        <?= $task['meeting'] ? ' • Pertemuan ' . (int) $task['meeting'] : '' ?>
                    </span>
                </a>
            <?php endforeach; ?>
        </div>

        <div class="card table-card">
            <?php if (!$selectedTask): ?>
                <div class="empty-state">Belum ada komponen penilaian.</div>
            <?php else: ?>
                <div class="table-tools">
                    <div>
                        <strong><?= e($selectedTask['name']) ?></strong>
                        <div style="color:var(--muted);font-size:9px;margin-top:4px">
                            <?= e($selectedTask['type']) ?>
                            • Bobot <?= e(number_format((float) $selectedTask['weight'], 2)) ?>%
                            • Nilai Maks. <?= e(number_format((float) $selectedTask['max_score'], 2)) ?>
                            <?= $selectedTask['meeting'] ? ' • Pertemuan ' . (int) $selectedTask['meeting'] : '' ?>
                            <?= $selectedTask['due_date'] ? ' • Tenggat ' . e(date('d/m/Y', strtotime($selectedTask['due_date']))) : '' ?>
                            • Total bobot <?= e(number_format((float) $analytics['total_weight'], 2)) ?>%
                        </div>
                    </div>

                    <input
                        id="taskSearch"
                        placeholder="Cari mahasiswa..."
                        style="margin-left:auto;min-width:220px"
                    >
                </div>

                <form method="post" action="<?= e(app_url('action.php')) ?>">
                    <?= Csrf::field() ?>
                    <input type="hidden" name="action" value="task_records.save">
                    <input type="hidden" name="class_id" value="<?= $classId ?>">
                    <input type="hidden" name="task_id" value="<?= (int) $selectedTask['id'] ?>">
                    <input
                        type="hidden"
                        name="return_to"
                        value="dashboard.php?page=tasks&class_id=<?= $classId ?>&task_id=<?= (int) $selectedTask['id'] ?>"
                    >

                    <div class="table-wrap">
                        <table class="task-grade-table">
                            <thead>
                            <tr>
                                <th>Mahasiswa</th>
                                <th>NIM</th>
                                <th>Link</th>
                                <th>Status</th>
                                <th>Nilai</th>
                                <th>Catatan</th>
                            </tr>
                            </thead>

                            <tbody>
                            <?php foreach ($students as $student): ?>
                                <?php
                                $record = $analytics['task_records_map'][(int) $selectedTask['id']][(int) $student['enrollment_id']] ?? [
                                    'status' => 'pending',
                                    'score' => null,
                                    'note' => '',
                                    'github_url' => null,
                                    'colab_url' => null,
                                    'drive_url' => null,
                                ];
                                $resourceSource = [
                                    'github_url' => $record['github_url'] ?: $student['github_url'],
                                    'colab_url' => $record['colab_url'] ?: $student['colab_url'],
                                    'drive_url' => $record['drive_url'] ?: $student['drive_url'],
                                ];
                                $searchText = strtolower($student['nim'] . ' ' . $student['name']);
                                ?>
                                <tr
                                    data-task-student-row
                                    data-search="<?= e($searchText) ?>"
                                >
                                    <td>
                                        <div class="student">
                                            <div class="avatar">
                                                <?= e(initials((string) $student['name'], (string) $student['nim'])) ?>
                                            </div>
                                            <div><strong><?= e(display_name($student)) ?></strong></div>
                                        </div>
                                    </td>

                                    <td><?= e($student['nim']) ?></td>

                                    <td>
                                        <?= resource_links($resourceSource, true) ?>

                                        <details style="margin-top:6px">
                                            <summary class="small muted" style="cursor:pointer">Link khusus tugas</summary>
                                            <div class="task-record-links" style="margin-top:6px">
                                                <input
                                                    name="records[<?= (int) $student['enrollment_id'] ?>][github_url]"
                                                    value="<?= e($record['github_url'] ?? '') ?>"
                                                    placeholder="GitHub tugas"
                                                >
                                                <input
                                                    name="records[<?= (int) $student['enrollment_id'] ?>][colab_url]"
                                                    value="<?= e($record['colab_url'] ?? '') ?>"
                                                    placeholder="Colab tugas"
                                                >
                                                <input
                                                    name="records[<?= (int) $student['enrollment_id'] ?>][drive_url]"
                                                    value="<?= e($record['drive_url'] ?? '') ?>"
                                                    placeholder="Drive tugas"
                                                >
                                            </div>
                                        </details>
                                    </td>

                                    <td>
                                        <select
                                            class="task-status-select"
                                            name="records[<?= (int) $student['enrollment_id'] ?>][status]"
                                        >
                                            <option value="pending" <?= selected($record['status'], 'pending') ?>>Belum</option>
                                            <option value="submitted" <?= selected($record['status'], 'submitted') ?>>Dikumpulkan</option>
                                            <option value="graded" <?= selected($record['status'], 'graded') ?>>Dinilai</option>
                                            <option value="late" <?= selected($record['status'], 'late') ?>>Terlambat</option>
                                        </select>
                                    </td>

                                    <td>
                                        <input
                                            class="task-score-input"
                                            name="records[<?= (int) $student['enrollment_id'] ?>][score]"
                                            type="number"
                                            min="0"
                                            max="<?= e($selectedTask['max_score']) ?>"
                                            step="0.01"
                                            value="<?= e($record['score'] ?? '') ?>"
                                            placeholder="0-<?= e($selectedTask['max_score']) ?>"
                                        >
                                    </td>

                                    <td>
                                        <input
                                            class="task-note-input"
                                            name="records[<?= (int) $student['enrollment_id'] ?>][note]"
                                            value="<?= e($record['note'] ?? '') ?>"
                                            placeholder="Catatan"
                                        >
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>

                    <div class="form-actions" style="padding:12px 15px">
                        <button class="btn primary" type="submit">Simpan Nilai & Status</button>
                    </div>
                </form>
            <?php endif; ?>
        </div>
    </div>
</section>
