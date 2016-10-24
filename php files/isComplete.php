<?php
//echo "hello";
if($_SERVER["REQUEST_METHOD"]=="GET"){
	require 'conn.php';	
	isComplete();
}

function isComplete(){
	global $connect;
	
	//$restaurant_id = $_GET['restaurant_id'];
	
	$query= "select o.order_id as order_id,r.restaurant_name as restaurant_name, o.order_status as status ,c.restaurant_id as restaurant_id, c.customer_id as customer_id,f.food_item_name as food_item_name, c.quantity as quantity from Cart c, Orders o, Food_Item f, Restaurant r where c.customer_id = 123 and c.order_id=o.order_id and c.food_item_id= f.food_item_id and r.restaurant_id=c.restaurant_id " ;
		
	$result= mysqli_query($connect,$query);
	$number_of_rows= mysqli_num_rows($result);
	
	$temp_array= array();
	
	if($number_of_rows>0){
		while($row= mysqli_fetch_assoc($result)){
			$temp_array[]= $row;
		}
	}
	
	echo json_encode($temp_array);
	
	mysqli_close($connect);
}


?>