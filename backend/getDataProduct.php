<?php 
  require('config.php');
$product = $_GET['p'];
$jaar = !isset($_GET['j']) ? date('Y') : $_GET['j'];
  $sql_query = "SELECT MONTH(bb.date) AS m,
    pp.naam as naam, 
    SUM(aantal) as aantal
FROM
    bestelling_regels AS br
        JOIN
    product_product AS pp ON (br.product_product_product_id = pp.product_id)
        JOIN
    bestelling_bestelling AS bb ON (br.bestelling_bestelling_besetleling_id = bb.besetleling_id)
WHERE pp.product_id = ". $product ." AND YEAR(bb.date) = ". $jaar ."
GROUP BY MONTH(bb.date)
ORDER BY MONTH(bb.date) ASC";
 
  
  if (!$con){ die('Could not connect: ' . mysql_error()); }
  mysql_select_db($dbname, $con);
  $result = mysql_query($sql_query) or die(mysql_error());
  
  function month($i){
      (isset($_GET['m'])) ? $monthnum = $_GET['m'] : $monthnum = date("m"); 
  return $stringmonth = date("F", mktime(0, 0, 0, ($monthnum - $i))); 
  }
  echo "{ \"cols\": [ {\"id\":\"maand\",\"label\":\"Maand\",\"pattern\":\"\",\"type\":\"string\"}, {\"id\":\"aantal\",\"label\":\"Aantal\",\"pattern\":\"\",\"type\":\"number\"} ], \"rows\": [ ";
  $total_rows = mysql_num_rows($result);
  $row_num = 0;
 $i = 1;
  while($row = mysql_fetch_array($result)){
      while($i<13){
    $row_num++;
    if($row['m'] == $i){
      echo "{\"c\":[{\"v\":\"" . monthName($i) . "\",\"f\":null},{\"v\":" . $row['aantal'] . ",\"f\":null}]},";
      $i++;
      break;
    } elseif($row['m'] == $i && $i = 12) {
        echo "{\"c\":[{\"v\":\"" . monthName($i) . "\",\"f\":null},{\"v\":" . $row['aantal'] .",\"f\":null}]}";
        $i++;
        break;
    } elseif($i == 12){
       echo "{\"c\":[{\"v\":\"" . monthName($i) . "\",\"f\":null},{\"v\":0,\"f\":null}]}";
    } else {
        echo "{\"c\":[{\"v\":\"" . monthName($i) . "\",\"f\":null},{\"v\":0,\"f\":null}]},";
    }
     $i++;
      }
            while($i<13){
    $row_num++;
    if($row['m'] == $i){
      echo "{\"c\":[{\"v\":\"" . monthName($i) . "\",\"f\":null},{\"v\":" . $row['aantal'] . ",\"f\":null}]},";
      $i++;
      break;
    } elseif($row['m'] == $i && $i = 12) {
        echo "{\"c\":[{\"v\":\"" . honthName($i) . "\",\"f\":null},{\"v\": ". $row['aantal'] . ",\"f\":null}]}";
        $i++;
        break;
    } elseif($i == 12){
       echo "{\"c\":[{\"v\":\"" . monthName($i) . "\",\"f\":null},{\"v\":0,\"f\":null}]}";
    } else {
        echo "{\"c\":[{\"v\":\"" . monthName($i) . "\",\"f\":null},{\"v\":0,\"f\":null}]},";
    }
     $i++;
      }
  }
  echo " ] }";
  mysql_close($con);

  function monthName($month_int) {

$month_int = (int)$month_int;

$months = array("","January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");

return $months[$month_int];

}
?>