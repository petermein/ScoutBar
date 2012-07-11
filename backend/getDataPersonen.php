<?php 
  require('config.php');

  $_GET['month'] = isset($_GET['month']) ? $_GET['month'] : '0';
  $sql_query = "SELECT * FROM `personen` WHERE `level` <> 1 OR `level`IS NULL ORDER BY saldo ASC";
 
  
  if (!$con){ die('Could not connect: ' . mysql_error()); }
  mysql_select_db($dbname, $con);
  $result = mysql_query($sql_query);
  
  function month($i){
      (isset($_GET['m'])) ? $monthnum = $_GET['m'] : $monthnum = date("m"); 
  return $stringmonth = date("F", mktime(0, 0, 0, ($monthnum - $i))); 
  }
  echo "{ \"cols\": [ {\"id\":\"naam\",\"label\":\"Naam\",\"pattern\":\"\",\"type\":\"string\"}, {\"id\":\"saldo\",\"label\":\"Saldo\",\"pattern\":\"\",\"type\":\"number\"} ], \"rows\": [ ";
  $total_rows = mysql_num_rows($result);
  $row_num = 0;
  while($row = mysql_fetch_array($result)){
    $row_num++;
    if ($row_num == $total_rows){
      echo "{\"c\":[{\"v\":\"" . htmlentities($row['voornaam']) ." ".  htmlentities($row['achternaam']) ."\",\"f\":null},{\"v\":" . $row['saldo'] . ",\"f\":null}]}";
    } else {
      echo "{\"c\":[{\"v\":\"" .  htmlentities($row['voornaam']) ." ".  htmlentities($row['achternaam']) ."\",\"f\":null},{\"v\":" . $row['saldo'] . ",\"f\":null}]},";
    }
  }
  echo " ] }";
  mysql_close($con);

?>