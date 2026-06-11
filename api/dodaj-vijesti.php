<?php
header("Content-Type: application/json; charset=UTF-8");

include "../connect.php";

$podaci = json_decode(file_get_contents("php://input"), true);

if (!$podaci) {
    echo json_encode(array("greska" => "Nisu poslani JSON podaci."), JSON_UNESCAPED_UNICODE);
    exit;
}

if (
    empty($podaci["naslov"]) ||
    empty($podaci["sazetak"]) ||
    empty($podaci["tekst"]) ||
    empty($podaci["slika"]) ||
    empty($podaci["kategorija"])
) {
    echo json_encode(array("greska" => "Sva polja moraju biti popunjena."), JSON_UNESCAPED_UNICODE);
    exit;
}

$datum = date("d.m.Y.");
$naslov = $podaci["naslov"];
$sazetak = $podaci["sazetak"];
$tekst = $podaci["tekst"];
$slika = $podaci["slika"];
$kategorija = $podaci["kategorija"];
$arhiva = isset($podaci["arhiva"]) ? (int)$podaci["arhiva"] : 0;

$sql = "INSERT INTO vijesti 
        (datum, naslov, sazetak, tekst, slika, kategorija, arhiva)
        VALUES (?, ?, ?, ?, ?, ?, ?)";

$stmt = mysqli_stmt_init($dbc);

if (mysqli_stmt_prepare($stmt, $sql)) {
    mysqli_stmt_bind_param(
        $stmt,
        "ssssssi",
        $datum,
        $naslov,
        $sazetak,
        $tekst,
        $slika,
        $kategorija,
        $arhiva
    );

    mysqli_stmt_execute($stmt);

    echo json_encode(array(
        "poruka" => "Vijest je uspješno dodana preko API-ja.",
        "id" => mysqli_insert_id($dbc)
    ), JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
} else {
    echo json_encode(array("greska" => "Greška kod pripreme SQL upita."), JSON_UNESCAPED_UNICODE);
}

mysqli_close($dbc);
?>