-- Lab Experiment 04: Implement arithmetic, logical, comparison, special, and set operators in SQL using the Employees and Departments tables.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: NEEL CHOWDHARY GONUGUNTLA
-- USN: 1RUA24BCA0060
-- SECTION: BCA
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
/*
'root@localhost', 'RVU-PC-057', '8.4.6', '2025-09-15 06:02:34'
*/
-- Write your code below this line along with the output 

create database dbmslab;
use dbmslab;

CREATE TABLE Employees (  
    EmployeeID INT PRIMARY KEY,  
    Name VARCHAR(100),  
    Age INT,  
    Salary DECIMAL(10,2),  
    DepartmentID INT,  
    HireDate DATE,  
    Address VARCHAR(255)  
);  


INSERT INTO Employees VALUES  
(1, 'Alice Johnson', 30, 60000, 1, '2020-03-15', '123 Main St, City A'),  
(2, 'Bob Smith', 28, 55000, 2, '2021-06-20', '456 Oak St, City B'),  
(3, 'Charlie Brown', 35, 75000, 3, '2019-01-10', '789 Pine St, City C'),  
(4, 'David Wilson', 40, 90000, 3, '2018-07-25', '101 Maple St, City D'),  
(5, 'Emma Davis', 27, 50000, 4, '2022-09-30', '202 Birch St, City E'),  
(6, 'Frank Miller', 32, 70000, 5, '2020-11-18', '303 Cedar St, City F'),  
(7, 'Grace Lee', 29, 58000, 1, '2021-04-05', '404 Walnut St, City G'),  
(8, 'Hank Adams', 45, 98000, 2, '2017-12-12', '505 Spruce St, City H'),  
(9, 'Ivy Green', 31, 64000, 4, '2023-02-14', '606 Redwood St, City I'),  
(10, 'Jack White', 38, 85000, 5, '2019-08-08', '707 Elm St, City J');  

-- TABLE:02 Department Table

CREATE TABLE Departments (  
    DepartmentID INT PRIMARY KEY,  
    DepartmentName VARCHAR(50)  
);  

INSERT INTO Departments VALUES  
(1, 'HR'),  
(2, 'Finance'),  
(3, 'Engineering'),  
(4, 'Marketing'),  
(5, 'Sales');  


-- TASK FOR STUDENTS 

/* 
Exercise 1: Arithmetic Operators
Addition, Subtraction, Multiplication, Division
Q1 - Add a bonus (10% of Salary) to each employee’s salary.

Q2 - Subtract tax (15% of Salary) from each employee’s salary.

Q3 - Calculate the yearly salary from the monthly salary.

-- Modulus Operator
Q4 - Find the remainder when employees’ ages are divided by 5.*/

-- Write your code below this line along with the output 


select name,salary,salary*1.1 from employees;
/*
# name, salary, salary*1.1
'Alice Johnson', '60000.00', '66000.000'
'Bob Smith', '55000.00', '60500.000'
'Charlie Brown', '75000.00', '82500.000'
'David Wilson', '90000.00', '99000.000'
'Emma Davis', '50000.00', '55000.000'
'Frank Miller', '70000.00', '77000.000'
'Grace Lee', '58000.00', '63800.000'
'Hank Adams', '98000.00', '107800.000'
'Ivy Green', '64000.00', '70400.000'
'Jack White', '85000.00', '93500.000'


*/

select name,salary,salary*0.85 from employees;
/*
# name, salary, salary*0.85
'Alice Johnson', '60000.00', '51000.0000'
'Bob Smith', '55000.00', '46750.0000'
'Charlie Brown', '75000.00', '63750.0000'
'David Wilson', '90000.00', '76500.0000'
'Emma Davis', '50000.00', '42500.0000'
'Frank Miller', '70000.00', '59500.0000'
'Grace Lee', '58000.00', '49300.0000'
'Hank Adams', '98000.00', '83300.0000'
'Ivy Green', '64000.00', '54400.0000'
'Jack White', '85000.00', '72250.0000'


*/

select salary*12 from employees as yearly_salary;
/*
# salary*12
'720000.00'
'660000.00'
'900000.00'
'1080000.00'
'600000.00'
'840000.00'
'696000.00'
'1176000.00'
'768000.00'
'1020000.00'

*/

select Age%5 from employees;
/*
# Age%5
'0'
'3'
'0'
'0'
'2'
'2'
'4'
'0'
'1'
'3'
*/



/* Exercise 2: Logical Operators: AND, OR, NOT

Q5 - Retrieve employees older than 30 AND with salary > 50000.

Q6 - Retrieve employees in the HR department (ID=1) OR earning > 70000.

Q7 - Retrieve employees NOT living in City G.*/




-- Write your code below this line along with the output 
select * from employees where  age>30 and salary>50000;
 /*
 # EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
'6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
'8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
'9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
'10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'

*/

select * from employees where departmentId=1 or salary>70000;
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
'7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
'8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
'10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'

*/

select * from employees where Address not like "%City G";
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
'2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
'5', 'Emma Davis', '27', '50000.00', '4', '2022-09-30', '202 Birch St, City E'
'6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
'8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
'9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
'10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'
*/

/* Exercise 3: Comparison Operators

Q8 - Equality, Inequality, Greater Than, Less Than

Q9 - Find employees with salary = 60000.

Q10 - List employees not in the IT department (no IT department exists; returns all).

Q11 - Retrieve employees younger than 25 with salary > 50000 

Q12 - List employees aged 25–35.

Q13 - Find employees in HR, Finance, or Engineering (IDs 1, 2, 3).

Q14 - Find employees with names starting with A.

Q15 - List employees with no address.

*/

-- Write your code below this line along with the output 
select * from employees where salary=60000;
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
*/

select * from departmentS where departmentname not in("IT");
/*
# DepartmentID, DepartmentName
'1', 'HR'
'2', 'Finance'
'3', 'Engineering'
'4', 'Marketing'
'5', 'Sales'
*/

select * from employees where age<25 and salary>50000;
/*

*/

select * from employees where age between 25 and 35;
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
'2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'5', 'Emma Davis', '27', '50000.00', '4', '2022-09-30', '202 Birch St, City E'
'6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
'7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
'9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
*/

select * from employees where departmentID in(1,2,3);
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
'2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
'7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
'8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
*/

select * from employees where name like "A%";
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
*/

select * from employees where address is null;
/*

*/


/* 

Exercise 5: Set Operators: UNION.

Q16 - Retrieve names from the HR department hired in 2022 OR 2023.

Q17 - Find common employees in the Engineering department (ID=3) hired before and after 2020.

Q18 - Find employees hired in 2023 but not in 2022.

*/

select * from employees where DepartmentID=1 and year(HireDate) in(2022,2023);
/*

*/

select * from employees where DepartmentID=3 and year(HireDate) not in(2020);
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'

*/

select * from employees where year(HireDate) in(2023);
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
*/
