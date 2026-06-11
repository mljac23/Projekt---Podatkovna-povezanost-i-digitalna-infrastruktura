<?php
header("Content-Type: application/json; charset=UTF-8");

include "../connect.php";

if (!isset($_GET["id"])) {
    echo json_encode(array("greska" => "Nedostaje ID vijesti."), JSON_UNESCAPED_UNICODE);
    exit;
}

$id = (int) $_GET["id"];

$sql = "SELECT id, datum, naslov, sazetak, tekst, slika, kategorija 
        FROM vijesti 
        WHERE id = ? AND arhiva = 0";

$stmt = mysqli_stmt_init($dbc);

if (mysqli_stmt_prepare($stmt, $sql)) {
    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    $vijest = mysqli_fetch_assoc($result);

    if ($vijest) {
        echo json_encode($vijest, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    } else {
        echo json_encode(array("greska" => "Vijest nije pronađena."), JSON_UNESCAPED_UNICODE);
    }
}

mysqli_close($dbc);
?>