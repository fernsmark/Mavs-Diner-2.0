<?php

if($_SERVER["REQUEST_METHOD"]=="POST"){
	require 'conn.php';	
	clearComplete();
}

function clearComplete(){
	global $connect;
	
	$order_id= $_POST["order_id"];
	
	
	$query= "update Orders set order_status = 2 where order_id = {$order_id}";
	
	mysqli_query($connect,$query) or die (mysqli_error($connect));
	mysqli_close($connect);
}




?>