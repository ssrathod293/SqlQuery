use B19DB

select * from Student

insert into Student values(1, 'Vishal', 'Male')

drop table Student

-- create table 
-- ()paranthesis {}curly braces []square bracket <>angular bracket
create table Student
(
	RollNumber int, 
	Name varchar(50),
	Mobile varchar(14),
	Email varchar(100),
	PAN varchar(20),
	Adhaar varchar(14),
	CourseName varchar(20),
	DurationInMonths int,
	StartDate date,
	EndDate date
)

select * from Student

-- inserted one student to table

insert into Student 
values(1,'Vishal','+91 8956890522', 'vishal@gmail.com', 'PAN1', 'ADHAAR1', 
'DOT NET', 6, '03/20/2022', '09/20/2022')

-- add new column 
alter table Student add Age int 
alter table Student add City varchar(20) 

select * from Student

update Student set Age = 20, City = 'Sangali' where RollNumber = 1

insert into Student 
values(2,'Shital', null , null, 'PAN1', 'ADHAAR1', 
'DOT NET', 6, '03/20/2022', '09/20/2022', 24, 'Solapur')

drop table Student

create table Student
(
	RollNumber int primary key, 
	Name varchar(50),
	Mobile varchar(14) unique not null,
	Email varchar(100) unique not null,
	PAN varchar(20) unique not null,
	Adhaar varchar(14) unique,
	CourseName varchar(20),
	DurationInMonths int,
	StartDate date,
	EndDate date,
	Age int check (age >= 1 and age <= 150),
	City varchar(20) default 'Pune'
)


insert into Student 
(RollNumber, Name, Mobile, Email, PAN, ADHAAR, CourseName, DurationInMonths, StartDate,
EndDate, Age, City)
values(1,'Vishal','+91 8956890522', 'vishal@gmail.com', 'PAN1', 'ADHAAR1', 
'DOT NET', 6, '03/20/2022', '09/20/2022', 25, 'Sangali')

select * from Student

insert into Student 
(RollNumber, Name, Mobile, Email, PAN, ADHAAR, CourseName, DurationInMonths, StartDate,
EndDate, Age, City)
values(2,'Shital','+91 8956890523', 'shital@gmail.com', 'PAN2', 'ADHAAR2', 
'DOT NET', 6, '03/20/2022', '09/20/2022', 25, 'Sangali')

insert into Student 
(RollNumber, Name, Mobile, Email, PAN, ADHAAR, CourseName, DurationInMonths, StartDate,
EndDate, Age, City)
values(3,'Mahesh','+91 8956890524', 'mahesh@gmail.com', 'PAN3', 'ADHAAR3', 
'DOT NET', 6, '03/20/2022', '09/20/2022', 25, 'Sangali')

insert into Student 
(RollNumber, Name, Mobile, Email, PAN, ADHAAR, CourseName, DurationInMonths, StartDate,
EndDate, Age, City)
values(4,'Bahubali','+91 8956890525', 'bahu@gmail.com', 'PAN4', null, 
'DOT NET', 6, '03/20/2022', '09/20/2022', 25, 'Sangali')

insert into Student 
(RollNumber, Name, Mobile, Email, PAN, ADHAAR, CourseName, DurationInMonths, StartDate,
EndDate, Age)
values(5,'Pushpa','+91 8956890526', 'pushpa@gmail.com', 'PAN5', 'ADHAAR5', 
'DOT NET', 6, '03/20/2022', '09/20/2022', 25)

insert into Student 
(RollNumber, Name, Mobile, Email, PAN, ADHAAR, CourseName, DurationInMonths, StartDate,
EndDate, Age)
values(6,'Rocky','+91 8956890527', 'duniya@gmail.com', 'PAN6', 'ADHAAR6', 
'DOT NET', 6, '03/20/2022', '09/20/2022', 149)

select * from Student


create table PrimarySchool
(
RollNumber int,
Name varchar(50),
Mobile varchar(10),
Gender varchar(10),
primary key(RollNumber, Name, Mobile) -- composite key
)

insert into PrimarySchool values (1, 'Mihaan', '123', 'Male')
insert into PrimarySchool values (2, 'Vihaan', '123', 'Male')

select * from PrimarySchool

insert into PrimarySchool values (3, 'Mihaan', '456', 'Male')
insert into PrimarySchool values (2, 'Vihaan', '123', 'Male')


