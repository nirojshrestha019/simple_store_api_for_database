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

if (isset($_GET['c_id'])) {
    $c_id = $params['c_id'];
}
else{
    $c_id = '';
}

if (isset($_GET['first_name'])) {
    $first_name = $params['first_name'];
}
else{
    $first_name = '';
}


if (isset($_GET['last_name'])) {
    $last_name = $params['last_name'];
}
else{
    $last_name = '';
}

if (isset($_GET['email'])) {
    $email = $params['email'];
}
else{
    $email = '';
}

if (isset($_GET['phone_number'])) {
    $phone_number = $params['phone_number'];
}
else{
    $phone_number = '';
}


// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// database connection will be here
// include database and object files
include_once '../config/database.php';
include_once '../customer/customer.php';



 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$customer = new Customer($db);
 

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    // select
    case 'GET':
        
    // read products will be here
    // query products
    $stmt = $customer->read($first_name, $last_name);
    $num = $stmt->rowCount();

     
    // check if more than 0 record found
    if($num>0){
     
        // products array
        $customer_arr=array();
        $customer_arr["customers"]=array();
     
        // retrieve our table contents
        // fetch() is faster than fetchAll()
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            // extract row
            // this will make $row['name'] to
            // just $name only
            extract($row);
     
            $customer_item=array(
                "c_id" => $c_id,
                "first_name" => $first_name,
                "last_name" => $last_name,
                "email" => $email,
                // "a_id" => $a_id,
                "phone_number" => $phone_number
            );
     
            array_push($customer_arr["customers"], $customer_item);
        }
     
        // set response code - 200 OK
        http_response_code(200);
     
        // show products data in json format
        echo json_encode($customer_arr);
    }
     
    // no products found will be here
    else{
     
        // set response code - 404 Not found
        http_response_code(404);
     
        // tell the user no products found
        echo json_encode(
            array("message" => "No customers found.")
        );

    }
    break;
    // update
    case 'PUT':
        echo "PUT";
        $stmt = $customer->update($c_id, $first_name, $last_name, $email, 
            $phone_number);
        // set response code - 200 OK
        http_response_code(200);
     
        // show products data in json format
        echo json_encode($stmt);


        break;
    // insert
    case 'POST':
        echo "POST";

        $stmt = $customer->insert($first_name, $last_name, $email, 
            $phone_number);
        // set response code - 200 OK
        http_response_code(200);
     
        // show products data in json format
        echo json_encode($stmt);

        break;
    // delete
    case 'DELETE':
        echo "DELETE";

        $stmt = $customer->delete($c_id);
        // $num = $stmt->rowCount();
        // set response code - 200 OK
        http_response_code(200);
     
        // show products data in json format
        echo json_encode($stmt);



        break;
    }
     


?>