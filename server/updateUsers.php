<?php
$file = file_get_contents('php://input');
//$file = file_get_contents('test.txt');
$data = json_decode($file);
file_put_contents('test.txt', $file);

if($data == null) exit;

$server = '127.0.0.1';
$username = 'root';
$password = 'root';
$database = 'dibski_rateit2';

$mysqli = new mysqli();
$mysqli->connect($server, $username, $password, $database);
if(mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

$mysqli->autocommit(FALSE);
//print_r($data);

print($data->User);
$total = 0;

$personel = $data->BarUser == -1 ? "NULL" : $data->BarUser;

$mysqli->query("INSERT INTO `mydb`.`bestelling_bestelling`(`besetleling_id`,`date`,`total`,`personen_personen_persoon_id`) VALUES(null,NOW(),0,". $data->User .");");
$order_id = $mysqli->insert_id;

foreach($data->Rows as $row){
	if($row == null) continue;
	$total += $row->price;
	$queries[] = "INSERT INTO `mydb`.`bestelling_regels`(`idbestelling_regels`,`aantal`,`bestelling_bestelling_besetleling_id`,`product_product_product_id`,`personen_rechten_personen_personen_persoon_id`,`personen_personen_persoon_id`,`prijs`)VALUES(null,". $row->aantal .", ". $order_id.", ". $row->product .", ". $personel .", ". $data->User .", ". $row->price .");";
}

$queries[] = "UPDATE `mydb`.`bestelling_bestelling` SET `total`='". $total ."' WHERE `besetleling_id`='". $order_id ."';";
$queries[] = "UPDATE `mydb`.`persoon_rekening`  SET `saldo`=(saldo-". $total .") WHERE `rekening_id`='". $data->Account ."';";
$queries[] = "UPDATE `mydb`.`personen_personen` SET `last_order`=NOW() WHERE `persoon_id`='". $data->User ."';"; 

	foreach($queries as $query) {
		if(!$mysqli->query($query)) {
			$errors[$query] = $mysqli->error;
		}
	}
//echo '<pre>';
//print_r($queries);
//echo '</pre>';
if(isset($errors)) {
    $mysqli->rollback();
    foreach($errors as $sql => $error)
        echo '<pre>'.$error.' in SQL: '.$sql.'</pre>';
} else
    $mysqli->commit();

$mysqli->autocommit(TRUE);

exit;
?>