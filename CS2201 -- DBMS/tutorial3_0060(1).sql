create database schools;
use schools;

Create table Student (
S_ID INT PRIMARY KEY,
FName VARCHAR(20),
LName VARCHAR(20),
DOB DATE,
Class VARCHAR(5),
Marks INT,
City VARCHAR(25)
);

Create table Teacher (
T_ID int PRIMARY KEY,
FName VARCHAR(20),
LName VARCHAR(25),
Sub VARCHAR(20),
HireDate DATE,
Salary DECIMAL(10,2)
);

Create table Course (
C_ID INT PRIMARY KEY,
CName VARCHAR(30),
Credits int
);

Create table Enroll (
E_ID int PRIMARY KEY,
S_ID int,
C_ID int,
Grade varchar(5),
FOREIGN KEY (S_ID) REFERENCES Student(S_ID),
FOREIGN KEY (C_ID) REFERENCES Course(C_ID)
);

Insert into Student values
(1, 'Alex', 'Johnson', '1990-05-12', '101A', 88, 'Seattle'),
(2, 'Sarah', 'Chen', '1988-11-25', '203B', 91, 'Boston'),
(3, 'David', 'Rodriguez', '1995-03-08', '101A', 85, 'Denver'),
(4, 'Emily', 'Kim', '1992-07-19', '305C', 93, 'Austin'),
(5, 'Michael', 'Williams', '1987-09-01', '203B', 89, 'Chicago'),
(6, 'Jessica', 'Davis', '1994-04-30', '401D', 87, 'Miami'),
(7, 'Daniel', 'Miller', '1991-02-03', '305C', 90, 'Phoenix'),
(8, 'Olivia', 'Garcia', '1996-08-15', '101A', 86, 'Portland'),
(9, 'James', 'Brown', '1985-06-22', '401D', 92, 'Atlanta'),
(10, 'Sophia', 'Wilson', '1993-10-10', '203B', 84, 'Dallas');

insert into Teacher  values
(101, 'Liam', 'Patel', 'Computer Science', '2015-05-20', 45000),
(102, 'Olivia', 'Wang', 'Physics', '2018-09-10', 28000),
(103, 'Noah', 'Gomez', 'Chemistry', '2019-02-14', 33000),
(104, 'Emma', 'Schmidt', 'Biology', '2017-06-05', 250000),
(105, 'Mason', 'Dubois', 'Mathematics', '2016-11-28', 31000),
(106, 'Ava', 'Kovalenko', 'History', '2013-04-12', 19000),
(107, 'Jacob', 'Moreau', 'Sociology', '2020-01-08', 16000),
(108, 'Isabella', 'Lee', 'Literature', '2018-10-21', 220000),
(109, 'William', 'Chen', 'Psychology', '2017-08-03', 200000),
(110, 'Charlotte', 'Suzuki', 'Political Science', '2016-09-17', 170000);

Insert into Course values
(6, 'B.Tech', 4),
(7, 'BA in Economics', 3),
(8, 'BSc in Chemistry', 3),
(9, 'M.Tech', 2),
(10, 'PhD', 5);

INSERT INTO Enroll (E_ID, S_ID, C_ID, Grade) VALUES
(103, 1, 6, 'B'),
(117, 2, 7, 'A'),
(123, 3, 8, 'C'),
(163, 4, 9,'B'),
(194, 5, 10, 'A'),
(235, 6, 6, 'D'),
(463, 7, 7, 'C'),
(517,8, 8, 'B'),
(981, 9, 9, 'A');

Select * From Student;
/*

# S_ID, FName, LName, DOB, Class, Marks, City
'1', 'Alex', 'Johnson', '1990-05-12', '101A', '88', 'Seattle'
'2', 'Sarah', 'Chen', '1988-11-25', '203B', '91', 'Boston'
'3', 'David', 'Rodriguez', '1995-03-08', '101A', '85', 'Denver'
'4', 'Emily', 'Kim', '1992-07-19', '305C', '93', 'Austin'
'5', 'Michael', 'Williams', '1987-09-01', '203B', '89', 'Chicago'
'6', 'Jessica', 'Davis', '1994-04-30', '401D', '87', 'Miami'
'7', 'Daniel', 'Miller', '1991-02-03', '305C', '90', 'Phoenix'
'8', 'Olivia', 'Garcia', '1996-08-15', '101A', '86', 'Portland'
'9', 'James', 'Brown', '1985-06-22', '401D', '92', 'Atlanta'
'10', 'Sophia', 'Wilson', '1993-10-10', '203B', '84', 'Dallas'


*/

Select substring(CName, -3) from Course;
/*
# substring(CName, -3)
'ech'
'ics'
'try'
'ech'
'PhD'

*/

Select concat(FName, ' ', LName) from Teacher;
/*
# concat(FName, ' ', LName)
'Liam Patel'
'Olivia Wang'
'Noah Gomez'
'Emma Schmidt'
'Mason Dubois'
'Ava Kovalenko'
'Jacob Moreau'
'Isabella Lee'
'William Chen'
'Charlotte Suzuki'

*/

Select S_ID, (length(FName)+length(LName)) from Student;
/*
# S_ID, (length(FName)+length(LName))
'1', '11'
'2', '9'
'3', '14'
'4', '8'
'5', '15'
'6', '12'
'7', '12'
'8', '12'
'9', '10'
'10', '12'

*/

Select C_ID, replace(CName, 'BSc in Chemistry', 'BSc in Chem')from  Course;
/*
# C_ID, replace(CName, 'BSc in Chemistry', 'BSc in Chem')
'6', 'B.Tech'
'7', 'BA in Economics'
'8', 'BSc in Chem'
'9', 'M.Tech'
'10', 'PhD'

*/


Select (abs(max(marks))-abs(min(marks))) from student;
/*

# (abs(max(marks))-abs(min(marks)))
'9'

*/

Select T_ID, round(Salary,-3) from Teacher;
/*
# T_ID, round(Salary,-3)
'101', '45000'
'102', '28000'
'103', '33000'
'104', '250000'
'105', '31000'
'106', '19000'
'107', '16000'
'108', '220000'
'109', '200000'
'110', '170000'

*/

Select C_ID, sqrt(Credits) from Course;
/*
# C_ID, sqrt(Credits)
'6', '2'
'7', '1.7320508075688772'
'8', '1.7320508075688772'
'9', '1.4142135623730951'
'10', '2.23606797749979'

*/

Select Marks, ceil(Marks), floor(Marks) from Student;
/*
# Marks, ceil(Marks), floor(Marks)
'88', '88', '88'
'91', '91', '91'
'85', '85', '85'
'93', '93', '93'
'89', '89', '89'
'87', '87', '87'
'90', '90', '90'
'86', '86', '86'
'92', '92', '92'
'84', '84', '84'

*/

Select (sum(Marks) % 5) from Student;
/*

# (sum(Marks) % 5)
'0'

*/

Select now();
/*
# now()
'2025-09-10 23:35:42'

*/

Select T_ID, year(HireDate), month(HireDate) from Teacher;
/*

# T_ID, year(HireDate), month(HireDate)
'101', 2015, '5'
'102', 2018, '9'
'103', 2019, '2'
'104', 2017, '6'
'105', 2016, '11'
'106', 2013, '4'
'107', 2020, '1'
'108', 2018, '10'
'109', 2017, '8'
'110', 2016, '9'


*/

Select * from Student where month(DOB) = 1;
/*
 # S_ID, FName, LName, DOB, Class, Marks, City

*/

Select T_ID, datediff(now(), HireDate) from Teacher;
/*
# T_ID, datediff(now(), HireDate)
'101', '3766'
'102', '2557'
'103', '2400'
'104', '3019'
'105', '3208'
'106', '4534'
'107', '2072'
'108', '2516'
'109', '2960'
'110', '3280'

*/

Select count(*)FROM Student;
/*
'10'
*/

Select avg(Salary) from Teacher;
/*
'# avg(Salary)
'101200.000000'

*/

Select max(Marks), min(Marks) from Student;
/*

 max(Marks), min(Marks)
'95', '84'

*/




