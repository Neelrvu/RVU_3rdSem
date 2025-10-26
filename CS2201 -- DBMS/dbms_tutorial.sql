CREATE DATABASE EMPLOYEEES;
USE EMPLOYEEES;

CREATE TABLE Department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);

INSERT INTO Department values
(1, 'HR', 'Bangalore'),
(2, 'Development', 'Pune'),
(3, 'Sales', 'Mumbai'),
(4, 'Finance', 'Chennai');

CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
age INT,
salary DECIMAL(10,2),
designation VARCHAR(50),
address VARCHAR(100),
doj DATE,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Employee values
(101, 'Lewis Hamilton', 38, 50000, 'HR Executive', 'Bangalore', '2021-03-15', 1),
(102, 'Max Verstappen', 26, 70000, 'Developer', 'Pune', '2020-06-10', 2),
(103, 'Charles Leclerc', 27, 65000, 'Developer', 'Pune', '2022-01-20', 2),
(104, 'Lando Norris', 25, 55000, 'Sales Executive', 'Mumbai', '2019-09-05', 3),
(105, 'George Russell', 27, 60000, 'Accountant', 'Chennai', '2018-07-12', 4);

UPDATE Employee set salary = salary + 5000 where designation = 'Developer';

SELECT d.dept_name,count(e.emp_id) as total_employees,Avg(e.salary) as avg_salary,max(e.salary) as highest_salary, min(e.salary) as lowest_salary from Department d join Employee e on d.dept_id = e.dept_id group by d.dept_name;
/*
# dept_name, total_employees, avg_salary, highest_salary, lowest_salary
'HR', '1', '50000.000000', '50000.00', '50000.00'
'Development', '2', '72500.000000', '75000.00', '70000.00'
'Sales', '1', '55000.000000', '55000.00', '55000.00'
'Finance', '1', '60000.000000', '60000.00', '60000.00'
*/

SELECT upper(emp_name) as Employee_Name_Upper,upper(designation) as Designation_Upper,concat(emp_name, ' works as ', designation) as Employee_Info from Employee;
/*
# Employee_Name_Upper, Designation_Upper, Employee_Info
'LEWIS HAMILTON', 'HR EXECUTIVE', 'Lewis Hamilton works as HR Executive'
'MAX VERSTAPPEN', 'DEVELOPER', 'Max Verstappen works as Developer'
'CHARLES LECLERC', 'DEVELOPER', 'Charles Leclerc works as Developer'
'LANDO NORRIS', 'SALES EXECUTIVE', 'Lando Norris works as Sales Executive'
'GEORGE RUSSELL', 'ACCOUNTANT', 'George Russell works as Accountant'

*/
SELECT emp_name,YEAR(doj) as Joining_Year from Employee;
/*
# emp_name, Joining_Year
'Lewis Hamilton', '2021'
'Max Verstappen', '2020'
'Charles Leclerc', '2022'
'Lando Norris', '2019'
'George Russell', '2018'
*/

SELECT emp_name, salary from Employee e join Department d on e.dept_id = d.dept_id where salary between 40000 and 80000 and d.dept_name <> 'Sales';
/*
# emp_name, salary
'Lewis Hamilton', '50000.00'
'Max Verstappen', '75000.00'
'Charles Leclerc', '70000.00'
'George Russell', '60000.00'
*/

SELECT e.emp_name, e.designation, d.dept_name, d.location from Employee e inner join Department d on e.dept_id = d.dept_id;
/*
# emp_name, designation, dept_name, location
'Lewis Hamilton', 'HR Executive', 'HR', 'Bangalore'
'Max Verstappen', 'Developer', 'Development', 'Pune'
'Charles Leclerc', 'Developer', 'Development', 'Pune'
'Lando Norris', 'Sales Executive', 'Sales', 'Mumbai'
'George Russell', 'Accountant', 'Finance', 'Chennai'
*/

SELECT e.emp_name, d.dept_name from Employee e left join Department d on e.dept_id = d.dept_id;
/*
# emp_name, dept_name
'Lewis Hamilton', 'HR'
'Max Verstappen', 'Development'
'Charles Leclerc', 'Development'
'Lando Norris', 'Sales'
'George Russell', 'Finance'
*/

SELECT e.emp_name, d.dept_name from Employee e right join Department d on e.dept_id = d.dept_id;
/*
# emp_name, dept_name
'Lewis Hamilton', 'HR'
'Max Verstappen', 'Development'
'Charles Leclerc', 'Development'
'Lando Norris', 'Sales'
'George Russell', 'Finance'
*/

DELIMITER //
CREATE PROCEDURE InsertEmployee(
IN p_emp_id INT,
IN p_emp_name VARCHAR(100),
IN p_age INT,
IN p_salary DECIMAL(10,2),
IN p_designation VARCHAR(50),
IN p_address VARCHAR(100),
IN p_doj DATE,
IN p_dept_id INT
)
BEGIN
INSERT INTO Employee(emp_id, emp_name, age, salary, designation, address, doj, dept_id)
VALUES (p_emp_id, p_emp_name, p_age, p_salary, p_designation, p_address, p_doj, p_dept_id);
END //
DELIMITER ;
CALL InsertEmployee(106, 'Fernando Alonso', 42, 62000, 'Developer', 'Pune', '2023-05-01', 2);
/*


*/
DELIMITER //
CREATE PROCEDURE UpdateSalary(
    IN p_emp_id INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employee
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;
END //
DELIMITER ;

CALL UpdateSalary(102, 78000);

/*


*/

DELIMITER //
CREATE PROCEDURE DeleteEmployee(IN p_emp_id INT)
BEGIN
    DELETE FROM Employee WHERE emp_id = p_emp_id;
END //
DELIMITER ;

CALL DeleteEmployee(105);

/*


*/

SELECT e.emp_name as Employee_Name,d.dept_name as Department_Name,timestampdiff(year, e.doj, curdate()) as Years_Worked,(e.salary + case when e.designation = 'Developer' then 5000 else 0 end) as Salary_After_Increment from Employee e join Department d on e.dept_id = d.dept_id where timestampdiff(year, e.doj, CURDATE()) > 2;
/*
# Employee_Name, Department_Name, Years_Worked, Salary_After_Increment
'Lewis Hamilton', 'HR', '4', '50000.00'
'Max Verstappen', 'Development', '5', '83000.00'
'Charles Leclerc', 'Development', '3', '75000.00'
'Lando Norris', 'Sales', '6', '55000.00'
*/
