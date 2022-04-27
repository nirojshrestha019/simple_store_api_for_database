# Simple store rest API using MySQL
This is simple rest api for a store named Gorkhali.
* gorkhali_store/api/config contains database.php to change the database login credentials

# Schema Design
This is our final database schema:
![Alt text](images/database_schema.png?raw=true "database_schema")

We came up with it by first listing all the necessary information, then normalizing it. Some changes such as variable size and switching foreign keys were done later as needed. Some improvements that could be made are allowing customers to have many phone numbers and emails but that wasn’t necessary for this database. Sale_price is how we track how much the item cost when it was purchased. If the website or whatever the database could be used for would like to show the cost reduction of the sale price there would need to be another variable.

##  Getting Data (Querying)
http://localhost/gorkhali_store/api/orders/read.php?status=completed&date_start=1990-01-01&date_end=2010-01-01
Where the parameters are status, date_start, and date_end. This retrieves all customers orders with dates between 1990 and 2010.
![Alt text](images/get_example_1.png?raw=true "get_example_1")
![Alt text](images/get_example_2.png?raw=true "get_example_2")


## Posting Data
Example of creating a customer:
http://localhost/gorkhali_store/api/customer/read.php?first_name=Jone&last_name=Cena&email=john@john.com&phone_number=1236987
Based off the schema, needs first_name, last_name, email, and a phone_number.
![Alt text](images/post_example_1.png?raw=true "post_example_1")
![Alt text](images/post_example_2.png?raw=true "post_example_2")

Shows POST was successful.


## Putting Data
Example of updating existing data.     
http://localhost/gorkhali_store/api/customer/read.php?first_name=Dywan&last_name=Johnson&email=rock@rock.com&phone_number=1236987&c_id=26
![Alt text](images/update_example_1.png?raw=true "update_example_1")
![Alt text](images/update_example_2.png?raw=true "update_example_2")

Same as POST

## Deleting data
Example of deleting existing data.
http://localhost/gorkhali_store/api/customer/read.php?c_id=26
Pass it the c_id.
![Alt text](images/delete_example_1.png?raw=true "delete_example_1")
![Alt text](images/delete_example_2.png?raw=true "delete_example_2")

Now that line is NULL.

