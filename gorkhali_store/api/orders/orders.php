<?php
class Orders{
 
    // database connection and table name
    private $conn;
    private $table_name = "orders";
 
    // object properties
    public $o_id;
    public $c_id;
    public $status;
    public $date;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }
    // read products
    function read($status, $date_start, $date_end){

        // select all query
        $query = "SELECT o.o_id, o.c_id, c.first_name, c.last_name, o.status, o.date FROM " . $this->table_name . " o INNER JOIN customer c ON c.c_id = o.c_id where o.status='"  . $status .     "' and o.date between '"   . $date_start .   "' and '"  . $date_end . "'";

        // echo $query;
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // execute query
        $stmt->execute();
     
        return $stmt;
    }



}
?>