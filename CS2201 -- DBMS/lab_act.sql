
CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Doctors (
doctor_id INT PRIMARY KEY,
doctor_name VARCHAR(60),
specialty VARCHAR(50),
phone VARCHAR(20)
);

CREATE TABLE Patients (
patient_id INT PRIMARY KEY,
patient_name VARCHAR(60),
gender VARCHAR(10),
dob DATE,
city VARCHAR(40)
);

CREATE TABLE Appointments (
appointment_id INT PRIMARY KEY,
patient_id INT,
doctor_id INT,
appt_date DATETIME,
reason VARCHAR(255),
status VARCHAR(20),
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Doctors VALUES
(1,'Dr. Meera Joshi','Cardiology','+91-80-1234567'),
(2,'Dr. Arjun Rao','Orthopedics','+91-80-2345678'),
(3,'Dr. Leela Menon','Pediatrics','+91-80-3456789');

INSERT INTO Patients VALUES
(101,'Ramesh Kumar','Male','1985-03-12','Bangalore'),
(102,'Sangeeta Iyer','Female','1990-08-22','Mysore'),
(103,'Tara Fernandes','Female','2018-11-05','Hubli');

INSERT INTO Appointments VALUES
(1001,101,1,'2025-03-12 10:30:00','Chest pain','Completed'),
(1002,102,2,'2025-04-01 09:00:00','Knee pain','Scheduled'),
(1003,103,3,'2025-04-10 11:15:00','Routine check','Scheduled');

SELECT d.doctor_id, d.doctor_name, COUNT(a.patient_id) AS total_patients FROM Doctors d LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id GROUP BY d.doctor_id, d.doctor_name;


SELECT * FROM Appointments WHERE appt_date BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY) ORDER BY appt_date;

SELECT patient_name, dob, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) > 18;

DELIMITER //
CREATE PROCEDURE InsertAppointment(
  IN aid INT, IN pid INT, IN did INT, IN adt DATETIME, IN reas VARCHAR(255)
)
BEGIN
  INSERT INTO Appointments VALUES (aid, pid, did, adt, reas, 'Scheduled');
END //
DELIMITER ;

/*




*/



CREATE DATABASE Library;
USE Library;

CREATE TABLE Books (
book_id INT PRIMARY KEY,
title VARCHAR(25),
author VARCHAR(25),
total_copies INT,
available_copies INT
);

CREATE TABLE Members (
member_id INT PRIMARY KEY,
member_name VARCHAR(25),
join_date DATE,
city VARCHAR(50)
);

CREATE TABLE Issues (
issue_id INT PRIMARY KEY,
book_id INT,
member_id INT,
issue_date DATE,
return_date DATE,
returned BOOLEAN DEFAULT FALSE,
FOREIGN KEY (book_id) REFERENCES Books(book_id),
FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


INSERT INTO Books VALUES
(201,'Introduction to Algorithms','Cormen',5,4),
(202,'Design Patterns','Gamma',3,3),
(203,'Clean Code','Robert C. Martin',4,2);

INSERT INTO Members VALUES
(301,'Aditi Sharma','2024-01-10','Bangalore'),
(302,'Vikram Singh','2023-09-05','Mangalore');

INSERT INTO Issues VALUES
(4001,201,301,'2025-03-01',NULL, FALSE),
(4002,203,302,'2025-02-20','2025-03-05', TRUE);


SELECT m.member_id, m.member_name, COUNT(i.issue_id) AS books_issued FROM Members m LEFT JOIN Issues i ON m.member_id = i.member_id AND i.returned = FALSE GROUP BY m.member_id, m.member_name;


SELECT i.issue_id, m.member_name, b.title, i.issue_date, DATEDIFF(CURDATE(), i.issue_date) AS days_since_issue FROM Issues i JOIN Members m ON i.member_id = m.member_id JOIN Books b ON i.book_id = b.book_id WHERE i.returned = FALSE AND DATEDIFF(CURDATE(), i.issue_date) > 14;


DELIMITER //
CREATE PROCEDURE UpdateBookAvailability(
  IN bid INT, IN delta INT -- delta = -1 for issue, +1 for return
)
BEGIN
  UPDATE Books
  SET available_copies = available_copies + delta
  WHERE book_id = bid;
END //
DELIMITER ;

/*



*/

CREATE DATABASE Payroll;
USE Payroll;

CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);

CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(80),
dept_id INT,
hire_date DATE,
designation VARCHAR(50),
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Salaries (
salary_id INT PRIMARY KEY,
emp_id INT,
month_year VARCHAR(7), 
basic DECIMAL(10,2),
allowances DECIMAL(10,2),
deductions DECIMAL(10,2),
FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);


INSERT INTO Departments VALUES
(10,'Engineering','Bangalore'),
(20,'HR','Mysore');

INSERT INTO Employees VALUES
(501,'Karthik Rao',10,'2020-06-15','Software Engineer'),
(502,'Nisha Patel',20,'2019-11-01','HR Manager');

INSERT INTO Salaries VALUES
(9001,501,'2025-03',40000,5000,2000),
(9002,502,'2025-03',35000,3000,1500);


SELECT d.dept_name,
SUM(s.basic + s.allowances - s.deductions) AS total_payroll,
AVG(s.basic + s.allowances - s.deductions) AS avg_pay
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
JOIN Salaries s ON e.emp_id = s.emp_id
WHERE s.month_year = '2025-03'
GROUP BY d.dept_name;


SELECT e.emp_id, e.emp_name, d.dept_name, e.designation FROM Employees e JOIN Departments d ON e.dept_id = d.dept_id;


DELIMITER //
CREATE PROCEDURE UpsertSalary(
  IN sid INT, IN eid INT, IN my VARCHAR(7),
  IN basic_amt DECIMAL(10,2), IN allow DECIMAL(10,2), IN ded DECIMAL(10,2)
)
BEGIN
  INSERT INTO Salaries (salary_id, emp_id, month_year, basic, allowances, deductions)
  VALUES (sid, eid, my, basic_amt, allow, ded)
  ON DUPLICATE KEY UPDATE
    basic = VALUES(basic), allowances = VALUES(allowances), deductions = VALUES(deductions);
END //
DELIMITER ;

/*


*/

CREATE DATABASE  ECommerce;
USE ECommerce;

CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(80),
email VARCHAR(100),
city VARCHAR(50)
);

CREATE TABLE Products (
product_id INT PRIMARY KEY,
product_name VARCHAR(120),
price DECIMAL(10,2),
stock INT
);

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(12,2),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
price_at_order DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Customers VALUES
(701,'Rita Menon','rita@example.com','Bangalore'),
(702,'Suresh B','suresh@example.com','Hubli');

INSERT INTO Products VALUES
(801,'Wireless Mouse',799.00,50),
(802,'Laptop Stand',1299.00,30);

INSERT INTO Orders VALUES
(10001,701,'2025-03-15',2098.00);

INSERT INTO OrderItems VALUES
(1,10001,801,1,799.00),
(2,10001,802,1,1299.00);


SELECT p.product_id, p.product_name, SUM(oi.quantity * oi.price_at_order) AS total_sales,
SUM(oi.quantity) AS units_sold
FROM Products p
JOIN OrderItems oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;


SELECT product_id, product_name, units_sold FROM (
  SELECT p.product_id, p.product_name, SUM(oi.quantity) AS units_sold
  FROM Products p JOIN OrderItems oi ON p.product_id = oi.product_id
  GROUP BY p.product_id, p.product_name
) t ORDER BY units_sold DESC LIMIT 1;

DELIMITER //
CREATE PROCEDURE ReduceStock(IN pid INT, IN qty INT)
BEGIN
  UPDATE Products SET stock = stock - qty WHERE product_id = pid;
END //
DELIMITER ;

/*




*/

CREATE DATABASE School;
USE School;

CREATE TABLE Classes (
class_id INT PRIMARY KEY,
class_name VARCHAR(50),
teacher_incharge VARCHAR(80)
);

CREATE TABLE Students (
student_id INT PRIMARY KEY,
student_name VARCHAR(80),
dob DATE,
class_id INT,
FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE Marks (
mark_id INT PRIMARY KEY,
student_id INT,
subject VARCHAR(60),
marks INT,
exam_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


INSERT INTO Classes VALUES (1,'10A','Ms. Priya Rao'), (2,'9B','Mr. Vinod Kumar');
INSERT INTO Students VALUES
(1001,'Aman Gupta','2009-02-10',1),
(1002,'Meera Nair','2010-05-22',2);

INSERT INTO Marks VALUES
(5001,1001,'Math',88,'2025-03-10'),
(5002,1001,'Science',76,'2025-03-12'),
(5003,1002,'Math',92,'2025-03-10');


SELECT c.class_name, AVG(m.marks) AS avg_marks
FROM Classes c
JOIN Students s ON c.class_id = s.class_id
JOIN Marks m ON s.student_id = m.student_id
GROUP BY c.class_name;


SELECT s.student_name, c.class_name, m.subject, m.marks
FROM Marks m
JOIN Students s ON m.student_id = s.student_id
JOIN Classes c ON s.class_id = c.class_id
ORDER BY s.student_name, m.subject;


DELIMITER //
CREATE PROCEDURE InsertStudent(
  IN sid INT, IN sname VARCHAR(80), IN sd DATE, IN cid INT
)
BEGIN
  INSERT INTO Students VALUES (sid, sname, sd, cid);
END //
DELIMITER ;

/*



*/

CREATE DATABASE Banking;
USE Banking;

CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(80),
city VARCHAR(50)
);

CREATE TABLE Accounts (
account_id INT PRIMARY KEY,
customer_id INT,
account_type VARCHAR(20),
balance DECIMAL(15,2),
opened_date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
txn_id INT PRIMARY KEY,
account_id INT,
txn_date DATETIME,
amount DECIMAL(12,2),
txn_type VARCHAR(10),
description VARCHAR(255),
FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);


INSERT INTO Customers VALUES (401,'Deepak Joshi','Bangalore'), (402,'Anita Rao','Mysore');
INSERT INTO Accounts VALUES (6001,401,'Savings',50000.00,'2020-01-10'), (6002,402,'Current',150000.00,'2018-07-05');

INSERT INTO Transactions VALUES
(7001,6001,'2025-03-01 10:00:00',5000.00,'credit','Salary'),
(7002,6001,'2025-03-05 15:30:00',2000.00,'debit','ATM Withdrawal');


SELECT account_id, SUM(CASE WHEN txn_type='credit' THEN amount ELSE 0 END) AS total_credits,
SUM(CASE WHEN txn_type='debit' THEN amount ELSE 0 END) AS total_debits
FROM Transactions
WHERE txn_date BETWEEN '2025-03-01' AND '2025-03-31'
GROUP BY account_id;


SELECT MAX(amount) AS max_txn, MIN(amount) AS min_txn FROM Transactions;


DELIMITER //
CREATE PROCEDURE InsertTransaction(
  IN tid INT, IN aid INT, IN tdt DATETIME, IN amt DECIMAL(12,2), IN ttype VARCHAR(10), IN descp VARCHAR(255)
)
BEGIN
  INSERT INTO Transactions VALUES (tid, aid, tdt, amt, ttype, descp);
  IF ttype = 'credit' THEN
    UPDATE Accounts SET balance = balance + amt WHERE account_id = aid;
  ELSE
    UPDATE Accounts SET balance = balance - amt WHERE account_id = aid;
  END IF;
END //
DELIMITER ;

/*



*/


CREATE DATABASE Flight;
USE Flight;

CREATE TABLE Flights (
flight_id INT PRIMARY KEY,
flight_no VARCHAR(10),
origin VARCHAR(50),
destination VARCHAR(50),
capacity INT
);

CREATE TABLE Passengers (
passenger_id INT PRIMARY KEY,
passenger_name VARCHAR(80),
passport_no VARCHAR(30)
);

CREATE TABLE Bookings (
booking_id INT PRIMARY KEY,
flight_id INT,
passenger_id INT,
booking_date DATE,
seat_no VARCHAR(10),
status VARCHAR(20),
FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);


INSERT INTO Flights VALUES (900,'AI101','Bangalore','Delhi',180),(901,'AI102','Mysore','Bangalore',120);
INSERT INTO Passengers VALUES (2001,'Ravi Kumar','P1234567'),(2002,'Priya Shah','P7654321');
INSERT INTO Bookings VALUES (8001,900,2001,'2025-04-01','12A','Confirmed'),(8002,901,2002,'2025-04-02','5C','Confirmed');


SELECT f.flight_no, COUNT(b.passenger_id) AS passengers_count
FROM Flights f
LEFT JOIN Bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_id, f.flight_no;


SELECT p.passenger_name, f.flight_no, f.origin, f.destination, b.seat_no
FROM Bookings b
JOIN Passengers p ON b.passenger_id = p.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id
WHERE p.passenger_id = 2001;


DELIMITER //
CREATE PROCEDURE InsertBooking(
  IN bid INT, IN fid INT, IN pid INT, IN bdate DATE, IN seat VARCHAR(10)
)
BEGIN
  DECLARE booked_count INT;
  SELECT COUNT(*) INTO booked_count FROM Bookings WHERE flight_id = fid AND status='Confirmed';
  DECLARE cap INT;
  SELECT capacity INTO cap FROM Flights WHERE flight_id = fid;
  IF booked_count < cap THEN
    INSERT INTO Bookings VALUES (bid, fid, pid, bdate, seat, 'Confirmed');
  ELSE
    INSERT INTO Bookings VALUES (bid, fid, pid, bdate, seat, 'Waitlisted');
  END IF;
END //
DELIMITER ;

/*




*/



CREATE DATABASE  Hotel;
USE Hotel;

CREATE TABLE Rooms (
room_id INT PRIMARY KEY,
room_type VARCHAR(50), -- e.g., Deluxe, Suite
price_per_night DECIMAL(8,2),
is_available BOOLEAN DEFAULT TRUE
);

CREATE TABLE Guests (
guest_id INT PRIMARY KEY,
guest_name VARCHAR(80),
phone VARCHAR(30)
);

CREATE TABLE Bookings (
booking_id INT PRIMARY KEY,
guest_id INT,
room_id INT,
check_in DATE,
check_out DATE,
total_amount DECIMAL(10,2),
FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);


INSERT INTO Rooms VALUES (1,'Deluxe',3500.00,TRUE),(2,'Suite',8000.00,TRUE);
INSERT INTO Guests VALUES (501,'Mr. Shankar','+91-9876543210');
INSERT INTO Bookings VALUES (1101,501,1,'2025-04-05','2025-04-08',3500.00*3);


SELECT r.room_type, SUM(b.total_amount) AS revenue
FROM Rooms r
JOIN Bookings b ON r.room_id = b.room_id
GROUP BY r.room_type;


SELECT booking_id, guest_id, room_id, check_in, check_out, DATEDIFF(check_out, check_in) AS nights
FROM Bookings;


DELIMITER //
CREATE PROCEDURE InsertRoomBooking(
  IN bid INT, IN gid INT, IN rid INT, IN cin DATE, IN cout DATE
)
BEGIN
  DECLARE nights INT;
  SET nights = DATEDIFF(cout, cin);
  DECLARE price DECIMAL(10,2);
  SELECT price_per_night INTO price FROM Rooms WHERE room_id = rid;
  INSERT INTO Bookings VALUES (bid, gid, rid, cin, cout, price * nights);
  UPDATE Rooms SET is_available = FALSE WHERE room_id = rid;
END //
DELIMITER ;

/*


*/


CREATE DATABASE  Inventory;
USE Inventory;

CREATE TABLE Suppliers (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(100),
contact VARCHAR(50)
);

CREATE TABLE Products (
product_id INT PRIMARY KEY,
product_name VARCHAR(120),
unit_price DECIMAL(10,2)
);

CREATE TABLE Supplies (
supply_id INT PRIMARY KEY,
supplier_id INT,
product_id INT,
supply_date DATE,
quantity INT,
FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Suppliers VALUES (301,'ABC Supplies','abc@supplies.com'),(302,'Global Traders','global@t.com');
INSERT INTO Products VALUES (401,'Screws Pack',50.00),(402,'Nails Box',30.00);
INSERT INTO Supplies VALUES (1,301,401,'2025-02-20',100),(2,302,402,'2025-03-01',200);


SELECT s.supplier_name, SUM(sp.quantity) AS total_qty
FROM Suppliers s
JOIN Supplies sp ON s.supplier_id = sp.supplier_id
GROUP BY s.supplier_name;


SELECT * FROM Supplies WHERE supply_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);


DELIMITER //
CREATE PROCEDURE InsertSupply(
  IN sid INT, IN suppid INT, IN pid INT, IN sdate DATE, IN qty INT
)
BEGIN
  INSERT INTO Supplies VALUES (sid, suppid, pid, sdate, qty);
END //
DELIMITER ;

/*




*/

CREATE DATABASE  Cinema;
USE Cinema;

CREATE TABLE Movies (
movie_id INT PRIMARY KEY,
title VARCHAR(150),
duration_min INT
);

CREATE TABLE Shows (
show_id INT PRIMARY KEY,
movie_id INT,
show_time DATETIME,
hall VARCHAR(20),
capacity INT,
FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE Bookings (
booking_id INT PRIMARY KEY,
show_id INT,
customer_name VARCHAR(80),
tickets INT,
booking_time DATETIME,
FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);


INSERT INTO Movies VALUES (1,'Space Odyssey',140),(2,'Romantic Tale',120);
INSERT INTO Shows VALUES (11,1,'2025-04-10 18:00:00','Hall 1',200),(12,2,'2025-04-10 20:00:00','Hall 2',150);
INSERT INTO Bookings VALUES (9001,11,'Anu',2,'2025-04-01 10:00:00'),(9002,11,'Raghu',3,'2025-04-01 11:00:00');


SELECT m.title, SUM(b.tickets) AS tickets_sold
FROM Movies m
JOIN Shows s ON m.movie_id = s.movie_id
LEFT JOIN Bookings b ON s.show_id = b.show_id
GROUP BY m.movie_id, m.title;


SELECT b.booking_id, b.customer_name, m.title, s.show_time, b.tickets
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
ORDER BY b.booking_time;


DELIMITER //
CREATE PROCEDURE AddBooking(
  IN bid INT, IN sid INT, IN cname VARCHAR(80), IN tcks INT
)
BEGIN
  DECLARE sold INT;
  SELECT IFNULL(SUM(tickets),0) INTO sold FROM Bookings WHERE show_id = sid;
  DECLARE cap INT;
  SELECT capacity INTO cap FROM Shows WHERE show_id = sid;
  IF sold + tcks <= cap THEN
    INSERT INTO Bookings VALUES (bid, sid, cname, tcks, NOW());
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough seats available';
  END IF;
END //
DELIMITER ;
