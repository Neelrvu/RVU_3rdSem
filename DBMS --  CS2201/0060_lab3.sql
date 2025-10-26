-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
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
#'root@localhost', 'RVU-PC-057', '8.4.6', '2025-09-01 11:23:43'



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 
create database library;
use library;

create table books(
     Bookid varchar(30) unique primary key,
     Bname varchar(30),
     Bauthor varchar(30),
     YearPublished int,
     BCategory varchar(30),
     AvailableCopies int,
     TotalCopies int);
	  
create table Members(
     Memberid varchar(30) unique primary key,
     Mname varchar(30),
     PhoneNumber bigint,
     JoinDate date,
     Membership_Level varchar(30),
     Pending_Returns int,
     Number_of_borrows int);

drop table members;

-- Paste the Output below for the given command ( DESC TableName;) 
DESC books;
/*
# Field, Type, Null, Key, Default, Extra
'Bookid', 'varchar(30)', 'NO', 'PRI', NULL, ''
'Bname', 'varchar(30)', 'YES', '', NULL, ''
'Bauthor', 'varchar(30)', 'YES', '', NULL, ''
'YearPublished', 'int', 'YES', '', NULL, ''
'BCategory', 'varchar(30)', 'YES', '', NULL, ''
'AvailableCopies', 'int', 'YES', '', NULL, ''
'TotalCopies', 'int', 'YES', '', NULL, ''

*/

DESC Members;
/*
# Field, Type, Null, Key, Default, Extra
'Memberid', 'varchar(30)', 'NO', 'PRI', NULL, ''
'Mname', 'varchar(30)', 'YES', '', NULL, ''
'PhoneNumber', 'bigint', 'YES', '', NULL, ''
'JoinDate', 'date', 'YES', '', NULL, ''
'Membership_Level', 'varchar(30)', 'YES', '', NULL, ''
'Pending_Returns', 'int', 'YES', '', NULL, ''
'Number_of_borrows', 'int', 'YES', '', NULL, ''

*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

insert into books
values("0023","1984_The Black Swan","George Orwell",1949,"Fiction",4,10);


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM books;
/*
# Bookid, Bname, Bauthor, YearPublished, BCategory, AvailableCopies, TotalCopies
'0023', '1984_The Black Swan', 'George Orwell', '1949', 'Fiction', '4', '10'
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.


insert into members
values
("0048","David Lee",56566774,'2024-04-15',"Platinum",0,14),
("0056","Emma Wilson",46346339,'2024-05-22',"Silver",2,7);


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM members;
/*
# Memberid, Mname, PhoneNumber, JoinDate, Membership_Level, Pending_Returns, Number_of_borrows
'0048', 'David Lee', '56566774', '2024-04-15', 'Platinum', '0', '14'
'0056', 'Emma Wilson', '46346339', '2024-05-22', 'Silver', '2', '7'

*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

UPDATE books
set AvailableCopies=6,TotalCopies=12
where Bookid="0023";


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

SELECT * FROM books;
/*
# Bookid, Bname, Bauthor, YearPublished, BCategory, AvailableCopies, TotalCopies
'0023', '1984_The Black Swan', 'George Orwell', '1949', 'Fiction', '6', '12'
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

update members
set Membership_Level="Gold"
where Memberid="0056";


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM members;

/*
# Memberid, Mname, PhoneNumber, JoinDate, Membership_Level, Pending_Returns, Number_of_borrows
'0048', 'David Lee', '56566774', '2024-04-15', 'Platinum', '0', '14'
'0056', 'Emma Wilson', '46346339', '2024-05-22', 'Gold', '2', '7'
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

delete from members 
where Memberid="0048";


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

SELECT * FROM members;
/*
# Memberid, Mname, PhoneNumber, JoinDate, Membership_Level, Pending_Returns, Number_of_borrows
'0056', 'Emma Wilson', '46346339', '2024-05-22', 'Gold', '2', '7'
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

create table Borrow(
    Bookid varchar(30),
    foreign key (bookid) references books(bookid),
    BName varchar(30),
    Memberid varchar(30),
    MemberName varchar(30),
    foreign key (memberid) references members(memberid),
    Borrowdate date,
    Duration_in_days int);
    

insert into books
values("102","The Catcher in the Rye","JD Salinger",1951,"Fiction",5,10);

insert into Borrow
values("102","The Catcher in the Rye","0056","Emma Wilson",'2024-06-01',7);



-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM Borrow;
/*
# Bookid, BName, Memberid, MemberName, Borrowdate, Duration_in_days
'102', 'The Catcher in the Rye', '0056', 'Emma Wilson', '2024-06-01', '7'
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 