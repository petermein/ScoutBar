<?php

require('config.php');


$_GET['month'] = isset($_GET['month']) ? $_GET['month'] : '0';
$sql_query = "SELECT `p`.`voornaam`, `p`.`achternaam`, `bb`.`total`, UNIX_TIMESTAMP(`bb`.`date`) AS `date` FROM `bestelling_bestelling` AS `bb` JOIN `personen_personen` AS `p` ON(`bb`.`personen_personen_persoon_id`=`p`.`persoon_id`) ORDER BY `bb`.`date` DESC LIMIT 100;";


if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db($dbname, $con);
$result = mysql_query($sql_query);

function month($i) {
    (isset($_GET['m'])) ? $monthnum = $_GET['m'] : $monthnum = date("m");
    return $stringmonth = date("F", mktime(0, 0, 0, ($monthnum - $i)));
}
echo "{ \"cols\": [ {\"id\":\"Naam\",\"label\":\"Naam\",\"pattern\":\"\",\"type\":\"string\"}, {\"id\":\"total\",\"label\":\"Totaal\",\"pattern\":\"\",\"type\":\"number\"}, {\"id\":\"datum\",\"label\":\"Datum\",\"pattern\":\"\",\"type\":\"datetime\"}], \"rows\": [ ";
$total_rows = mysql_num_rows($result);
$row_num = 0;
while ($row = mysql_fetch_array($result)) {
   
    $date = date("Y", $row['date']);
    $datestring = "Date(". date('Y', $row['date']) .",". (date('n', $row['date'])-1).",". date('j', $row['date']) .", ". date('G', $row['date']) .", ". date('i', $row['date']) ." ,". date('s', $row['date']).")";

    $row_num++;
    if ($row_num == $total_rows) {
        
        echo "{\"c\":[{\"v\":\"" . htmlentities($row['voornaam']) . " ". htmlentities($row['achternaam']) ."\",\"f\":null},{\"v\":" . (-1 * $row['total']) . ",\"f\":null},{\"v\":\"" . $datestring. "\",\"f\":null}]}";
    } else {
         echo "{\"c\":[{\"v\":\"" . htmlentities($row['voornaam']) . " ". htmlentities($row['achternaam']) ."\",\"f\":null},{\"v\":" . (-1 * $row['total']) . ",\"f\":null},{\"v\":\"" . $datestring ."\",\"f\":null}]},";  
         
         }
}
echo " ] }";
mysql_close($con);



?>
