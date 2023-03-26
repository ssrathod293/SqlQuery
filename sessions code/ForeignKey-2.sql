use B19DB

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

insert into Course values(2, 'TESTING', 2, '12/11/2021', '02/11/2022'),
(3, 'PYTHON', 3, '03/20/2022', '09/20/2022')

create table Trainer
(
Id int primary key,
Name varchar(50),
Experience int 
)

insert into Trainer values (1, 'Vikul', 12), (2, 'Usha', 2), (3, 'Atul', 1)

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

alter table Student 
add TrainerId int foreign key references Trainer(Id) 


insert into Student values
(2, 'Mahesh', '123', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', 1, 1)

insert into Student values
(3, 'Kiran', '123', 'v@v.com', 'PAN1', 'ADHAAR1',20, 'Mumbai', 1, 2)

select * from Course 
select * from Trainer 
select * from Student
