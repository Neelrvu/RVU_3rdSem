create database Student;
use student;
create table Studentmarks(
     Usn varchar(20) unique primary key,
     Name varchar(30),
     Age int,
	 Course varchar(30),
     Marks1 int,
     Marks2 int,
     Marks3 int);
     
insert into Studentmarks
values
("USN001","Abhi",18,"B Tech",60,45,81),
("USN023","Karan",20,"BCA",40,23,61),
("USN031","John",21,"B.Sc",50,45,78),
("USN041","Martin",21,"B.Com",45,87,67),
("USN052","Neel",19,"BCA",54,67,21),
("USN115", "Amit", 20, "B.Sc", 67, 78, 83),
("USN124", "Ritu", 18, "BCA", 75, 80, 70),
("USN131", "Vikram", 22, "B.Com", 60, 55, 65),
("USN142", "Anjali", 19, "BBA", 82, 85, 88),
("USN156", "Rajesh", 21, "B.Tech", 45, 50, 48);

desc studentmarks;

alter table studentmarks
add total int,
add Average int,
add Grade varchar(5);

update studentmarks
set total=marks1+marks2+marks3;

update studentmarks
set average=total/3;

update studentmarks
set grade="Pass"
where marks1>=35 AND marks2>=35 AND marks3>=35;

update studentmarks
set grade="Fail"
where marks1<35 OR marks2<35 OR marks3<35;

select * from studentmarks;

/*
# Usn, Name, Age, Course, Marks1, Marks2, Marks3, total, Average, Grade
'USN001', 'Abhi', '18', 'B Tech', '60', '45', '81', '186', '62', 'Pass'
'USN023', 'Karan', '20', 'BCA', '40', '23', '61', '124', '41', 'Fail'
'USN031', 'John', '21', 'B.Sc', '50', '45', '78', '173', '58', 'Pass'
'USN041', 'Martin', '21', 'B.Com', '45', '87', '67', '199', '66', 'Pass'
'USN052', 'Neel', '19', 'BCA', '54', '67', '21', '142', '47', 'Fail'
'USN115', 'Amit', '20', 'B.Sc', '67', '78', '83', '228', '76', 'Pass'
'USN124', 'Ritu', '18', 'BCA', '75', '80', '70', '225', '75', 'Pass'
'USN131', 'Vikram', '22', 'B.Com', '60', '55', '65', '180', '60', 'Pass'
'USN142', 'Anjali', '19', 'BBA', '82', '85', '88', '255', '85', 'Pass'
'USN156', 'Rajesh', '21', 'B.Tech', '45', '50', '48', '143', '48', 'Pass'
*/
