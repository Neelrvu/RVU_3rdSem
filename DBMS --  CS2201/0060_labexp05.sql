-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: 
-- USN: 
-- SECTION: 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
/*
'root@localhost', 'RVU-PC-057', '8.4.6', '2025-09-22 05:52:49'
*/


-- Write your code below this line along with the output 

-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
create database labexp5;
use labexp5;

create table Customers(
       customer_id int PRIMARY KEY,
       customer_name varchar(50),
       city varchar(50));
       
-- insert 5 records
insert into Customers value
(101,"John","Bengaluru"),
(102, "Jane", "Mumbai"),
(103, "Peter", "Delhi"),
(104, "Sarah", "Chennai"),
(105, "Michael", "Hyderabad");


-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
    -- insert 5 records

create table Orders(
	   order_id int PRIMARY KEY,
       customer_id int,
       product_name varchar(50),
       order_date date,
       FOREIGN KEY (customer_id) references Customers(customer_id));
       
insert into Orders values
(1001,101,"Laptop",'2024-10-21'),
(1006, 105, "Wireless Mouse", '2024-03-15'),
(1007, 102, "External Hard Drive", '2023-11-01'),
(1008, 103, "Webcam", '2024-08-20'),
(1009, 101, "Graphics Card", '2022-09-10');

-- TASK FOR STUDENTS 

 
-- Write and Execute Queries
/*
1. Inner Join – 
   Find all orders placed by customers from the city "Bangalore."
   List all customers with the products they ordered.
   Show customer names and their order dates.
   Display order IDs with the corresponding customer names.
   Find the number of orders placed by each customer.
   Show city names along with the products ordered by customers.
*/

select Product_name from Orders
inner join Customers ON Orders.customer_id=Customers.customer_id
where Customers.city="Bengaluru";
/*
# Product_name
'Laptop'
'Graphics Card'
*/

Select Customer_name,Product_name
from Customers
inner join Orders ON  Orders.customer_id=Customers.customer_id;
/*
# Customer_name, Product_name
'John', 'Laptop'
'John', 'Graphics Card'
'Jane', 'External Hard Drive'
'Peter', 'Webcam'
'Michael', 'Wireless Mouse'
*/

Select Customer_name,Order_date
from Customers
inner join Orders ON  Orders.customer_id=Customers.customer_id;
/*
# Customer_name, Order_date
'John', '2024-10-21'
'John', '2022-09-10'
'Jane', '2023-11-01'
'Peter', '2024-08-20'
'Michael', '2024-03-15'
*/

select order_id,Customer_name
from Customers
inner join Orders ON Orders.customer_id=Customers.customer_id;
/*
# order_id, Customer_name
'1001', 'John'
'1009', 'John'
'1007', 'Jane'
'1008', 'Peter'
'1006', 'Michael'
*/

select customer_name,count(Orders.Customer_id)
from Customers
inner join Orders ON Orders.customer_id=Customers.customer_id
group by Customer_name;
/*
# customer_name, count(Orders.Customer_id)
'John', '2'
'Jane', '1'
'Peter', '1'
'Michael', '1'
*/

select city,Product_name
from Customers
inner join orders on Orders.customer_id=Customers.customer_id;
/*
# city, Product_name
'Bengaluru', 'Laptop'
'Bengaluru', 'Graphics Card'
'Mumbai', 'External Hard Drive'
'Delhi', 'Webcam'
'Hyderabad', 'Wireless Mouse'
*/


/* 
2  Left Outer Join – 
    Find all customers and their orders, even if a customer has no orders.
    List all customers and the products they ordered.
    Show customer IDs, names, and their order IDs.
    Find the total number of orders (if any) placed by each customer.
    Retrieve customers who have not placed any orders.
	Display customer names with their order dates.
-- Write your code below this line along with the output 
*/

select customer_name,Product_name
from Customers
left join Orders ON Customers.customer_id=Orders.customer_id;
/*
# customer_name, Product_name
'John', 'Laptop'
'John', 'Graphics Card'
'Jane', 'External Hard Drive'
'Peter', 'Webcam'
'Sarah', NULL
'Michael', 'Wireless Mouse'
*/

select customer_name,Product_name
from Customers
left join Orders ON Customers.customer_id=Orders.customer_id
where Product_Name IS not null;
/*
# customer_name, Product_name
'John', 'Laptop'
'Michael', 'Wireless Mouse'
'Jane', 'External Hard Drive'
'Peter', 'Webcam'
'John', 'Graphics Card'
*/

select Customers.customer_id,customer_name,Order_id
from Customers
left join Orders on Customers.customer_id=Orders.customer_id
where Order_id is not null;
/*
# customer_id, customer_name, Order_id
'101', 'John', '1001'
'101', 'John', '1009'
'102', 'Jane', '1007'
'103', 'Peter', '1008'
'105', 'Michael', '1006'
*/

select Customer_name,count(Orders.Customer_id)
from Customers
left join Orders on Customers.customer_id=Orders.customer_id
group by Customers.customer_name;
/*
# Customer_name, count(Orders.Customer_id)
'John', '2'
'Jane', '1'
'Peter', '1'
'Sarah', '0'
'Michael', '1'
*/

select customer_name
from Customers
left join Orders ON Customers.customer_id=Orders.customer_id
where Product_Name IS null;
/*
# customer_name
'Sarah'
*/

select customer_name,Order_date
from Customers
left join Orders ON Customers.customer_id=Orders.customer_id
where Order_date is not null;
/*
# customer_name, Order_date
'John', '2024-10-21'
'Michael', '2024-03-15'
'Jane', '2023-11-01'
'Peter', '2024-08-20'
'John', '2022-09-10'
*/


/* 3: Right Outer Join – 
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
      Show all orders with the customer names.
      Display product names with the customers who ordered them.
	  List order IDs with customer cities.
      Find the number of orders per customer (include those without orders).
	  Retrieve customers who do not have any matching orders.
     Write your code below this line along with the output 
 */

select Product_name,customer_name
from Customers
right join Orders on Orders.customer_id=Customers.customer_id;
/*
# Product_name, customer_name
'Laptop', 'John'
'Wireless Mouse', 'Michael'
'External Hard Drive', 'Jane'
'Webcam', 'Peter'
'Graphics Card', 'John'
*/

select Product_name,customer_name
from Customers
right join Orders on Orders.customer_id=Customers.customer_id;
/*
# Product_name, customer_name
'Laptop', 'John'
'Wireless Mouse', 'Michael'
'External Hard Drive', 'Jane'
'Webcam', 'Peter'
'Graphics Card', 'John'

*/

select Product_name,customer_name
from Customers
right join Orders on Orders.customer_id=Customers.customer_id;
/*
# Product_name, customer_name
'Laptop', 'John'
'Wireless Mouse', 'Michael'
'External Hard Drive', 'Jane'
'Webcam', 'Peter'
'Graphics Card', 'John'
*/

select Order_id,city
from Orders
right join Customers on Orders.customer_id=Customers.customer_id
where Order_id is not null;
/*
# Order_id, city
'1001', 'Bengaluru'
'1009', 'Bengaluru'
'1007', 'Mumbai'
'1008', 'Delhi'
'1006', 'Hyderabad'
*/

select count(orders.customer_id),Customer_name
from Orders
right join Customers on Orders.customer_id=customers.customer_id
group by customer_name;
/*
# count(orders.customer_id), Customer_name
'2', 'John'
'1', 'Jane'
'1', 'Peter'
'0', 'Sarah'
'1', 'Michael'
*/

select customer_name,order_id,Product_name
from Orders
right join customers on Orders.customer_id=customers.customer_id
where order_id is null;
/*
# customer_name, order_id, Product_name
'Sarah', NULL, NULL
*/


/* 4: Full Outer Join – 
        Find all customers and their orders, including those customers with no orders and orders without a customer.
        List all customers and products, whether they placed an order or not.
        Show customer IDs with order IDs (include unmatched ones).
		Display customer names with order dates.
		Find all unmatched records (customers without orders and orders without customers).
        Show customer cities with products.
     Write your code below this line along with the output 
  */

select Product_name,customer_name
from Customers
right join Orders on Orders.customer_id=Customers.customer_id
union
select customer_name,Product_name
from Customers
left join Orders ON Customers.customer_id=Orders.customer_id;
/*
# Product_name, customer_name
'Laptop', 'John'
'Wireless Mouse', 'Michael'
'External Hard Drive', 'Jane'
'Webcam', 'Peter'
'Graphics Card', 'John'
'John', 'Laptop'
'John', 'Graphics Card'
'Jane', 'External Hard Drive'
'Peter', 'Webcam'
'Sarah', NULL
'Michael', 'Wireless Mouse'
*/

select customer_name,product_name
from Customers
left join Orders on Orders.customer_id=customers.customer_id
union
select customer_name,product_name
from Orders
right join Customers on Orders.customer_id=customers.customer_id;


/*
# customer_name, product_name
'John', 'Laptop'
'John', 'Graphics Card'
'Jane', 'External Hard Drive'
'Peter', 'Webcam'
'Sarah', NULL
'Michael', 'Wireless Mouse'
*/

select Customers.Customer_id,order_id
from Customers
left join orders on orders.customer_id=customers.customer_id
union
select Customers.customer_id,order_id
from Orders
right join Customers on orders.customer_id=customers.customer_id;
/*
# Customer_id, order_id
'101', '1001'
'101', '1009'
'102', '1007'
'103', '1008'
'104', NULL
'105', '1006'
*/

select customer_name,order_date
from customers
left join orders on orders.customer_id=customers.customer_id
union
select customer_name,order_date
from Orders
right join Customers on orders.customer_id=customers.customer_id;
/*
# customer_name, order_date
'John', '2024-10-21'
'John', '2022-09-10'
'Jane', '2023-11-01'
'Peter', '2024-08-20'
'Sarah', NULL
'Michael', '2024-03-15'

*/

select customer_name,product_name
from customers
left join orders on orders.customer_id=customers.customer_id
where order_id is null or Customers.customer_id is null
union
select customer_name,order_date
from Orders
right join Customers on orders.customer_id=customers.customer_id
where order_id is null or Customers.customer_id is null;
/*
# customer_name, product_name
'Sarah', NULL
*/

select city,Product_name
from customers
left join orders on orders.customer_id=customers.customer_id
union
select city,Product_name
from Orders
right join Customers on orders.customer_id=customers.customer_id;
/*
# city, Product_name
'Bengaluru', 'Laptop'
'Bengaluru', 'Graphics Card'
'Mumbai', 'External Hard Drive'
'Delhi', 'Webcam'
'Chennai', NULL
'Hyderabad', 'Wireless Mouse'
*/


  /* 5: Natural Join – 
          Find all orders placed by customers.
          List all customers with the products they ordered using NATURAL JOIN.
          Show customer names along with their order dates using NATURAL JOIN.
          Find all customer cities and the products ordered by those customers using NATURAL JOIN.

     Write your code below this line along with the output 
  */
select Customers.Customer_id,Product_name
from Orders,customers
where customers.customer_id=orders.customer_id;
/*
# Customer_id, Product_name
'101', 'Laptop'
'105', 'Wireless Mouse'
'102', 'External Hard Drive'
'103', 'Webcam'
'101', 'Graphics Card'
*/

select Customer_name,Product_name
from Orders,customers
where customers.customer_id=orders.customer_id;
/*
# Customer_name, Product_name
'John', 'Laptop'
'Michael', 'Wireless Mouse'
'Jane', 'External Hard Drive'
'Peter', 'Webcam'
'John', 'Graphics Card'
*/

select Customer_name,Order_date
from Orders,customers
where customers.customer_id=orders.customer_id;
/*
# Customer_name, Order_date
'John', '2024-10-21'
'Michael', '2024-03-15'
'Jane', '2023-11-01'
'Peter', '2024-08-20'
'John', '2022-09-10'
*/

select Customer_name,city,Product_name
from Orders,customers
where customers.customer_id=orders.customer_id;
/*
# Customer_name, city, Product_name
'John', 'Bengaluru', 'Laptop'
'Michael', 'Hyderabad', 'Wireless Mouse'
'Jane', 'Mumbai', 'External Hard Drive'
'Peter', 'Delhi', 'Webcam'
'John', 'Bengaluru', 'Graphics Card'
*/


  -- END OF THE EXPERIMENT
