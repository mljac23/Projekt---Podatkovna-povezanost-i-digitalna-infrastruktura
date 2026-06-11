<?php
header("Content-Type: application/json; charset=UTF-8");

include "../connect.php";

if (!isset($_GET["naziv"])) {
    echo json_encode(array("greska" => "Nedostaje naziv kategorije."), JSON_UNESCAPED_UNICODE);
    exit;
}

$kategorija = $_GET["naziv"];

$sql = "SELECT id, datum, naslov, sazetak, tekst, slika, kategorija 
        FROM vijesti 
        WHERE kategorija = ? AND arhiva = 0
        ORDER BY id DESC";

$stmt = mysqli_stmt_init($dbc);

if (mysqli_stmt_prepare($stmt, $sql)) {
    mysqli_stmt_bind_param($stmt, "s", $kategorija);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);

    $vijesti = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $vijesti[] = $row;
    }

    echo json_encode($vijesti, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}

mysqli_close($dbc);
?>