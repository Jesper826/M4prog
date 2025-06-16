<?php
include_once("../source/database.php");
$connection = database_connect();

$sql = "SELECT * FROM teamv2";
$result = $connection->query($sql);
$teams = $result->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Alle Teams</title>
</head>
<body>
    <h1>Overzicht van Teams</h1>

    <?php foreach ($teams as $team): ?>
        <p>Team: <b><?= htmlspecialchars($team['naam']) ?></b></p>
    <?php endforeach; ?>
</body>
</html>
