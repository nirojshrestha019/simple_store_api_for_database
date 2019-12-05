<?php

if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') 
    $link = "https"; 
else
    $link = "http"; 
  
// Here append the common URL characters. 
$link .= "://"; 
  
// Append the host(domain name, ip) to the URL. 
$link .= $_SERVER['HTTP_HOST']; 
  
// Append the requested resource location to the URL 
$link .= $_SERVER['REQUEST_URI']; 

$url_components = parse_url($link); 
parse_str($url_components['query'], $params); 



if (isset($_GET['status'])) {
    $status = $params['status'];
}
else{
    $status = '';
}


if (isset($_GET['date_start'])) {
    $date_start = $params['date_start'];
}
else{
    $date_start = '';
}


if (isset($_GET['date_end'])) {
    $date_end = $params['date_end'];
}
else{
    $date_end = '';
}

// // // required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// database connection will be here
// include database and object files
include_once '../config/database.php';
include_once '../orders/orders.php';

 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$orders = new Orders($db);
 
// read products will be here
// query products
$stmt = $orders->read($status, $date_start, $date_end);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $orders_arr=array();
    $orders_arr["orders"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row

        extract($row);
 
        $order_item=array(
            "o_id" => $o_id,
            "c_id" => $c_id,
            "first_name" => $first_name,
            "last_name" => $last_name,
            "status" => $status,
            "date" => $date
        );
 
        array_push($orders_arr["orders"], $order_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show products data in json format
    echo json_encode($orders_arr);
}
 
// no products found will be here
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no products found
    echo json_encode(
        array("message" => "No orders found.")
    );
}