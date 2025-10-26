-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: 
-- USN: 
-- SECTION: 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
#'root@localhost', 'DESKTOP-MOFLSB2', '8.4.6', '2025-09-08 11:30:36'

create database labexp1;
use labexp1;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 

create table Employee(
       EmpID varchar(30) Unique Primary key,
       FirstName varchar(30),
       LastName varchar(30),
       Salary bigint,
       Birth_Date date,
       HireDate date);


-- 2. Insert 10 records to employee;
insert into Employee
values
("E0056","John","Smith",45000,'1975-04-11','2021-09-23'),
("E0125","Jack","Jones",54000,'1971-03-21','2014-08-27'),
("E0245", "Jane", "Doe", 62000, '1988-11-15', '2018-05-10'),
("E0310", "Michael", "Brown", 75000, '1972-07-30', '2012-02-14'),
("E0451", "Emily", "Davis", 48000, '1995-02-28', '2023-01-05'),
("E0599", "David", "Miller", 90000, '1965-09-01', '2005-11-20'),
("E0688", "Jessica", "Garcia", 58000, '1991-06-19', '2016-10-18'),
("E0701", "Chris", "Wilson", 67000, '1980-12-03', '2009-07-22'),
("E0823", "Sarah", "Martinez", 51000, '1993-08-25', '2020-03-01'),
("E0954", "Daniel", "Taylor", 82000, '1978-01-07', '2011-09-09');








-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table Orders(
        OrderId varchar(30) Unique Primary key,
        OrderDate date,
        totalAmount bigint,
        EmpId varchar(30),
        foreign key (EmpId) references Employee(EmpID));
	

-- 4. Insert 10 records to Orders
insert into Orders
values
("O892",'2024-03-11',21000,"E0056"),
("O893",'2024-03-12',15000,"E0125"),
("O894",'2024-03-13',35000,"E0245"),
("O895",'2024-03-14',18000,"E0310"),
("O896",'2024-03-15',42000,"E0451"),
("O897",'2024-03-16',29000,"E0599"),
("O898",'2024-03-17',11000,"E0688"),
("O899",'2024-03-18',55000,"E0701"),
("O900",'2024-03-19',28000,"E0823"),
("O901",'2024-03-20',33000,"E0954");

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.

select * from Employee;
select * from Orders;

-- Output: 
/*
# EmpID, FirstName, LastName, Salary, Birth_Date, HireDate
'E0056', 'John', 'Smith', '45000', '1975-04-11', '2021-09-23'
'E0125', 'Jack', 'Jones', '54000', '1971-03-21', '2014-08-27'
'E0245', 'Jane', 'Doe', '62000', '1988-11-15', '2018-05-10'
'E0310', 'Michael', 'Brown', '75000', '1972-07-30', '2012-02-14'
'E0451', 'Emily', 'Davis', '48000', '1995-02-28', '2023-01-05'
'E0599', 'David', 'Miller', '90000', '1965-09-01', '2005-11-20'
'E0688', 'Jessica', 'Garcia', '58000', '1991-06-19', '2016-10-18'
'E0701', 'Chris', 'Wilson', '67000', '1980-12-03', '2009-07-22'
'E0823', 'Sarah', 'Martinez', '51000', '1993-08-25', '2020-03-01'
'E0954', 'Daniel', 'Taylor', '82000', '1978-01-07', '2011-09-09'
*/

/*
# OrderId, OrderDate, totalAmount, EmpId
'O892', '2024-03-11', '21000', 'E0056'
'O893', '2024-03-12', '15000', 'E0125'
'O894', '2024-03-13', '35000', 'E0245'
'O895', '2024-03-14', '18000', 'E0310'
'O896', '2024-03-15', '42000', 'E0451'
'O897', '2024-03-16', '29000', 'E0599'
'O898', '2024-03-17', '11000', 'E0688'
'O899', '2024-03-18', '55000', 'E0701'
'O900', '2024-03-19', '28000', 'E0823'
'O901', '2024-03-20', '33000', 'E0954'
*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */

select round(salary) from Employee;
-- Output: 
/*
# round(salary)
'45000'
'54000'
'62000'
'75000'
'48000'
'90000'
'58000'
'67000'
'51000'
'82000'
*/

/* b. Absolute Values: Show absolute values of salaries */

select abs(salary) from Employee;
-- Output: 
/*
# abs(salary)
'45000'
'54000'
'62000'
'75000'
'48000'
'90000'
'58000'
'67000'
'51000'
'82000'
*/

/* c. Ceiling Values: Get ceiling values of order amounts */
select ceil(totalAmount) from Orders;

-- Output: 
/*
# ceil(totalAmount)
'21000'
'15000'
'35000'
'18000'
'42000'
'29000'
'11000'
'55000'
'28000'
'33000'
*/
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */

select count(*) from employee;
-- Output: 
/*
# count(*)
'10'
*/

/* b. Sum of Salaries: Calculate total salary expense */

select sum(salary) from employee;
-- Output: 
/*
# sum(salary)
'632000'
*/

/* c. Average Order Amount: Find average order value */

select avg(totalAmount) from Orders;
-- Output: 
/*
# avg(totalAmount)
'28700.0000'
*/

/* d. Max/Min Salary: Find highest and lowest salaries */

select max(salary),min(salary) from employee;
-- Output: 
/*
# max(salary), min(salary)
'90000', '45000'
*/

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */

select upper(firstName),lower(firstName) from employee;
-- Output: 

/*
# upper(firstName), lower(firstName)
'JOHN', 'john'
'JACK', 'jack'
'JANE', 'jane'
'MICHAEL', 'michael'
'EMILY', 'emily'
'DAVID', 'david'
'JESSICA', 'jessica'
'CHRIS', 'chris'
'SARAH', 'sarah'
'DANIEL', 'daniel'
*/

/* b. Concatenate Names: Create full names */

select concat(firstName,lastName) from employee;
-- Output: 
/*
# concat(firstName,lastName)
'JohnSmith'
'JackJones'
'JaneDoe'
'MichaelBrown'
'EmilyDavis'
'DavidMiller'
'JessicaGarcia'
'ChrisWilson'
'SarahMartinez'
'DanielTaylor'
*/

/* c. Extract Substring: Get first 3 characters of first names */

select substring(firstName,1,3) from employee;
-- Output: 

/*
# substring(firstName,1,3)
'Joh'
'Jac'
'Jan'
'Mic'
'Emi'
'Dav'
'Jes'
'Chr'
'Sar'
'Dan'
*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert DATE to text type */
select cast(Orderdate as char) from Orders;
-- Output: 
/*
# cast(Orderdate as char)
'2024-03-11'
'2024-03-12'
'2024-03-13'
'2024-03-14'
'2024-03-15'
'2024-03-16'
'2024-03-17'
'2024-03-18'
'2024-03-19'
'2024-03-20'
*/

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
select now();
-- Output: 
/*
# now()
'2025-09-08 12:19:43'
*/

/* b. Extract Year: Get year from order dates */
select year(Orderdate) from Orders;
-- Output: 
/*
# year(Orderdate)
2024
2024
2024
2024
2024
2024
2024
2024
2024
2024
*/

/* c. Add Months: Add 3 months to order dates */
select (month(Orderdate)+3) from Orders;
-- Output: 
/*
# (month(Orderdate)+3)
'6'
'6'
'6'
'6'
'6'
'6'
'6'
'6'
'6'
'6'
*/

/* d. Days Since Order: Calculate days between order date and now */
select datediff(curdate(),Orderdate) from Orders;

-- Output: 
/*
# datediff(curdate(),Orderdate)
'546'
'545'
'544'
'543'
'542'
'541'
'540'
'539'
'538'
'537'
*/
-- END of the Task -- 