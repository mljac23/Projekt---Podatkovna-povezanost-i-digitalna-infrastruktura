<?php
header("Content-Type: application/xml; charset=UTF-8");

include "../connect.php";

$sql = "SELECT id, datum, naslov, sazetak, tekst, slika, kategorija 
        FROM vijesti 
        WHERE arhiva = 0 
        ORDER BY id DESC";

$result = mysqli_query($dbc, $sql);

$xml = new SimpleXMLElement("<vijesti></vijesti>");

while ($row = mysqli_fetch_assoc($result)) {
    $vijest = $xml->addChild("vijest");

    $vijest->addChild("id", $row["id"]);
    $vijest->addChild("datum", htmlspecialchars($row["datum"]));
    $vijest->addChild("naslov", htmlspecialchars($row["naslov"]));
    $vijest->addChild("sazetak", htmlspecialchars($row["sazetak"]));
    $vijest->addChild("tekst", htmlspecialchars($row["tekst"]));
    $vijest->addChild("slika", htmlspecialchars($row["slika"]));
    $vijest->addChild("kategorija", htmlspecialchars($row["kategorija"]));
}

echo $xml->asXML();

mysqli_close($dbc);
?>