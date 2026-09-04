<?php
$safeCount = 0;
$possibleCount = 0;
$riskCount = 0;

foreach ($students as $student) {
    $prediction = $analytics['students'][(int) $student['enrollment_id']]['prediction'];
    if ($prediction['tone'] === 'ok') {
        $safeCount++;
    } elseif ($prediction['tone'] === 'danger') {
        $riskCount++;
    } else {
        $possibleCount++;
    }
}

$validTrendPoints = array_filter(
    $analytics['trend']['points'],
    static fn (array $point): bool => $point['average'] !== null
);
?>
<section class="page active">
    <div class="page-head">
        <div>
            <h3>Analitik Nilai & Prediksi Kelulusan</h3>
            <p>
                Hitung peluang lulus dari bobot yang sudah dinilai, sisa bobot,
                serta tren pemahaman kelas dari komponen ke komponen.
            </p>
        </div>

        <div class="actions">
            <a
                class="btn"
                href="<?= e(app_url('export.php?type=siakad&class_id=' . $classId)) ?>"
            >↧ CSV SIAKAD</a>
        </div>
    </div>

    <div class="grid analytics-grid" style="margin-bottom:16px">
        <div class="card section-card">
            <div class="section-title">
                <h4>Grafik Tren Pemahaman Kelas</h4>
                <span><?= count($validTrendPoints) ?> komponen punya data</span>
            </div>

            <div class="trend-chart">
                <?php if ($validTrendPoints === []): ?>
                    <div class="empty-state" style="width:100%">Belum ada nilai.</div>
                <?php else: ?>
                    <?php foreach ($analytics['trend']['points'] as $index => $point): ?>
                        <?php
                        $average = $point['average'];
                        $isDrop = ($analytics['trend']['worst_drop']['index'] ?? -1) === $index;
                        ?>
                        <div class="trend-col">
                            <?php if ($isDrop): ?>
                                <div class="drop-mark">▼ turun</div>
                            <?php endif; ?>

                            <div class="trend-value">
                                <?= $average === null ? '—' : e(number_format((float) $average, 1)) ?>
                            </div>

                            <div
                                class="trend-bar"
                                style="height:<?= $average === null ? 0 : max(0, min(100, (float) $average)) ?>%"
                            ></div>

                            <div class="trend-label"><?= e($point['task']['name']) ?></div>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>

            <?php if ($analytics['trend']['worst_drop']): ?>
                <?php $drop = $analytics['trend']['worst_drop']; ?>
                <div class="notice danger-note" style="margin:16px 0 0">
                    Rata-rata kelas turun
                    <strong><?= e(number_format((float) $drop['drop'], 1)) ?> poin</strong>
                    dari <?= e($drop['from']['task']['name']) ?>
                    ke <strong><?= e($drop['to']['task']['name']) ?></strong>.
                    Rekomendasi: evaluasi capaian materi pada pertemuan
                    <?= e($drop['to']['task']['meeting'] ?: '-') ?>,
                    cek soal/rubrik, dan lakukan remedial atau pengulangan konsep.
                </div>
            <?php else: ?>
                <div class="notice" style="margin:16px 0 0">
                    Belum terdeteksi penurunan ≥
                    <?= e($settings['trend_drop_threshold'] ?? 10) ?>
                    poin antar komponen yang memiliki data.
                </div>
            <?php endif; ?>
        </div>

        <div class="card section-card">
            <div class="section-title">
                <h4>Ringkasan Prediksi</h4>
                <span>ambang <?= e($classContext['pass_threshold']) ?>%</span>
            </div>

            <div class="metric-list">
                <div class="metric-row"><span>Nilai / peluang aman</span><strong><?= $safeCount ?></strong></div>
                <div class="metric-row"><span>Perlu dijaga / belum cukup data</span><strong><?= $possibleCount ?></strong></div>
                <div class="metric-row"><span>Berisiko tinggi</span><strong><?= $riskCount ?></strong></div>
                <div class="metric-row"><span>Total bobot komponen</span><strong><?= e(number_format((float) $analytics['total_weight'], 2)) ?>%</strong></div>
            </div>
        </div>
    </div>

    <div class="card table-card">
        <div class="table-tools">
            <strong>Prediksi per Mahasiswa</strong>
        </div>

        <div class="table-wrap">
            <table>
                <thead>
                <tr>
                    <th>Mahasiswa</th>
                    <th>Bobot Dinilai</th>
                    <th>Poin Saat Ini</th>
                    <th>Sisa Bobot</th>
                    <th>Nilai Minimal pada Sisa</th>
                    <th>Estimasi Akhir</th>
                    <th>Status</th>
                </tr>
                </thead>

                <tbody>
                <?php foreach ($students as $student): ?>
                    <?php
                    $prediction = $analytics['students'][(int) $student['enrollment_id']]['prediction'];
                    $needed = $prediction['needed'];
                    $neededLabel = $needed === null
                        ? '—'
                        : ($needed <= 0
                            ? '0%'
                            : ($needed > 100 ? '>100%' : number_format((float) $needed, 1) . '%'));
                    ?>
                    <tr>
                        <td>
                            <div class="student">
                                <div class="avatar">
                                    <?= e(initials((string) $student['name'], (string) $student['nim'])) ?>
                                </div>
                                <div>
                                    <strong><?= e(display_name($student)) ?></strong>
                                    <small><?= e($student['nim']) ?></small>
                                </div>
                            </div>
                        </td>

                        <td><?= e(number_format((float) $prediction['graded_weight'], 1)) ?>%</td>
                        <td><?= e(number_format((float) $prediction['current_points'], 1)) ?></td>
                        <td><?= e(number_format((float) $prediction['remaining_weight'], 1)) ?>%</td>
                        <td><?= e($neededLabel) ?></td>

                        <td>
                            <?= e(number_format((float) $prediction['estimated'], 1)) ?>
                            (<?= e($analyticsService->gradeLetter((float) $prediction['estimated'])) ?>)
                        </td>

                        <td>
                            <span class="badge <?= e($prediction['tone']) ?>">
                                <?= e($prediction['status']) ?>
                            </span>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>
