<?php
$seatLayout = [
    ['PC01','PC02','PC03','PC04',null,'PC05','PC06','PC07','PC08'],
    ['PC16','PC15','PC14','PC13',null,'PC12','PC11','PC10','PC09'],
    ['PC17','PC18','PC19','PC20',null,'PC21','PC22','PC23','PC24'],
    ['PC32','PC31','PC30','PC29',null,'PC28','PC27','PC26','PC25'],
    ['PC33','PC34','PC35','PC36',null,'PC37','PC38','PC39','PC40'],
];
$studentsByPc = [];
foreach ($students as $student) {
    if (!empty($student['pc'])) {
        $studentsByPc[$student['pc']] = $student;
    }
}
?>
<section class="page active">
    <div class="page-head">
        <div>
            <h3>Denah / Posisi Duduk</h3>
            <p>
                Tarik kartu mahasiswa untuk memindahkan posisi PC.
                Jika PC tujuan terisi, posisi kedua mahasiswa akan ditukar.
            </p>
        </div>
    </div>

    <form id="seatMoveForm" method="post" action="<?= e(app_url('action.php')) ?>" hidden>
        <?= Csrf::field() ?>
        <input type="hidden" name="action" value="seat.move">
        <input type="hidden" name="class_id" value="<?= $classId ?>">
        <input type="hidden" name="return_to" value="dashboard.php?page=seating&class_id=<?= $classId ?>">
    </form>

    <div class="seat-room">
        <div class="front">AREA DEPAN KELAS / PAPAN TULIS</div>

        <div class="seat-grid">
            <div class="aisle">LORONG</div>

            <?php foreach ($seatLayout as $rowIndex => $row): ?>
                <?php foreach ($row as $columnIndex => $pc): ?>
                    <?php if ($pc === null) continue; ?>
                    <?php $student = $studentsByPc[$pc] ?? null; ?>

                    <div
                        class="pc-slot"
                        data-pc-slot="<?= e($pc) ?>"
                        style="grid-row:<?= $rowIndex + 1 ?>;grid-column:<?= $columnIndex + 1 ?>"
                    >
                        <div class="pc-title"><?= e($pc) ?></div>

                        <?php if ($student): ?>
                            <div
                                class="seat"
                                draggable="true"
                                data-seat-enrollment="<?= (int) $student['enrollment_id'] ?>"
                            >
                                <strong><?= e($student['nim']) ?></strong>
                                <small><?= e(display_name($student)) ?></small>

                                <div style="margin-top:7px">
                                    <?= resource_links($student, true) ?>
                                </div>
                            </div>
                        <?php else: ?>
                            <div class="seat empty">Kosong</div>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            <?php endforeach; ?>
        </div>
    </div>

    <div class="footer-note">
        Perpindahan posisi langsung disimpan ke MySQL.
        Klik menu Mahasiswa untuk mengubah profil, link, atau status akademik.
    </div>
</section>
