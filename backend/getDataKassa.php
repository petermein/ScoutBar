<?php

require('config.php');

$_GET['month'] = isset($_GET['month']) ? $_GET['month'] : '0';
$sql_query = "SELECT 
    pp.naam AS naam, 
    br.aantal AS aantal,
    pp.prijs AS prijs,
    ABS(SUM(br.aantal)*pp.prijs) AS total
FROM
    bestelling_regels AS br
        JOIN
    product_product AS pp ON (br.product_product_product_id = pp.product_id)
        JOIN
    bestelling_bestelling AS bb ON (br.bestelling_bestelling_besetleling_id = bb.besetleling_id)
        JOIN 
    personen AS p ON (br.personen_personen_persoon_id=p.persoon_id)
WHERE
    bb.date > NOW() - INTERVAL 8 DAY
    AND
    (pp.categorie = 4 OR p.level = 1)
GROUP BY pp.naam;";


if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db($dbname, $con);
$result = mysql_query($sql_query);

function month($i) {
    (isset($_GET['m'])) ? $monthnum = $_GET['m'] : $monthnum = date("m");
    return $stringmonth = date("F", mktime(0, 0, 0, ($monthnum - $i)));
}

echo "{ \"cols\": [ {\"id\":\"naam\",\"label\":\"Naam\",\"pattern\":\"\",\"type\":\"string\"}, {\"id\":\"aantal\",\"label\":\"Aantal\",\"pattern\":\"\",\"type\":\"number\"}, {\"id\":\"prijs\",\"label\":\"Prijs\",\"pattern\":\"\",\"type\":\"number\"}, {\"id\":\"total\",\"label\":\"Totaal\",\"pattern\":\"\",\"type\":\"number\"}], \"rows\": [ ";
$total_rows = mysql_num_rows($result);
$row_num = 0;
$totals = 0;
while ($row = mysql_fetch_array($result)) {
    $row_num++;
    $totals += $row['total'];
 
           echo "{\"c\":[{\"v\":\"" . htmlentities($row['naam']) . "\",\"f\":null},{\"v\":" . $row['aantal'] . ",\"f\":null},{\"v\":" . $row['prijs'] . ",\"f\":null},{\"v\":" . $row['total'] . ",\"f\":null}]},"; 
}

        echo "{\"c\":[{\"v\":\"\",\"f\":null},{\"v\":\"\",\"f\":null},{\"v\":\"\",\"f\":null},{\"v\":" . $totals . ",\"f\":null}]}";
echo " ] }";
mysql_close($con);
?>