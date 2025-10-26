-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: Neel Chowdhary get		
-- USN: 1RUA24BCA0060
-- SECTION: BCA

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT :'root@localhost', 'RVU-PC-057', '8.4.6', '2025-08-18 11:35:05';


-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:
create database DBLab001;
use DBLab001;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:
create table Students
(  
   StudentID varchar(15) PRIMARY KEY,
   FirstName varchar(15),
   LastName varchar(15),
   Email varchar(300)  UNIQUE,
   DateOfBirth date
);
   


DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT :# Field, Type, Null, Key, Default, Extra
/*
'StudentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(15)', 'YES', '', NULL, ''
'LastName', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(300)', 'YES', 'UNI', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
*/


-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

alter table students
add marks1 int, 
add marks2 int;

alter table students
modify column FirstName varchar(60);

alter table students
rename column DateOfBirth to DOB;

alter table students
drop column Email;

rename table students to Studentdata;

desc Studentdata;
/*
# Field, Type, Null, Key, Default, Extra
'StudentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(60)', 'YES', '', NULL, ''
'LastName', 'varchar(15)', 'YES', '', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'marks1', 'int', 'YES', '', NULL, ''
'marks2', 'int', 'YES', '', NULL, ''
*/

-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table Courses
(
   CourseID varchar(15) PRIMARY KEY,
   CourseName varchar(30),
   Credits int
);


DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
/*
# Field, Type, Null, Key, Default, Extra
'CourseID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
*/

-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

alter table Courses
add Professor varchar(20),
add Asst_Professor varchar(20);

alter table Courses
modify column CourseID varchar(30);

alter table Courses
rename column Credits to CreditsNo;

alter table Courses
drop Asst_Professor;

rename table Courses to CourseData;

DESC CourseData;
/*
# Field, Type, Null, Key, Default, Extra
'CourseID', 'varchar(30)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'CreditsNo', 'int', 'YES', '', NULL, ''
'Professor', 'varchar(20)', 'YES', '', NULL, ''
*/

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table Enrollments
(  
   EnrollmentID varchar(15) PRIMARY KEY,
   StudentID varchar(15),
   FOREIGN KEY (StudentID) REFERENCES Studentdata(StudentId),
   CourseID varchar(30),
   FOREIGN KEY (CourseID) REFERENCES CourseData(CourseID),
   EnrollmentDate date
);

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
/*
# Field, Type, Null, Key, Default, Extra
'EnrollmentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(30)', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
*/

-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

alter table Enrollments
add StudentName varchar(20),
add GuardianName varchar(20);

alter table Enrollments
modify column CourseID varchar(50);

alter table Enrollments
rename column EnrollmentDate to DateOfEnrollment;

alter table Enrollments
drop GuardianName;

rename table Enrollments to EnrollmentData;

DESC EnrollmentData;
/*
# Field, Type, Null, Key, Default, Extra
'EnrollmentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(50)', 'YES', 'MUL', NULL, ''
'DateOfEnrollment', 'date', 'YES', '', NULL, ''
'StudentName', 'varchar(20)', 'YES', '', NULL, ''
*/

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
alter table StudentData
add PhoneNumber bigint;

rename table StudentData to Students;

DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]
/*
# Field, Type, Null, Key, Default, Extra
'StudentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(60)', 'YES', '', NULL, ''
'LastName', 'varchar(15)', 'YES', '', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'marks1', 'int', 'YES', '', NULL, ''
'marks2', 'int', 'YES', '', NULL, ''
'PhoneNumber', 'bigint', 'YES', '', NULL, ''
*/

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
alter table CourseData
modify column CreditsNo DECIMAL(5,2);

DESC CourseData;
/*
# Field, Type, Null, Key, Default, Extra
'CourseID', 'varchar(30)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'CreditsNo', 'int', 'YES', '', NULL, ''
'Professor', 'varchar(20)', 'YES', '', NULL, ''
*/

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table
/*
# Tables_in_dblab001
'coursedata'
'enrollmentdata'
'students'
*/
-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table enrollmentdata;
drop table coursedata;

SHOW TABLES; -- After dropping the table Enrollement and Course
/*
# Tables_in_dblab001
'students'
*/

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01

