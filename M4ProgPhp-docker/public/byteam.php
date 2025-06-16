<?php
require_once 'connect.php';

$sql = "
SELECT teamv2.id AS team_id, teamv2.teamnaam, teamlidv2.id AS speler_id, teamlidv2.naam 
FROM teamlidv2_teamv2
JOIN teamv2 ON teamlidv2_teamv2.teamid = teamv2.id
JOIN teamlidv2 ON teamlidv2_teamv2.teamlidid = teamlidv2.id
ORDER BY teamv2.id;
";
$stmt = $pdo->query($sql);
$result = $stmt->fetchAll();

// Groepeer per team
$teams = [];
foreach ($result as $row) {
    $teams[$row['teamnaam']][] = $row['naam'];
}
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Spelers per team</title>
</head>
<body>
    <h1>Teams en hun spelers</h1>
    <?php foreach ($teams as $teamnaam => $spelers): ?>
        <h2><?= htmlspecialchars($teamnaam) ?></h2>
        <ul>
            <?php foreach ($spelers as $speler): ?>
                <li><?= htmlspecialchars($speler) ?></li>
            <?php endforeach; ?>
        </ul>
    <?php endforeach; ?>
</body>
</html>
