<?php
header("Content-Type: application/json; charset=UTF-8");

include "../connect.php";

$sql = "SELECT id, datum, naslov, sazetak, tekst, slika, kategorija 
        FROM vijesti 
        WHERE arhiva = 0 
        ORDER BY id DESC";

$result = mysqli_query($dbc, $sql);

$vijesti = array();

while ($row = mysqli_fetch_assoc($result)) {
    $vijesti[] = $row;
}

echo json_encode($vijesti, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

mysqli_close($dbc);
?>