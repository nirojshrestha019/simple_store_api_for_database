<?php
class Customer{
 
    // database connection and table name
    private $conn;
    private $table_name = "customer";
 
    // object properties
    public $c_id;
    public $first_name;
    public $last_name;
    public $email;
    public $phone_number;


    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }
    // read products
    function read($first_name, $last_name){
      // first name and last name not null
      if ($first_name != '' && $last_name != ''){
         $query = "SELECT
                    c.c_id, c.first_name, c.last_name, c.email, c.phone_number
                FROM
                    " . $this->table_name . " c where c.first_name='"  . $first_name . "' and c.last_name='" . $last_name . "'";

      }
      // firstname not null and last name is empty
      elseif ($first_name != '' && empty($last_name)){
         $query = "SELECT
                    c.c_id, c.first_name, c.last_name, c.email, c.phone_number
                FROM
                    " . $this->table_name . " c where c.first_name='"  . $first_name . "'";

      }
      // lastname not null

      else
      {
         $query = "SELECT
                    c.c_id, c.first_name, c.last_name, c.email, c.phone_number
                FROM
                    " . $this->table_name . " c where c.last_name='"  . $last_name . "'";

      }
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // execute query
        $stmt->execute();
     
        return $stmt;
    }


    function insert($first_name, $last_name, $email, $phone_number)
     {
 
       $form_data = array(
        ':first_name'  => $first_name,
        ':last_name'  => $last_name,
        ':email'  => $email,
        ':phone_number'  => $phone_number
       );

       $query = "
       INSERT INTO " . $this->table_name .  
       " (first_name, last_name, email, phone_number) VALUES 
       (:first_name, :last_name, :email, :phone_number)
       ";
       $statement = $this->conn->prepare($query);
       $statement->execute($form_data);
       $num = $statement->rowCount();
       $data[] = array('success' => $num);
       return $data;
    }

  function delete($c_id)
   {
    $query = "DELETE FROM ". $this->table_name . " WHERE c_id = '".$c_id."'";
    $statement = $this->conn->prepare($query);
    $statement->execute();
    $num = $statement->rowCount();
    $data[] = array('success' => $num);
    return $data;
    
   }

  function update($c_id, $first_name, $last_name, $email, $phone_number)
   {
     $form_data = array(
      ':c_id' => $c_id,
      ':first_name' => $first_name,
      ':last_name'   => $last_name,
      ':email' => $email,
      ':phone_number'   => $phone_number
     );
     $query = "
     UPDATE ". $this->table_name . 
     " SET first_name = :first_name, last_name = :last_name, email = :email, email = :email, phone_number = :phone_number
     WHERE c_id = :c_id
     ";
     $statement = $this->conn->prepare($query);
     $statement->execute($form_data);
     $num = $statement->rowCount();
     $data[] = array('success' => $num);
     return $data;
   }

}
?>66665
5