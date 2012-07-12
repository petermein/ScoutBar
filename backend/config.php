<?php

  $dbuser="root";
  $dbname="mydb";
  $dbpass="root";
  $dbserver="localhost";
  $con = mysql_connect($dbserver,$dbuser,$dbpass);
  
  mysql_select_db($dbname, $con);

?>
