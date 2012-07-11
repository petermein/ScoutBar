<?php 
  require('config.php');

  $_GET['month'] = isset($_GET['month']) ? $_GET['month'] : '0';
  $sql_query = "SELECT 
    pp.naam, 
SUM(CASE WHEN  month(bb.date) = month(NOW()) THEN br.aantal ELSE 0 END)
AS 'maand0',
SUM(CASE WHEN  month(bb.date) = (month(NOW()-INTERVAL 1 MONTH)) THEN br.aantal ELSE 0 END)
AS 'maand1',
SUM(CASE WHEN  month(bb.date) = (month(NOW()-INTERVAL 2 MONTH)) THEN br.aantal ELSE 0 END)
AS 'maand2'
FROM
    bestelling_regels AS br
        JOIN
    product_product AS pp ON (br.product_product_product_id = pp.product_id)
        JOIN
    bestelling_bestelling AS bb ON (br.bestelling_bestelling_besetleling_id = bb.besetleling_id)
WHERE categorie < 4
GROUP BY pp.naam;";
 
  
  if (!$con){ die('Could not connect: ' . mysql_error()); }
  mysql_select_db($dbname, $con);
  $result = mysql_query($sql_query);
  
  function month($i){
      (isset($_GET['m'])) ? $monthnum = $_GET['m'] : $monthnum = date("m"); 
  return $stringmonth = date("F", mktime(0, 0, 0, ($monthnum - $i))); 
  }
  echo "{ \"cols\": [ {\"id\":\"product\",\"label\":\"Product\",\"pattern\":\"\",\"type\":\"string\"}, {\"id\":\"maand0\",\"label\":\"". month(0) ."\",\"pattern\":\"\",\"type\":\"number\"}, {\"id\":\"maand1\",\"label\":\"". month(1) ."\",\"pattern\":\"\",\"type\":\"number\"}, {\"id\":\"maand2\",\"label\":\"". month(2) ."\",\"pattern\":\"\",\"type\":\"number\"} ], \"rows\": [ ";
  $total_rows = mysql_num_rows($result);
  $row_num = 0;
  while($row = mysql_fetch_array($result)){
    $row_num++;
    if ($row_num == $total_rows){
      echo "{\"c\":[{\"v\":\"" . htmlentities($row['naam']) . "\",\"f\":null},{\"v\":" . $row['maand0'] . ",\"f\":null},{\"v\":" . $row['maand1'] . ",\"f\":null},{\"v\":" . $row['maand2'] . ",\"f\":null}]}";
    } else {
      echo "{\"c\":[{\"v\":\"" . htmlentities($row['naam']) . "\",\"f\":null},{\"v\":" . $row['maand0'] . ",\"f\":null},{\"v\":" . $row['maand1'] . ",\"f\":null},{\"v\":" . $row['maand2'] . ",\"f\":null}]},";
    }
  }
  echo " ] }";
  mysql_close($con);

?>