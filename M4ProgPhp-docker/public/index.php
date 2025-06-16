<?php

include_once("../source/database.php");

$connection = database_connect();

$result = $connection->query("SELECT straat, huisnummer FROM huis");

$rows = $result->fetch_all(MYSQLI_ASSOC);

for ($i = 0; $i < count($rows); $i++) {
    echo "<label>" . htmlspecialchars($rows[$i]['straat']) . "</label>";
    echo "<b>" . htmlspecialchars($rows[$i]['huisnummer']) . "</b><br>";
}
