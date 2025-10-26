-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : 'root@localhost', 'RVU-PC-014', '8.4.6', '2025-08-25 11:24:56'



-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
create database ClgStudent;
use ClgStudent;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
create table Departments
(   DepartmentID varchar(15) PRIMARY KEY UNIQUE,
    DepartmentName varchar(30),
    HOD varchar(30),
    ContactEmail varchar(300) UNIQUE,
    PhoneNumber bigint UNIQUE,
    Location varchar(200));
    
create table Course
(   CourseID varchar(15) PRIMARY KEY UNIQUE,
    CourseName varchar(30),
    Credits int,
    DepartmentID varchar(15) UNIQUE,
    FOREIGN KEY (DepartmentID) references Departments(DepartmentID),
    Duration int,
    Fee bigint);
    
create table Students
(   StudentID varchar(15) PRIMARY KEY UNIQUE,
    FirstName varchar(30),
    LastName varchar(30),
    Email varchar(300) UNIQUE,
    DataOfBirth date,
    CourseID varchar(15),
    FOREIGN KEY (CourseID) references Course(CourseID));
    
create table Faculty
(   FacultyID varchar(15) PRIMARY KEY UNIQUE,
    FacultyName varchar(30),
    DepartmentId varchar(15),
    FOREIGN KEY (DepartmentID) references Departments(DepartmentID),
    Qualification varchar(15),
    Email varchar(300) UNIQUE,
    PhoneNumber bigint UNIQUE);

create table Enrollments
(   EnrollmentID varchar(15) PRIMARY KEY UNIQUE,
    StudentID varchar(15),
    FOREIGN KEY (StudentID) references Students(StudentID),
    CourseID varchar(15),
    FOREIGN KEY (CourseID) references Course(CourseID),
    Semester int,
    EnrollmentDate date,
    Grade varchar(5));


-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

--  describe the structure of each table and copy paste the Output 
desc Departments;
/*
# Field, Type, Null, Key, Default, Extra
'DepartmentID', 'varchar(15)', 'YES', 'UNI', NULL, ''
'DepartmentName', 'varchar(30)', 'YES', '', NULL, ''
'HOD', 'varchar(30)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(300)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'bigint', 'YES', 'UNI', NULL, ''
'Location', 'varchar(200)', 'YES', '', NULL, ''
*/

desc Course;
/*
# Field, Type, Null, Key, Default, Extra
'CourseID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'varchar(15)', 'YES', 'UNI', NULL, ''
'Duration', 'int', 'YES', '', NULL, ''
'Fee', 'bigint', 'YES', '', NULL, ''
*/

desc Students;
/*
# Field, Type, Null, Key, Default, Extra
'StudentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(30)', 'YES', '', NULL, ''
'LastName', 'varchar(30)', 'YES', '', NULL, ''
'Email', 'varchar(300)', 'YES', 'UNI', NULL, ''
'DataOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'varchar(15)', 'YES', 'MUL', NULL, ''
*/

desc Faculty;
/*
# Field, Type, Null, Key, Default, Extra
'FacultyID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(30)', 'YES', '', NULL, ''
'DepartmentId', 'varchar(15)', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(300)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'bigint', 'YES', 'UNI', NULL, ''
*/

desc Enrollments;
/*
# Field, Type, Null, Key, Default, Extra
'EnrollmentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'Semester', 'int', 'YES', '', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
'Grade', 'varchar(5)', 'YES', '', NULL, ''
*/

-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
-- 02: Modify the existing column from each table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table

alter table Departments
add NumberOfCourses int,
add TotalStudents int;

alter table Departments
modify column DepartmentID varchar(20),
rename column ContactEmail to Email,
drop TotalStudents;

rename table Departments to DepartmentInfo;

desc DepartmentInfo;
/*
# Field, Type, Null, Key, Default, Extra
'DepartmentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(30)', 'YES', '', NULL, ''
'HOD', 'varchar(30)', 'YES', '', NULL, ''
'Email', 'varchar(300)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'bigint', 'YES', 'UNI', NULL, ''
'Location', 'varchar(200)', 'YES', '', NULL, ''
'NumberOfCourses', 'int', 'YES', '', NULL, ''
*/

alter table Course
add LeadFaculty varchar(30),
add TotalStudents int;

alter table Course
modify column CourseID varchar(20),
rename column Duration to NumberOfYears,
drop LeadFaculty;

rename table Course to CourseInfo;

desc CourseInfo;
/*
# Field, Type, Null, Key, Default, Extra
'CourseID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(30)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'varchar(15)', 'YES', 'UNI', NULL, ''
'NumberOfYears', 'int', 'YES', '', NULL, ''
'Fee', 'bigint', 'YES', '', NULL, ''
'TotalStudents', 'int', 'YES', '', NULL, ''
*/

alter table Students
add GuardianName varchar(30),
add Age int;

alter table Students
modify column StudentId varchar(20),
rename column DataOfBirth to DateOfBirth,
drop GuardianName;

rename table Students to StudentInfo;

desc StudentInfo;
/*
# Field, Type, Null, Key, Default, Extra
'StudentId', 'varchar(20)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(30)', 'YES', '', NULL, ''
'LastName', 'varchar(30)', 'YES', '', NULL, ''
'Email', 'varchar(300)', 'YES', 'UNI', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'Age', 'int', 'YES', '', NULL, ''
*/

alter table Faculty
add AssistantName varchar(30),
add YearsOfExperience int;

alter table Faculty
modify column FacultyId varchar(20),
rename column Email to EmailId,
drop AssistantName;

rename table Faculty to FacultyInfo;

desc facultyInfo;
/*
# Field, Type, Null, Key, Default, Extra
'FacultyId', 'varchar(20)', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(30)', 'YES', '', NULL, ''
'DepartmentId', 'varchar(15)', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(15)', 'YES', '', NULL, ''
'EmailId', 'varchar(300)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'bigint', 'YES', 'UNI', NULL, ''
'YearsOfExperience', 'int', 'YES', '', NULL, ''
*/

alter table Enrollments
add ParentName varchar(30),
add EnrollmentOfficer varchar(30);

alter table Enrollments
modify column EnrollmentId varchar(20),
rename column ParentName to Guardian,
drop EnrollmentOfficer;

rename table Enrollments to EnrollmentInfo;

desc EnrollmentInfo;
/*
# Field, Type, Null, Key, Default, Extra
'EnrollmentId', 'varchar(20)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'Semester', 'int', 'YES', '', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
'Grade', 'varchar(5)', 'YES', '', NULL, ''
'Guardian', 'varchar(30)', 'YES', '', NULL, ''
*/


/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

alter table StudentInfo
add Address varchar(100),
add Gender char(1);

alter table FacultyInfo
add JoiningDate date;

alter table CourseInfo
modify CourseName varchar(100);

alter table DepartmentInfo
modify Location varchar(80);

alter table FacultyInfo
rename column Qualification to Degree;

rename table FacultyInfo to Teachers;

alter table DepartmentInfo
drop PhoneNumber;

alter table StudentInfo
drop Email;

alter table CourseInfo
drop NumberOfYears;




SHOW TABLES; -- Before dropping the table
/*
# Tables_in_clgstudent
'courseinfo'
'departmentinfo'
'enrollmentinfo'
'studentinfo'
'teachers'
*/

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table EnrollmentInfo;

ALTER TABLE studentinfo DROP FOREIGN KEY studentinfo_ibfk_1;
ALTER TABLE CourseInfo 
DROP COLUMN CourseID;

drop table Courseinfo;

SHOW TABLES; -- After dropping the table Enrollement and Course
/*
# Tables_in_clgstudent
'departmentinfo'
'studentinfo'
'teachers'
*/

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01
