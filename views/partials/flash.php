<?php foreach (consume_flashes() as $flashItem): ?>
    <?php $flashType = in_array($flashItem['type'], ['success', 'warning', 'danger', 'info'], true)
        ? $flashItem['type']
        : 'info'; ?>
    <div class="alert <?= e($flashType) ?>">
        <?= e($flashItem['message']) ?>
    </div>
<?php endforeach; ?>
