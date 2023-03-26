use B19DB

drop table Course
drop table Student

create table Course
(
	CourseId int primary key,
	Name varchar(50),
	Duration int, 
	StartDate date,
	EndDate date
)

insert into Course values
(1, 'DOT NET', 6, '03/20/2022', '09/20/2022')
--(2, 'TESTING', 2, '12/11/2021', '02/11/2022')

insert into Course values(2, 'TESTING', 2, '12/11/2021', '02/11/2022'),
(3, 'PYTHON', 3, '03/20/2022', '09/20/2022')

create table Student
(
RollNumber int primary key,  
Name varchar(50),
Mobile varchar(10),
Email varchar(100),
PAN varchar(14),
Adhaar varchar(16),
Age int, 
City varchar(20),
CourseId int foreign key references Course(CourseId)
)

insert into Student values
(1, 'Vishal', '123', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', 1),
(2, 'Mahesh', '456', 'm@m.com', 'PAN2', 'ADHAAR2',20, 'Pune', 2)

insert into Student values
(3, 'Kiran', '1234', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', 100)

insert into Student values
(4, 'Snehal', '123456', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', null)

select * from Course 
select * from Student

-- what if we try to delete row from Student table 
delete from Student where RollNumber = 4 -- Snehal left 

-- what if we try to delete row from Course table 
delete from Course where CourseId = 1 
-- unable to delete because there are dependent records from Student table

-- Student table is depending on Course Table 
-- Student has CourseId column which is Foreign Key column referencing to Course Table CourseId
-- Table which contain FK call it as Foreign key table 
-- FKT referencing to table which contains PK call it as Primary key table 

-- Primary key table = Course
-- Foriegn key table = Student

-- when we try to delete records from "Primary key table" then what about those 
-- dependent records in "Foriegn key table" ?????

-- There are 4 behaviours of sql server 

-- 1 - no action 
	-- no action is default behaviour 
	-- when we try to delete records from "Primary key table" and if there are depenedent 
	-- records in forign key table then sql does not allow to delete 

drop table Student

create table Student
(
RollNumber int primary key,  
Name varchar(50),
Mobile varchar(10),
Email varchar(100),
PAN varchar(14),
Adhaar varchar(16),
Age int, 
City varchar(20),
CourseId int foreign key references Course(CourseId) on delete no action 
)

insert into Student values
(1, 'Vishal', '123', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', 1),
(2, 'Mahesh', '456', 'm@m.com', 'PAN2', 'ADHAAR2',20, 'Pune', 2)

select * from Course
select * from Student

-- try to Python records on which no Students are dependent 
delete from Course where CourseId = 3

-- try to Testing records on which Students are dependent 
delete from Course where CourseId = 2

-- 2 - set NULL 
	-- when we try to delete records from "Primary key table" and if there are depenedent 
	-- records in forign key table then sql set NULL values in foriegn key column  

drop table Student

create table Student
(
RollNumber int primary key,  
Name varchar(50),
Mobile varchar(10),
Email varchar(100),
PAN varchar(14),
Adhaar varchar(16),
Age int, 
City varchar(20),
CourseId int foreign key references Course(CourseId) on delete set null 
)

insert into Student values
(1, 'Vishal', '123', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', 1),
(2, 'Mahesh', '456', 'm@m.com', 'PAN2', 'ADHAAR2',20, 'Pune', 2)

select * from Course
select * from Student

-- try to Python records on which no Students are dependent 
delete from Course where CourseId = 3

-- try to Testing records on which Students are dependent 
delete from Course where CourseId = 2

-- 3 - set Default 
	-- when we try to delete records from "Primary key table" and if there are depenedent 
	-- records in forign key table then sql set default value in foriegn key column  

drop table Student

create table Student
(
RollNumber int primary key,  
Name varchar(50),
Mobile varchar(10),
Email varchar(100),
PAN varchar(14),
Adhaar varchar(16),
Age int, 
City varchar(20),
CourseId int default 1 foreign key references Course(CourseId) on delete set default 
)

insert into Student values
(1, 'Vishal', '123', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', 1),
(2, 'Mahesh', '456', 'm@m.com', 'PAN2', 'ADHAAR2',20, 'Pune', 2)

select * from Course
select * from Student

-- try to Python records on which no Students are dependent 
delete from Course where CourseId = 3

-- try to Testing records on which Students are dependent 
delete from Course where CourseId = 2


-- 4 - cascade 
	-- when we try to delete records from "Primary key table" and if there are depenedent 
	-- records in forign key table then sql deletes all those dependent records in foreign key table

drop table Student

create table Student
(
RollNumber int primary key,  
Name varchar(50),
Mobile varchar(10),
Email varchar(100),
PAN varchar(14),
Adhaar varchar(16),
Age int, 
City varchar(20),
CourseId int foreign key references Course(CourseId) on delete cascade 
)

insert into Student values
(1, 'Vishal', '123', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', 1),
(2, 'Mahesh', '456', 'm@m.com', 'PAN2', 'ADHAAR2',20, 'Pune', 2)

select * from Course
select * from Student

-- try to Python records on which no Students are dependent 
delete from Course where CourseId = 3

-- try to Testing records on which Students are dependent 
delete from Course where CourseId = 2