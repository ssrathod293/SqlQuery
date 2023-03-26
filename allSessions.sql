--to write query within our database
use bb19db
--create table
create table Student
(
RollNumber int,
Name varchar(50),
Gender varchar(10)
)
--rename table
execute sp_rename 'Student','StudentV1'
execute sp_rename 'StudentV1','Student'
insert into Student(RollNumber,Name,Gender) values(1,'Rahul','Male')
insert into Student values(2,'Nikita','Female')
--insert into Student values(1,'Nikita','Female')
insert into Student values(3,'Akshay','male'),(4,'Nikhil','Male')


--select fetch rows
select RollNumber,Name,Gender from Student

--update records
update Student set RollNumber=100
update Student set RollNumber=1 where Name='Rahul';
update Student set RollNumber=2,Name='Nikita Chavan' where Name='Nikita';

--delete records
delete from Student

delete from Student where RollNumber=2
truncate table Student--it delete table schema

select *from student--
--add new column
alter table Student
add  Email varchar(20)
insert into Student values(5,'Suraj','Male','s@s.com')
--deleting existing column
alter table Student
drop column Email

--drop table Student



----session4----
drop table Student
create table Student
(
RollNumber int ,
Name varchar(30),
Mobile varchar(15),
Email varchar(20),
PAN varchar(20),
Adhar varchar(14),
CourseName varchar(20),
DurationInMonths int,
StartDate date,
EndDate date
)
select *from Student
insert into Student values(1,'vishal','789876543','v2v.com','dgh34567'
,'2567895908','dotnet',5,'03/20/2021','08/20/2022')
alter table Student add Age int
alter table Student add City varchar(20)
update Student set Age=20,City='Sangali' where RollNumber=1
insert into Student values(2,'shital',89764567,'shital@.com','pan2'
,'adhar2','dotnet',5,'03/20/2021','08/20/2022',24,'solapur')
update  Student
set Rollnumber=2 where Name='shital'


drop table Student

create table Student
(
RollNumber int primary key ,
Name varchar(30),
Mobile varchar(15) unique not null,
Email varchar(20) unique not null,
PAN varchar(20) unique not null,
Adhar varchar(14) unique,
CourseName varchar(20),
DurationInMonths int,
StartDate date,
EndDate date,
Age int check(age>=1 and age <=150),
City varchar(20) default 'pune'
)
insert into Student (RollNumber,Name,Mobile,Email,PAN,Adhar,CourseName,DurationInMonths,StartDate
,EndDate,Age,City)
values(1,'vishal','789876543','v2v.com','pan1'
,'adhar1','dotnet',5,'03/20/2021','08/20/2022',25,'sangali')
insert into Student
values(3,'mahesh','7898765467','v2fh.com','pan3'
,'adhar3','dotnet',5,'03/20/2021','08/20/2022',25,'sangli')
insert into Student
values(5,'bahubali','7887456467','vfh.com','pan5'
,'adhar5','dotnet',5,'03/20/2021','08/20/2022',25,'sangli')
insert into Student
values(6,'pushpa','7997456467','pup@com','pan6'
,'adhar6','dotnet',5,'03/20/2021','08/20/2022',100)
select *from Student

-----------------------------------------------------------
create table primarySchool
(
RollNumber int ,
Name varchar(20),
Mobile varchar(15),
Gender varchar(23),
primary key(RollNumber,Name,Mobile)--composite key
)
insert into primarySchool values(1,'Mihan','123','Male')
insert into primarySchool values(2,'Vihan','123','Male')
select *from primarySchool
insert into primarySchool values(3,'Mihan','456','Male')
insert into primarySchool values(2,'Vihan','123','Male')
--drop table primarySchool

----------------------------------------------------------------------
-----session5------------------
select *from Student
drop table Student

drop table Course
drop table Student

create table Course(
CourseId int primary key,
Name varchar(23),
Duration int,
StartDate date,
EndDate date
)
insert into Course values (1,'dotnet',6,'03/20/2022','09/20/2022'),
(2,'testing',2,'03/20/2022','05/20/2022')
insert into Course values(3,'python',3,'03/20/2022','05/20/2022')
create table Student
(
RollNumber int primary key,
Name varchar(20),
Mobile varchar(30),
Email varchar(24),
Pan varchar(14),
Adhaar varchar(34),
Age int,
City varchar(20),
CourseId int foreign key references Course(CourseId)
)
insert into Student values
(1,'vishal','123','v@v.com','pan1','adhaar1',20,'mumbai',1),
(2,'mahesh','456','m@v.com','pan2','adhaar2',20,'pune',2)
insert into Student values
(3,'kiran','1234','v@k.com','pan3','adhaar3',20,'mumbai',100)
insert into Student values
(4,'snehal','12345','vsk.com','pan3','adhaar3',20,'mumbai',null)
select *from Course
select *from Student
--
delete from Student where RollNumber=4
--delete from course table
delete from Course where CourseId=1

-----4 bhehavior
drop table Student
create table Student
(
RollNumber int primary key,
Name varchar(20),
Mobile varchar(30),
Email varchar(24),
Pan varchar(14),
Adhaar varchar(34),
Age int,
City varchar(20),
CourseId int foreign key references Course(CourseId) on delete no action
)
insert into Student values
(1,'vishal','123','v@v.com','pan1','adhaar1',20,'mumbai',1),
(2,'mahesh','456','m@v.com','pan2','adhaar2',20,'pune',2)
select *from Course
select *from Student
drop table Student
--1--no action
--delete python record no student dependent
delete from Course where CourseId=3

--try to delete testing records on which students are depedent
delete from Course where CourseId=2

--set null
drop table Student
drop table Course
create table Course(
CourseId int primary key,
Name varchar(23),
Duration int,
StartDate date,
EndDate date
)
insert into Course values (1,'dotnet',6,'03/20/2022','09/20/2022')
insert into Course values(2,'testing',2,'03/20/2022','05/20/2022')
insert into Course values(3,'python',3,'03/20/2022','05/20/2022')
create table Student
(
RollNumber int primary key,
Name varchar(20),
Mobile varchar(30),
Email varchar(24),
Pan varchar(14),
Adhaar varchar(34),
Age int,
City varchar(20),
CourseId int foreign key references Course(CourseId) on delete set null
)
insert into Student values
(1,'vishal','123','v@v.com','pan1','adhaar1',20,'mumbai',1),
(2,'mahesh','456','m@v.com','pan2','adhaar2',20,'pune',2)

delete from Course where CourseId=3
delete from Course where CourseId=2
select *from Course
select *from Student

--set default
drop table student
create table Student
(
RollNumber int primary key,
Name varchar(20),
Mobile varchar(30),
Email varchar(24),
Pan varchar(14),
Adhaar varchar(34),
Age int,
City varchar(20),
CourseId int default 1 foreign key references Course(CourseId) on delete set default
)
insert into Student values
(1,'vishal','123','v@v.com','pan1','adhaar1',20,'mumbai',1),
(2,'mahesh','456','m@v.com','pan2','adhaar2',20,'pune',2)

select *from Student
select *from Course
delete from Course where CourseId=2

create table trainer(
Id int primary key,
Name varchar(20),
experiance int
)
insert into trainer values(1,'vikul',12),(2,'usha',2),(3,'atul',1)
--cascade
drop table student
create table Student
(
RollNumber int primary key,
Name varchar(20),
Mobile varchar(30),
Email varchar(24),
Pan varchar(14),
Adhaar varchar(34),
Age int,
City varchar(20),
CourseId int foreign key references Course(CourseId) on delete cascade
)
insert into Student values
(1,'vishal','123','v@v.com','pan1','adhaar1',20,'mumbai',1),
(2,'mahesh','456','m@v.com','pan2','adhaar2',20,'pune',2)

alter table Student
add TrainerId int foreign key references trainer(Id)

select *from Student
select *from Course
select *from trainer
delete from Course where CourseId=2

----------------------session8-----------------------------
insert into Employee(Name,city)values('Nishant','Pune'),('Sneha','Mumbai')
insert into Employee values('mahesh','nanded')
select *from Employee

--how to retrive id for newly inserted values
select SCOPE_IDENTITY()
select @@IDENTITY
select IDENT_CURRENT('Employee')

--------------------------------------------------------
---group by
select *from Student
select city,count(1) from Student
group by City

--city wise student count whic has more than  2 student

select City,count(1) from Student
where count(1)>2
group by City


select City,count(1) as total from Student

group by City
having count(1)>1

-------------------------------------------------------------------------
select *from Course
select *from trainer
select *from student
select Name ,courseId from Student
where CourseId in(1,2) 

-----------------------------subquery --------------
--simple select query
--but that select is helpimg another query to execute
select courseid from Course
-----------
select Name ,courseId from Student
where CourseId in(select courseid from Course) 

select Name ,courseId from Student
where CourseId not in(select courseid from Course)

---------------------------doesnot have any student---------------
select distinct courseid from Student
select courseid ,name from Course
where courseid not in(select distinct courseid from Student where courseid is not null)
-------------------------------------------
--retrive all courseid along with number of students
select courseid, count(RollNumber) as total from Student
where CourseId is not null
group by CourseId
--retrive all course names along with number of students

select name from Course
select count(RollNumber) from Student where CourseId=1

select name ,(select count(RollNumber) from Student where CourseId=Course.CourseId)
from Course

------------------------------------------------------
--all students
select age,Name from student

--maximum age
select max(age) from Student

--second highes age
select max(age) as higestage from Student
where age <(select max(age) from Student)
---------------------------------------------------------------------
--triner name and number of student assigned
select *from Student
select *from trainer
select name,(select count(TrainerId) from Student where TrainerId=trainer.Id ) from trainer
--select count(TrainerId) from Student 
select Name,(select count(RollNumber) from student where TrainerId=Trainer.Id) as Total
from Trainer
--retrive name who does not hane any students

select *from Student
select name ,Id from Trainer
where Id  not in(select TrainerId from student)

------------------------------------------
select *from Course
--retrive student name who does not have any course
select name,CourseId from Student
where CourseId  in (select CourseId from Course)
select name,CourseId from Student
where CourseId  not in (select CourseId from Course)

--to retrive student name who does not have trainer
select Name,TrainerId from student
where TrainerId  in (select Id from Trainer )

select Name,TrainerId from student
where TrainerId not in (select Id from Trainer)

--to retrive student name who does not have course and trainer both
select Name ,CourseId,TrainerId from student
where CourseId not in(select CourseId from Course where CourseId is null) and TrainerId not in(select Id from trainer where TrainerId is null)

select Name,CourseId,TrainerId from student
where CourseId  in(select CourseId from Course) and TrainerId  in(select Id from Trainer)

------------------------joins--------------------------------
--------------------------------------------------------------------------------------------------------------------------------
select *from Course
select *from Student
---retrive student name ansd course name
select s.Name studentName,c.Name courseName
from Student s inner join Course c
on s.CourseId=c.CourseId

--by default join is inner join
select s.Name studentName,c.Name courseName
from Student s  join Course c
on s.CourseId=c.CourseId

------------------------outer join---
--left join--common and uncommon from left
select *from Student
select s.Name studentName,c.Name courseName
from Student s left outer join Course c
on s.CourseId=c.CourseId

---right join
select s.Name studentName,c.Name courseName
from Student s right join Course c
on s.CourseId=c.CourseId

--full outer join
--common and uncommon data from both tables
select s.Name studentName,c.Name courseName
from Student s full outer join Course c
on s.CourseId=c.CourseId

--cross join--cartesian product
--it maps each row of left table with each table with right table
select s.Name studentName,c.Name courseName
from Student s  cross join Course c

---inner join

select *
from Student s join Course c
on s.CourseId=c.CourseId


select s.*,c.Name as coursename
from Student s join Course c
on s.CourseId=c.CourseId

---left join
--only uncomman data from left table
select *
from Student s left join Course c
on s.CourseId=c.CourseId
where c.CourseId is null

---right join
--only uncomman data from right table
select *
from Student s right join Course c
on s.CourseId=c.CourseId
where s.RollNumber is null

--only uncomman data from both table
select *
from Student s full join Course c
on s.CourseId=c.CourseId
where c.CourseId is null or s.RollNumber is null

-----join scenarionwithout pk and fk
create table table1(col1 int)
insert into table1 values(1),(1),(2)

create table table2 (col1 int)
insert into table2 values(1),(3),(4)

select *from table1
select *from table2

select*
from table1 t1 join table2 t2
on t1.col1=t2.col1

select*
from table1 t1  left join table2 t2
on t1.col1=t2.col1

select*
from table1 t1  right join table2 t2
on t1.col1=t2.col1

select*
from table1 t1 full join table2 t2
on t1.col1=t2.col1

select*
from table1 t1 cross join table2 t2


----self join is not different type of join
--joining table with itself
create table Vhaashemployees
(
Id int,
Name varchar(20),
Managerid int
)
insert into Vhaashemployees values
(1,'shashikant',3),(2,'vikul',null),(3,'usha',2),(4,'nikita',3),(5,'atul',2)
select *from Vhaashemployees
--all employee name with their manager name
select e.Name as Employeename ,m.Name as managername
from Vhaashemployees e  left join Vhaashemployees m
on e.Managerid=m.Id

--all manager name with employee reporting count
select m.Name as ManagerName ,count(e.Id) as totalEmployee
from Vhaashemployees e  join Vhaashemployees m
on e.Managerid=m.Id
group by m.Name

--------------------------------------------------
select *from Student
select *from Course
select *from trainer
--all student names along with course name and trainer name
select s.name as StudentName ,c.Name as courseName,t.Name as trainerName
from Student s left join Course c on s.CourseId=c.CourseId
left join trainer t on t.Id=s.TrainerId

----------------------------------------------------------------------
---null -absense of value
select e.Name as Employeename ,m.Name as managername
from Vhaashemployees e  left join Vhaashemployees m
on e.Managerid=m.Id

----------------------------------------------------------------------------
--isnull function
select e.Name as Employeename ,ISNULL(m.Name,'NO MANAGER') as managername
from Vhaashemployees e  left join Vhaashemployees m
on e.Managerid=m.Id

---case statement
select e.Name as Employeename ,
(case when m.Name is not null then m.Name else 'NO MANAGER' end) as managername
from Vhaashemployees e  left join Vhaashemployees m
on e.Managerid=m.Id

---coalese function
select e.Name as Employeename ,coalesce(m.Name,'NO MANAGER') as managername
from Vhaashemployees e  left join Vhaashemployees m
on e.Managerid=m.Id


----case statement with multiple condition

select e.Name as Employeename ,
(case
when m.Name is null then'BOSS'
when m.Name ='vikul'then 'Manager'
else m.Name
end
)
from Vhaashemployees e  left join Vhaashemployees m
on e.Managerid=m.Id

--------------------------------------------
select Name,City from Student
select Name,City ,
(case
when City='mumbai'then 'm'
when City='pune'then 's'
else 'no city'
end
)as NewCity
from Student

------------------update city mumbai=m
update Student set City ='m' where City='mumbai'
update Student set City='p'where City='pune'

update Student set City=(case
when City='mumbai'then 'm'
when City='pune'then 's'
else 'no city'
end
)

select Name, city from Student

---month number to month name
declare @M int=10
select
(case
when @M=1 then 'January'
when @M=2 then 'feb'
when @M=3 then 'mar'
when @M=4 then 'april'
when @M=5 then 'may'
when @M=6 then 'jun'
when @M=7 then 'july'
when @M=8 then 'augast'
when @M=9 then 'sept'
when @M=10 then 'oct'
when @M=11 then 'nov'
when @M=12 then 'dec'
else'invalid month'
end
)as MonthName

--------------------------------------------------------
--coalesce function--we can write multiple argument
select e.Name as Employeename ,coalesce(m.Name,'NO MANAGER') as managername
from Vhaashemployees e  left join Vhaashemployees m
on e.Managerid=m.Id

create table Customer
(Id int primary key identity,
Name varchar(50),
primaryemail varchar(50),
alternateemail varchar(50)
)
insert into Customer values('suraj','s@s.com','s1@s.com'),('nishant','n@s.com',null),
('shishikant',null,'sashi@s.com'),('mohan',null,null)
select Name, primaryemail,alternateemail  from Customer

select Name, primaryemail,alternateemail ,
coalesce(primaryemail,alternateemail,'no email') as communicationemail
from Customer

-----normalization 
select *from Student
select *from Course
select *from trainer

------------------------------------------------------------------------------------
------------------session11-----------------------------------------------
----view--virtual table/saved sql queries
--viw does not store actual data
--retrive from underline base table
--to secure original table/column and row level security
select RollNumber,Name,Mobile from student

create view vw_student
as
(select RollNumber,Name,Mobile from Student)
select *from vw_student

---row level security
create view vw_StudentByTrainer
as
(select RollNumber,Name,Mobile,Email,TrainerId from Student where TrainerId=2)

select *from  vw_StudentByTrainer
---more than one base table=view create
create view vw_studentdetials
as
select s.Name as studentName ,isnull (c.Name ,'no course')as courseName, 
isnull( t.Name,'no trainer') as trainerName
from student s left join Course c on s.courseId=c.courseId
left join trainer t on s.trainerId=t.Id

select *from vw_studentdetials

----view--to retrive data from tables
--can we insert update delete records through views
--may or may not be

select *from vw_student
insert into vw_student values
(5,'sandip','111111')

select *from Student
delete from vw_student where RollNumber=5

--view also can store data or records==indexed view=can store data

--can we write parameters to view
--we cannot write parameter to view
--database--view folder

---temporary table
--just like permanaent table
--created in tempdb database
--automatically get deleted when session creating that temporary table gets closed
--local prefix with #student --within same session
--and global with ##symbol--across all sessions
------------------------------------------------------
----------------------------------------------------------------
---select into
--create table with schema and copy records
select s.Name as studentName ,isnull (c.Name ,'no course')as courseName, 
isnull( t.Name,'no trainer') as trainerName into #student1
from student s left join Course c on s.courseId=c.courseId
left join trainer t on s.trainerId=t.Id

select *from #student1

---all rows all columns
select s.*into #student2
from student s left join Course c on s.courseId=c.courseId
left join trainer t on s.trainerId=t.Id
select *from #student2

--all columns limited rows
select s.*into #student3
from student s left join Course c on s.courseId=c.courseId
left join trainer t on s.trainerId=t.Id where s.CourseId=1
select *from #student3
---only schema create
select s.Name as studentName ,isnull (c.Name ,'no course')as courseName, 
isnull( t.Name,'no trainer') as trainerName into #student4
from student s left join Course c on s.courseId=c.courseId
left join trainer t on s.trainerId=t.Id
where 1<>1
select *from #student4
---can we create table without using create command
--yes using select into command

--create a student backup table
select *into studentbackup from Student
select *from studentbackup

---create a student backuup in b19db
select *into B19DB.dbo.studentbackup from Student
select *from B19DB.dbo.studentbackup

----------------------------------------
----variable
declare @Id int=10
print @Id

declare @Name varchar(50)
set @Name='vishal'
print @Name

----table variable
declare @Student table
(
StudentName varchar(50),CourseName varchar(50),TrainerName varchar(40)
)

insert into @Student
select s.Name as studentName ,isnull (c.Name ,'no course')as courseName, 
isnull( t.Name,'no trainer') as trainerName
from student s left join Course c on s.courseId=c.courseId
left join trainer t on s.trainerId=t.Id

select *from @student

-------------------------------------------------------------------------------
-------------------------------session12-----------------------------------
--stored procedure(sp)
---block of sql statement
--blocl sql statement,multiple logical queries inside stored procedure
--to implement business logic
--advantages reusable,centralized and maintainablity,reduces network traffic
---prevent sql injection attack
--------------------------------------------------------------
--query1
select *from Student where RollNumber=1--execution plan
--query2
select  distinct *from Student where RollNumber=1--new execution plan
--write--compile--excute--
--retention of execution plan(uses pre compiled version before executing)

---basic syntax
--1built in..sp_renamedb and user defined

select *from vw_student
 
create view vw_student  
as  
(select RollNumber,Name,Mobile from Student)
execute sp_helptext vw_Student

execute sp_help Student

------------------------------------------------------
--basic syntax to create store procedure
create procedure usp_getstudents
as
begin
select *from Student
end

---execute sp
exec usp_getstudents
alter procedure usp_getstudents
as
begin
select RollNumber,Name,Age,CourseId,TrainerId from  Student
end
---execute sp
exec usp_getstudents

---read value from stored procedure
declare @spValue int
execute @spValue=usp_getstudents
print @spValue

---return statement in stored procedure is not mandatory
create procedure usp_getstudentsCount
as
begin
declare @count int
select @count=count(1) from  Student
return @count
end

--------------------------------------------------------------
create procedure usp_getstudentsName
as
begin
declare @name varchar(50)
select @name=Name from  Student where RollNumber=1
return @name
end

declare @spValue int
execute @spValue=usp_getstudentsName
print @spValue

--store procedre with parameters
create procedure usp_getstudentByCity
@city varchar(50)
as
begin
select *from Student where City=@city
end
exec usp_getstudentByCity

exec usp_getstudentByCity @city='p'
---------------------------------------------------------------
------------------stored procedure with multiple input parameters
alter procedure usp_getstudentByCity
@city varchar(50),@Age int
as
begin
select *from Student where City=@city and Age>@Age
end
exec usp_getstudentByCity @city='m',@Age=20

-----------------------------------
--stored procedure with multiple input parameter and output parameters
create procedure usp_getstudentwithOutput
@RollNumber int,@Name varchar(40) output
as
begin
select @Name=Name from Student where RollNumber=@RollNumber
end
declare @N varchar(50)
exec usp_getstudentwithOutput @RollNumber=1,@Name=@N out
print @N

--------------------------------------------------------------------
alter procedure usp_getstudentwithOutput
@RollNumber int,@Name varchar(40) output,@pan varchar(50) output
as
begin
select @Name=Name,@pan=Pan from Student where RollNumber=@RollNumber
end
declare @N varchar(50),@p varchar(50)
exec usp_getstudentwithOutput @RollNumber=1,@Name=@N out,@pan=@p out
print @N+ ''+@p

-------------------------------------------------------
--ap with multiple tables
create proc usp_StudentDetails
as 
begin
select s.RollNumber,s.Name as studentname ,ISNULL(c.Name,'NA') as coursename,
ISNULL(t.Name ,'na') as trainername
from student s left join course c on s.CourseId=c.CourseId
left join trainer t on s.trainerId =t.Id
end

exec  usp_StudentDetails
------------------------------------------------------------
--stored procedure with optional parameter
create proc usp_students
as 
begin
select *from Student
end
exec usp_students
--------------------------------
alter proc usp_students
@city varchar(50)=null
as 
begin
select *from Student where City=@city or @city is null
end
exec usp_students
exec usp_students @city='m'
-----------------------------
alter proc usp_students
@city varchar(50)=null
as 
begin
select *from Student where City=@city or @city is null
end

---------------------------------------------------------------
---session13----------------------------
create table DotNetStudents(
 RollNumber int,
Name varchar(50),
city varchar(40)
) 

insert into DotNetStudents
values(1,'vishal','mumbai'),
(2,'shital','pune'),(3,'aniket','pune')
-----------------------------------------------------
create table TestingStudents(
 RollNumber int,
Name varchar(50),
Gender varchar(40)
) 

insert into TestingStudents
values(1,'mahesh','male'),
(2,'shital','female'),(3,'dipak','male')

select RollNumber,Name from DotNetStudents
select RollNumber,Name from TestingStudents


select RollNumber,Name from DotNetStudents
union all
select RollNumber,Name from TestingStudents

select RollNumber,Name from DotNetStudents
union 
select RollNumber,Name from TestingStudents

--------------------------------------------------
select RollNumber,Name from DotNetStudents
union all
select RollNumber,Name from TestingStudents

select RollNumber,Name from DotNetStudents
intersect
select RollNumber,Name from TestingStudents

select RollNumber,Name from DotNetStudents
except
select RollNumber,Name from TestingStudents

--combine records as well as columns from select using union
select RollNumber,Name,null as Gender,City from DotNetStudents
union all
select RollNumber ,Name, Gender,null as city from TestingStudents
---two more select queries
select RollNumber,Name,null as Gender,City from DotNetStudents
union all
select RollNumber ,Name, Gender,null as city from TestingStudents
union all
select RollNumber ,Name, Gender,null as city from TestingStudents

----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-------------------function
--block of sql statements
--used to implement computational logic
--category built in and user define functn udf
--types scalr inline and multitable value functn

---built in function 
--aggreegate function--count min  max sum and avg
--conversion function
-----------------------------------------------------------------
select *from Employee

select Id , Name,'s-'+Id from Employee
---cast function
select Id , Name,'s-'+ cast(Id as varchar(5)) as EmpId from Employee
--convert function
select Id , Name,'s-'+ convert(varchar(5),Id) as EmpId from Employee

---current datetime
select getdate()
--declare@date varchar(50)
print 'style 100:'+ convert(varchar(40),getdate(),100)
print 'style 101:'+ convert(varchar(40),getdate(),101)
print 'style 102:'+ convert(varchar(40),getdate(),102)
print 'style 103:'+ convert(varchar(40),getdate(),103)
print 'style 104:'+ convert(varchar(40),getdate(),104)

----------------------------------------
select abs(-10) --10 absolute value

select ceiling(10.1)--11
select ceiling(-2.1)-- -2
select floor(10.1)--close to bottom value
select square(14)
select sqrt(16)
select ROUND(10.457,2)--10.460
select ROUND(10.457,2)--10.450
select ROUND(786.457,-2)--10.450
select ROUND(786.457,-1)--10.450
select power(2,3)
--
--deterministic function--output remain same for given set of value
--non deterministic function--output remain not same for given set of value
select rand()--always give random value between 0 and 1


--random values between 0 to 100
select rand()*100
select FLOOR( rand()*100)

declare @start int=1
while(@start<=10)
begin 
 print FLOOR( rand()*100)
 set @start=@start+1
end

--by given seed value we can make non determinitic into deterministic
 print FLOOR( rand(5)*100)

 ---strings functions
 --character=
 select ASCII('A')
  select ASCII('Z')
   select ASCII('z')
    select ASCII('0')
	 select ASCII('#')
	 ---------------------------------
	 --if i have ascii code want character
	 select char(38)
	  select char(48)

	  declare @name varchar(50)='  Anil  '
	  print len(@name)
	   print lower(@name)
	    print upper(@name)
		 print reverse(@name)
		 select @name
		 select ltrim(@name)
		  select rtrim(@name)
		   select trim(@name)

		   select Name,LOWER(Name) as lowerINname ,
		   UPPER(name)as upperName,len(name)as length
		   from Student
---------------------------------------------------------------------
------------------------session14--------------------------------------
--left()
select Name,left(name,3) from Student
--all student whose name start with v
select Name from Student where Name like'v%'
select Name from Student where LEFT(name,1)='v'

--right()
select Name,RIGHT(Name,3) from Student
select Name from Student where Name like'%l'
select Name from Student where right(name,1)='l'

--charindex()
select *from Student
declare @email varchar(50)='vikulrathod'
print charindex('@',@email)--
set @email='vikul@gmail.com'
print charindex('@',@email)
print charindex('v',@email)

--substring()--part of string/portion of string
print substring(@email,1,6)
print substring(@email,7,9)

print substring(@email,1,charindex('@',@email-1))
print substring(@email,charindex('@',@email+1), len(@email)-charindex('@',@email))

----------------------
select email,
substring(email,1,charindex('@',email)-1) as Username,
substring(email,charindex('@',email)+1, len(email)-charindex('@',email)) as Domain
from Student

-------------------------------------------------------
create table #student(id int primary key identity,Name varchar(40),Email varchar(40))
insert into #student values('vishal','vishal@gamil.com'),('shital','shital@gamil.com'),
('nishant','nishant2022@rediffmail.com'),('suraj','suraj.sonawane@gamil.com')
select Name,Email,
substring(email,1,charindex('@',email)-1) as Username,
substring(email,charindex('@',email)+1, len(email)-charindex('@',email)) as Domain
from #student

select
substring(email,charindex('@',email)+1, len(email)-charindex('@',email)) as Domain,
COUNT(Id) as total from #student
group by substring(email,charindex('@',email)+1, len(email)-charindex('@',email))
------------------------------------------------------------------------------------
declare @Adhaar varchar(14)='1234 3456 6789'
--print 'xxxx xxxx '+substring(@Adhaar,11,4)
print replicate('x',8)+substring(@Adhaar,11,4)

--------------------
--replicate()
print replicate('chandani',5)

declare @mobile varchar(16)='9730605990'
print replicate ('x',8)+right(@mobile,2)

----------------------------------------------------
--space()
print space(50)
print 'anil'+space(50)+'rathod'

--patindex--to check pattern--we can use all wild cardd characters
declare @Name varchar(50)='vikul'
print patindex('%u%',@Name)

declare @Name varchar(50)='vihan'
print patindex('%[0-9]%',@Name)


---replace()
declare @email2 varchar(40)='pratidnya@gmail.com'
print @email2
print replace (@email2,'gmail','vhaashtech')


--stuff()
--stuffed email
declare @email3 varchar(40)='pratidnya@gmail.com'
print @email3
print stuff(@email3,4,4,'****')
print stuff(@email3,2,6,'******')

---------------------------------------------------------------------------------------------
-------------------------date---------------------------------------
print getdate()
print current_timestamp
print sysdatetime()
print sysdatetimeoffset()
print getutcdate()
print sysutcdatetime()
-----------------------------------------------------------------------------
create table tblDate
(
c_date date,
c_time time,
c_smalldatetime smalldatetime,
c_datetime datetime,
c_datetime2 datetime2,
c_datetimeoffset datetimeoffset
)
insert into tblDate values
(getdate(),getdate(),getdate(),getdate(),getdate(),getdate())
select *from tblDate

insert into tblDate values
(getdate(),getdate(),getdate(),getdate(),getdate(),sysdatetimeoffset())
--smalldatetime
--datetime
--datetime2

--current
print getdate()
declare @dob date='1989-09-16'
print @dob

print isdate('16/09/1989')
print isdate('09/16/1989')
print isdate('vikul')
print isdate('13/30/1990')
print day(getdate())

print month(getdate())
print month('09/16/1989')

print year(getdate())
print year('09/16/1989')

--datepart
print datename(hour,getdate())
print datename(minute,getdate())
print datename(weekday,getdate())
print datename(quarter,getdate())
print datename(dayofyear,getdate())

---------------------------------------------------------------------------
---------------------------------session15---------------------------------

--datename returns varchar() value
--datepart returns int value
print datename (day,getdate())
print datepart (day,getdate())

print datename (m,getdate())
print datepart (m,getdate())

print datename (dw,getdate())
print datepart (dw,getdate())

print datename(dw,'09/16/1989')--saturday

print sysdatetimeoffset()
print datename(tz,sysdatetimeoffset())


--dateadd()
print dateadd(day,2,getdate())
print dateadd(m,1,getdate())
print dateadd(day,-10,getdate())

--datediff()
print datediff(year,'1991/06/16','2023/02/21')
print datediff(day,'1991/06/16','2023/02/21')
print datediff(month,'1991/06/16','2023/02/21')
print datediff(year,'1991/06/16','2023/02/21')

---age calculate
--2023-02-21=-1991-06-19
declare @DateofBirth date='1991-06-16',@currentDate date=getdate()
declare @years int,@months int,@days int
 declare @temp date= @DateofBirth 
 select @years= datediff(year,@temp,@currentdate)
 -(case when MONTH(@temp)> MONTH(@currentdate) or
MONTH(@temp)=MONTH(@currentdate)
 and day(@temp)> day(@currentdate) then 1 else 0 end)
 set @temp=DATEADD(year,@years,@DateofBirth)

  select @months= datediff(MONTH,@temp,@currentdate)-
  (case when day(@DateofBirth)>day(@currentDate) then 1 else 0 end)
   set @temp=DATEADD(MONTH,@months,@temp)
  select @days=DATEDIFF(day,@temp,@currentDate)
  print cast( @years as varchar(10))+'years '+ cast(@months as varchar(12))+'months '
  + cast(@days as varchar(6))+'days '

  --------------------------------------------------------------------------------
  --end of the month
  print eomonth(getdate())

  --date parts
  print datefromparts(2022,4,20)
  print timefromparts(12,45,52,785,3)
  print smalldatetimefromparts(2022,4,20,8,39)
  print datetimefromparts(2022,4,20,8,39,57,784)
  print datetime2fromparts(2022,4,20,8,40,55,7894,4)


  --------------------------------------------------------------------------------
  ---udf-----------------
  --scalar,inline table value funt,multitable value
  ------------------------------------------------------------------------------
  ---user define function
  create function fn_StudentName()
  returns varchar(50)
  as
  begin
  return 'vikas'
  end

  select dbo.fn_StudentName()
  -------------------------------------------------

    alter function fn_StudentName(@RollNumber int)
  returns varchar(50)
  as
  begin
  declare @Name varchar(50)
  select @Name =Name from Student where RollNumber=@RollNumber
  return @Name
  end
   select RollNumber, dbo.fn_StudentName(RollNumber) from Student

   ------------------------------------------------
   ---scalar function
   create function fn_Age(@dateofbirth date)
   returns varchar(100)
   as
   begin
   declare @currentDate date=getdate()
declare @years int,@months int,@days int
 declare @temp date= @DateofBirth 
 select @years= datediff(year,@temp,@currentdate)
 -(case when MONTH(@temp)> MONTH(@currentdate) or
MONTH(@temp)=MONTH(@currentdate)
 and day(@temp)> day(@currentdate) then 1 else 0 end)
 set @temp=DATEADD(year,@years,@DateofBirth)

  select @months= datediff(MONTH,@temp,@currentdate)-
  (case when day(@DateofBirth)>day(@currentDate) then 1 else 0 end)
   set @temp=DATEADD(MONTH,@months,@temp)
  select @days=DATEDIFF(day,@temp,@currentDate)
  return cast( @years as varchar(10))+'years '+ cast(@months as varchar(12))+'months '
  + cast(@days as varchar(6))+'days '
   end
   select dbo.fn_Age('1989-09-16')
--------------------------------------------------------------------------------------
--inline table valued functions
create function fn_student()
returns table
as
return (select * from Student)
select * from fn_student()

alter function fn_student(@city varchar(40))
returns table
as
return (select * from Student where City=@city)
select * from fn_student('M')

---------------------------
--multi table value function
create function fn_Students()
returns @Student table(RollNumber int,StudentName varchar(50))
as
begin
 insert into @Student
 select RollNumber,Name from Student
 return
end
select *from fn_Students()

------------------------------------
alter function fn_Students(@city varchar(50))
returns @Student table(RollNumber int,StudentName varchar(50))
as
begin
 insert into @Student
 select RollNumber,Name from Student where City=@city
 return
end
select *from fn_Students('m')

----------------------------------------------
--difference between stored procedure and function
--sp used for business logic funct computational logic
--perform dml and ddl quries in sp
--funct we can call select statement but not sp
--more parameter in sp to function
--we can create temp table inside sp but not inside funtn
--trnsaction we can write inside sp but not in functn
--try catch block in sp but not in functn
--sp support deffered name resolution but not sp
--we can create sp if that object does not exist
--we can not create funct if that object does not exist

create proc usp_sp1
as
begin
select *from abcd
end

create function fn_fn1()
returns table
as
return (select *from abcd)

-------------------------------------------------------------------------
-------------------------------------------------------------------------
-----session 16----------------------------
select *from Course
select *from trainer
select *from student

---triner id along with student count
select TrainerId ,COUNT(RollNumber) as total from Student
where trainerId is not null
group by TrainerId

--triner id along with student count which has equal or more than 2 students
--1 view
create view vw_trainerAssignedStudents
as
(select TrainerId ,COUNT(RollNumber) as total from Student
where trainerId is not null
group by TrainerId)
select *from vw_trainerAssignedStudents where total>=2
--2 temporary table
select TrainerId ,COUNT(RollNumber) as total into #student from Student
where trainerId is not null
group by TrainerId

select *from #student where Total >=2
--3 table variable
declare @student table (trinerId int,total int)
insert into @student
select TrainerId ,COUNT(RollNumber) as total  from Student
where trainerId is not null
group by TrainerId

select *from @student where total>=2

---4-derived table
select *from
(select TrainerId ,COUNT(RollNumber) as total from Student
where trainerId is not null
group by TrainerId)  TTable
where total>=2

--select *from TTable--this wont work
--derived table
--cte--common table expression
--scco

with cte
as 
(
select TrainerId,count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId
)
--use cte
select *from cte where Total >=2
--------------------------------------------------------
with TrainerCTE(TrainerId,TotalStudents)
as 
(
select TrainerId,count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId
)

--sql query
with TrainerCTE(TrainerId,TotalStudents)
as 
(
select TrainerId,count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId
)
--sql query
select'hello'
--use cte
select *from  TrainerCTE where TotalStudents >=2--wont work
--we can use in any cte in any query like select /update/insert
-------------------------------------------
select e.Name as EmpName,m.Name as MgrName
from Vhaashemployees e left join Vhaashemployees m 
on e.Managerid=m.Id
--emp name and manager name

--emp level 
with cte(Id,Name,ManagerId,Level)
as
(
select Id,Name,ManagerId,1 as level from Vhaashemployees where Managerid is null
union all
select e.Id,e.Name,e.Managerid,(cte.Level+1) as level from Vhaashemployees e join cte
on e.Managerid=cte.Id
)

select  *from cte
insert into Vhaashemployees values(6,'Sneha',4)

---inserting through cte
with cte
as
(
select *from Vhaashemployees
)

insert into cte values(7,'Diksha',4)
---cab we insert/update/delete thorugh cte
--may or may not be
---------------------------------------------------------------------
create table #Student
(
Name varchar(50),
Gender varchar(10)
)
insert into #student values('suraj','male'),('nikita','female'),
('suraj','male'),('suraj','male'),('kiran','female'),('kiran','male')

select *from #student
drop table #student

--duplicate fetch/delete it wont work correctly
select *from #student where Name='suraj'

delete from #student where Name='suraj'

-----------------------------------------------------------
---ranking functioin
--over clause

select *from Student
select City,count(1) as total from Student group by City
select distinct City,count(1) over(partition by City) from Student

---row number()
select Name,Gender from #Student

select Name,Gender ,Row_number() over(order by Name)as RollNumber from #Student

select Name,Gender ,Row_number() over(partition by Name order by Name)as RollNumber from #Student

select Name,Gender ,Row_number() over(partition by Name,Gender order by Name)as RollNumber from #Student

--unique select
select distinct Name,Gender from #Student--performance wise not good

with cte
as
(
select Name,Gender,ROW_NUMBER() over (partition by Name,Gender order by Name )as RollNumber
from #student
)

--select *from cte where RollNumber>1

delete from cte where RollNumber>1

------------------------------------------------------------------
create table #Employee
(Id int primary key Identity,
Name varchar(50),
Gender varchar(10),
Salary int
)
insert into  #Employee values('suraj','male',50000),('sagar','male',45000),
('shubam','male',45000),('varsha','female',40000),('nishant','male',37000),
('suyog','male',37000),('sandip','male',30000)
insert into  #Employee values('shital','female',30000),('snehal','female',35000),
('nikita','female',30000),('sneha','female',40000),('rohini','female',33000)

select Id, Name, Gender, salary from #Employee

--rank()
--in case of duplication gives same ranking
--it skips default ranking
select Id, Name, Gender, salary ,ROW_NUMBER() 
over(partition by gender order by gender) as R1 from #Employee

select Id, Name, Gender, salary ,ROW_NUMBER() 
over(partition by salary order by salary) as R1 from #Employee

select Id, Name, Gender, salary,
rank() over(order by salary desc)as R1
from #Employee
--rank function skip default ranking

with cte
as
(
select Id, Name, Gender, salary,
rank() over(order by salary desc)as R1
from #Employee
)
select *from cte where R1=2

--dense rank--it does not skips default ranking

select Id, Name, Gender, salary,
dense_rank() over(order by salary desc)as R1
from #Employee
----------------------------------------------------------------------
--------------higest salary
declare @HighestSalary int=4;
with cte
as
(
select Id, Name, Gender, salary,
dense_rank() over(order by salary desc)as R1
from #Employee
)
select *from cte where R1=@highestSalary


---ntile()--to create chunks or group of records
--useful in case of data backup or data migration
select Id, Name, Gender, salary,
ntile(3) over(order by salary desc)as R1
from #Employee
---------------------------------------
select Id, Name, Gender, salary,
ROW_NUMBER() over(order by salary desc)as R1,
rank() over(order by salary desc)as R2,
DENSE_RANK() over(order by salary desc)as R3,
ntile(3) over(order by salary desc)as R4
from #Employee

----copetition top 3 winners
---1st winner=25000
---2nd winner=20000
---3rd winner=15000

--marks=98,95,95,95,92
--rank()=1,2,2,2,5==rank()will be useful
--dense_ranK()==1,2,2,2,5

------------------------------------------------------------------------------------
--------------------------------session 17------------------------------------------
--cte
--ranking function
select *from #Employee

select Id,Name,Gender,Salary from #Employee
select Id,Name,Gender,Salary,sum(Salary)over(order by Id) as Total from #Employee
select Id,Name,Gender,Salary,sum(Salary)over(partition by Gender order by Id) as Total from #Employee

---Task
---print all employees with male and female(aleternate)
select *from #Employee order by Gender

--------------------------------------------------------------------------------
-------------------------------index------------------------------------------
--index helps query to run faster. index helps query to find particular record in table
--without index it perform table scan not good for performance
create table Student1
(
RollNumber int,
Name varchar(50),
Gender varchar(10),
Fees int
)
insert into Student1 values(1,'vishal','male',15000),(11,'shital','female',20000),
(6,'snehal','female',20000),(4,'vishal','male',15000),(47,'vishal','male',15000)

select *from Student1
select *from Student1 where RollNumber between 5 and 15

drop table Student1

create table Student1
(
RollNumber int primary key,
Name varchar(50),
Gender varchar(10),
Fees int
)
insert into Student1 values(1,'vishal','male',15000),(11,'shital','female',20000),
(6,'snehal','female',20000),(4,'vishal','male',15000),(47,'vishal','male',15000)
select *from Student1
select *from Student1 where RollNumber between 5 and 15

--types of index
--clustered index
--unique and non unique
---it sort and store in same and physical table
---not clustered index
--it sorts and stores records in different virtual table
--it takes extra disc space
select *from Student1 where Fees between 5000 and 10000

--basic syntax
create index Ix_Student_fees
on Student1(Fees)

--non clustered -non unique index
create index Ix_Student_fees
on Student1(Fees)

--non clustered - unique index
create unique index Ix_Student_fees
on Student1(Fees)

--clustered -non  unique index
create clustered index Ix_Student_fees
on Student1(Fees)

--clustered -unique index
create unique clustered index Ix_Student_fees
on Student1(Fees)

--if we have multiple column invovles eithe in condition or  selecting from table
select Name,Fees from Student1 where Fees between 5000 and 10000

--covering index--index which is created on more columns
create index Ix_Student_Fees_Name
on Student1(Fees,Name)

select Name,Fees from Student1 where Fees between 15000 and 20000

--by default primary key create clustered index
--can we create clustered index on other column than primary key column
--yes
create table Student1
(
RollNumber int,
Name varchar(50),
Gender varchar(10),
Fees int
)
insert into Student1 values(1,'vishal','male',15000),(11,'shital','female',20000),
(6,'snehal','female',20000),(4,'vishal','male',15000),(47,'vishal','male',15000)
select *from Student1

---clustered index on fees column
create clustered index Ix_Student_Fees
on Student1(Fees)

--primary key--yes-drop recreate-design mode
--primary key --create unique non clustered index
--unique constraint creates unique non clustered index

exec sp_help Student1

--covering index
create index Ix_Student_Fees_Name
on Student1(Fees,Name)

select count(1)from Student1

drop table Student1
create table Student1
(
RollNumber int,
Name varchar(50),
Gender varchar(10),
Fees int
)

--it will insert 5000 dummy records into student1 table
declare @start int=1
while(@start<=5000)
begin
insert into Student1 values(1,'student1'+cast(@start as varchar(6)),'Male',@start*100)
set @start=@start+1
end

select count(1) from Student1
select RollNumber,Name from Student1


--it will insert 5000 dummy records into student1 table
declare @start int=50001
while(@start<=100000)
begin
insert into Student1 values(1,'student1'+cast(@start as varchar(10)),'Male',@start*100)
set @start=@start+1
end

select count(1) from Student1
select RollNumber,Name from Student1

----------------------------------------------------------------------------------
------------------------------Cursor------------------
--if we want to perform operation on row by row basis
--Cursor are not good for performance(table scan)

drop table Student1

create table Student1
(
RollNumber int,
Name varchar(50),
Gender varchar(10),
Fees int
)
insert into Student1 values(1,'vishal','male',15000),(11,'shital','female',20000),
(6,'snehal','female',20000),(4,'vishal','male',15000),(47,'vishal','male',15000)

select *from Student1

----print name and length of characters--using cursor

create table #student(Name varchar(50),Fees int,NumberOfCharacters int)

declare @name varchar(50),@fees int
declare StudentCursor cursor for
select Name,Fees from Student1

open StudentCursor
fetch next from StudentCursor into @name,@fees

while(@@FETCH_STATUS=0)
begin
--print @name+'-' +cast(len(@name) as varchar(5))
  insert into #student values(@name,@fees,len(@name))
fetch next from StudentCursor into @name,@fees
end

close StudentCursor
deallocate StudentCursor

select *from #student
drop table  #student

---reading multiple columns --remaining fees
create table #student(Name varchar(50),NumberOfCharacters int,Fees int,RemainingFees int)

declare @name varchar(50),@fees int
declare StudentCursor cursor for
select Name,Fees from Student1

open StudentCursor
fetch next from StudentCursor into @name,@fees

while(@@FETCH_STATUS=0)
begin
--print @name+'-' +cast(len(@name) as varchar(5))
  insert into #student values(@name ,len(@name),@fees,50000-@fees)
fetch next from StudentCursor into @name,@fees
end

close StudentCursor
deallocate StudentCursor

select *from #student

----------------------------------------------------------------------------------
----------------------------------session18---------------------------------------
--trigger
--special type of stored procedure
--trigger gets automatically called against the action on which trigger is created

select *from student
insert into Student values
(5,'dipak','8976567898','dipak@gamil.com','PAN5','ADHAAR5',22,'Mumbai',1,1)

--basic syntax
create trigger Tr_Student_Insert
on student
for insert
as
begin
  print 'Tr_Student_Insert trigger executed'
end
insert into Student values
(6,'mohan','8976567898','mohan@gamil.com','PAN6','ADHAAR6',23,'pune',1,1)

--2 categories
--1--for trigger or after trigger
  --query is execcuted and trigger is also executed
--2--instead of trigger
create trigger Tr_Student_Insert
on student
after insert
as
begin
  print 'Tr_Student_Insert trigger executed'
end
insert into Student values
(7,'mahendra','9527788887','mahendra@gamil.com','PAN7','ADHAAR7',24,'mumbai',1,1)
-------------------------------------------------------------------
----instead of trigger
--only trigger gets executed (skip query excution)
alter trigger Tr_Student_Insert
on student
instead of  insert
as
begin
  print 'Tr_Student_Insert trigger executed'
end
insert into Student values
(8,'Jitendra','9827788887','jiten@gamil.com','PAN8','ADHAAR8',27,'pune',1,1)

select *from student

--use of instead of trigger
--new student
insert into Student values
(1,'Jitendra','9827788887','jiten@gamil.com','PAN8','ADHAAR8',27,'pune',1,1)
---------------------------------------------------------------------------------
--with after trigger --query will thow error
alter trigger Tr_Student_Insert
on student
after insert
as
begin
  print 'Tr_Student_Insert trigger executed'
end

---instead of trigger
alter trigger Tr_Student_Insert
on student
instead of  insert
as
begin
  print 'Tr_Student_Insert trigger executed'
end

--use of instead of trigger
--new student
insert into Student values
(1,'Jitendra','9827788887','jiten@gamil.com','PAN8','ADHAAR8',27,'pune',1,1)
select *from student

--there are two magical tables in trigger
--inserted and deleted
select *from inserted--works only within trigger
select *from deleted

--altering instead of trigger with magical tables
alter trigger Tr_Student_Insert
on student
instead of  insert
as
begin
 select *from inserted--works only within trigger
select *from deleted
end

--new student
insert into Student values
(1,'Jitendra','9827788887','jiten@gamil.com','PAN8','ADHAAR8',27,'pune',1,1)
-------------------------------------------------------------------------
--altering instead of trigger with magical tables--benefit
alter trigger Tr_Student_Insert
on student
instead of  insert
as
begin
declare @Rn int,@Name varchar(50),@Mobile varchar(10),@Email varchar(100),
@PAN varchar(15),@ADHAAR varchar(20),@Age int,@City varchar(50),@CId int,@TId int
 select @Name=Name,@Mobile=Mobile,
 @Email=Email,@PAN=PAN,@ADHAAR=Adhaar,@Age=Age,@City=City,@CId=CourseId,@TId=TrainerId from inserted
 select @Rn=max(RollNumber)from Student

 insert into Student values
(@Rn+1,@Name,@Mobile,@Email,@PAN,@ADHAAR,@Age,@City,@CId,@TId)
print' new student inserted successfully using trigger'
end

select *from Student




---trigger we can create on any command or action
--dml trigger/ddl trigger/logon
--we will create a student audit table
--1--student admission
--2-student modified any data
--3-student admission cancel

create table Studentauditlogs
(
LogId int primary key identity,
RoldNumber int,
LogDate datetime,
LogAction  varchar(50),
Description varchar(200)

)
select *from Studentauditlogs
drop trigger Tr_Student_Insert

--will create a student audit table
--1--student admission log
create trigger Tr_Student_Insert
on student
for insert
as 
begin
declare @RN int ,@Name varchar(50)
select @RN=RollNumber,@Name=Name from inserted

insert into Studentauditlogs values
(@RN,getdate(),'NEW ADMISSION',@Name+'confirmed admis')

print' new student inserted successfully using trigger'  
end
select *from Student

insert into Student values
(10,'rocky','98277889787','rocky@gamil.com','Pan9','ADHAAR1',42,'pune',1,1)

select *from Studentauditlogs 
select *from Student

--2--student cancel admission --log maintain
create trigger Tr_Student_Delete
on student
for delete
as 
begin
declare @RN int ,@Name varchar(50)
select @RN=RollNumber,@Name=Name from deleted

insert into Studentauditlogs values
(@RN,getdate(),'CANCEL ADMISSION',@Name+'cancelled admis')


end

--delete student
delete from Student where RollNumber=10

select *from Studentauditlogs 
select *from Student

------------------------------------
---3 student modified any data--log maintain
alter trigger Tr_Student_update
on student
for update
as 
begin
declare @OldRN int ,@OldName varchar(50),@OldPan varchar(20)
select @OldRN=RollNumber,@OldName=Name,@OldPan=Pan from deleted--old record from table

declare @NewRN int ,@NewName varchar(20),@NewPan varchar(20)
select @NewRN=RollNumber,@NewName=Name,@NewPan=Pan from inserted--newly data which is going to update

declare @Description varchar(200)='student with roll number'+
cast(@OldRn as varchar(6))+'has changed'
if(@OldName<>@NewName)
begin
 set  @Description= @Description+'name from'+@OldName+'to'+@NewName
end
if(@OldPan<>@NewPan)
begin
 set  @Description= @Description+'name from'+@OldPan+'to'+@NewPan
end
insert into Studentauditlogs values
(@OldRN,getdate(),'STUDENT PROFILE CHANGE',@Description)  
end
--modify student
update Student set Name='Rocky' where RollNumber=8
--old jitendra==rocky
--deleted table will contain old data which will going to remove from table
--inserted table will contain new date which will going to update in table
select *from Studentauditlogs 
select *from Student

-----------------------------------------------------------------------------------
update Student set Pan=' AXEY6789F'where RollNumber=8
update Student set name='Nishant', Pan=' NOT CREATED'where RollNumber=1
--particular student logs
select *from Studentauditlogs where RoldNumber=8
--recent logs
select *from Studentauditlogs order by LogDate desc

--first 2 recent logs
select  top 2 *from Studentauditlogs order by LogDate desc


---can we create trigger on view--yes
--can we create trigger on temp table/table variable/derived table/cte=no

select *from [dbo].[vw_student]
insert into vw_student values(9,'pushpa','8987654378')

-----trigger on view
create trigger Tr_vw_student_Insert
on vw_student
instead of insert
as
begin
--use inserted or deleted magical table to explicitly insert or update or delete to base table
print'view is not create for insert or update or delete actions'
end

---ddl trigger
create table s1(id int)
create table s2(id int)
create trigger Tr_bb19db_Create_Table
on database
for create_table
as
begin
  print'Tr_bb19db_Create_Table trigger executed'
end

--if want to maintain all logs in  one seperate table-different database??=yes
--ddl/table/sp/function/view-
alter trigger Tr_bb19db_Create_Table
on database
for create_table,alter_table,drop_table
as
begin
  print'Tr_bb19db_Create_Table trigger executed'
end

drop table s1

---ddl-trigger--server scope--aplication to all databases

create trigger Tr_server_ddl_table
on all server
for create_table,alter_table,drop_table
as
begin
  print'Tr_server_ddl_table trigger executed'
end

use B19DB
create table S1(Id int)

--all logs happened on database we can track
select ORIGINAL_LOGIN()

alter trigger Tr_server_ddl_table
on all server
for create_table,alter_table,drop_table
as
begin
   select EVENTDATA()
  print'Tr_server_ddl_table trigger executed'
end

create table s3(Id int)

---event data

-----------------------------------------------------------------------------------
---------------------------------------------sessions19----------------------------
drop table s1
create table s1(Id int)
---eventdata() function returns xml output
--this xml contains information about that ddl commands
--XML --extensible markup language--store and transfer data

--table to store logs 
create table DatabaseSchemaChanges
(
LogId int primary key identity,
LoginName varchar(50),
serverName varchar(50),
databaseName varchar(100),
ObjectType varchar(100),
ObjectName varchar(100),
CommandText varchar(500),
Logdatetime datetime
)

--alter trigger to insert logs to datavaseschemaChanges
alter trigger Tr_server_ddl_table
on all server
for create_table,alter_table,drop_table,create_procedure
as
begin
   declare @xml xml
  select @xml= EVENTDATA()

  declare @LoginName varchar(50),
@serverName varchar(50),
@databaseName varchar(100),
@ObjectType varchar(100),
@ObjectName varchar(100),
@CommandText varchar(500),
@Logdatetime datetime
set @LoginName=@xml.value('(EVENT_INSTANCE/LoginName)[1]','nvarchar(max)')
set @LoginName=@xml.value('(EVENT_INSTANCE/ServerName)[1]','nvarchar(max)')
set @LoginName=@xml.value('(EVENT_INSTANCE/DatabaseName)[1]','nvarchar(max)')
set @LoginName=@xml.value('(EVENT_INSTANCE/ObjectType)[1]','nvarchar(max)')
set @LoginName=@xml.value('(EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)')


set @CommandText=@xml.value('(EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')
insert into bb19db.dbo.DatabaseSchemaChanges values
(@LoginName,@serverName,@databaseName,@ObjectType,@ObjectName,@CommandText,GETDATE())

  --print'Tr_server_ddl_table trigger executed'
end

create table s1( Id int)
drop table s1
select *from DatabaseSchemaChanges

use bb19db
go
alter proc usp_demotrigger as 
begin
select *from Student
end

----------------------------------------------------------------------------
--logon trigger
--trigger logic will get executed on connecting to sql server
select *from sys.dm_exec_sessions
select count(1) from sys.dm_exec_sessions

print  original_login()

--if want to limit number of session per user
--------------------------------------------------------------------------------
use bb19db
go
create table StudentV2
(
RollNumber int primary key,
Name varchar(50),
Gender varchar(10) check(Gender='Male' or Gender='Female'),
Email varchar(50) not null
)

insert into StudentV2 values (1,'Nishant','Male','n@n.com')
select *from StudentV2
insert into StudentV2 values (2,'suraj','Male','s@s.com')

---sql errors
--error due constraints and due to many more 
--1--error message number 2--error severity(level) 3--error state 4--error message


--sp to insert student
create proc usp_insertStudentV2
@RN int,@Name varchar(50),@Gender varchar(10),@Email varchar(100)
as
begin
    insert into StudentV2 values (@RN,@Name,@Gender,@Email)
end

exec usp_insertStudentV2 1,'om','male', 'o@o.com'

--error handling 
--its important because end appln end user may not know about the error which is not handled
--befor 2005 version
alter proc usp_insertStudentV2
@RN int,@Name varchar(50),@Gender varchar(10),@Email varchar(100)
as
begin
    insert into StudentV2 values (@RN,@Name,@Gender,@Email)
	if(@@ERROR<>0)
	begin
	print 'there is error in inserting student'
	end
	   else
	   begin
	      print'student insert success'
	   end
   print'usp_insertStudentV2 execution completed'
end

exec usp_insertStudentV2 3,'om','male', 'o@o.com'
exec usp_insertStudentV2 3,'komal','female', 'k@k.com'

--limitation
--we need to check after every query if there is an error or not
--if there is an error found, it does not skip execution
--to handle errror we use try and catch block
--begin try
--logic all queries
--end try

--begin catch
-- if error occurs this block will get excuted
--logic to handle error
--logic to store error information
--logic to provide meaningful message to end user
--end catch

alter proc usp_insertStudentV2
@RN int,@Name varchar(50),@Gender varchar(10),@Email varchar(100)
as
begin
    begin try
    insert into StudentV2 values (@RN,@Name,@Gender,@Email)
    print'usp_insertStudentV2 execution completed'
	end try

	begin catch
	  --print'error in inserting student'
	  raiserror('Error in inserting student',16,1)
	end catch
end

exec usp_insertStudentV2 3,'om','male', 'o@o.com'
exec usp_insertStudentV2 3,'komal','female', 'k@k.com'

--raiseerror function

--table to store logs
create table ErrorLogs
(
ErrorLogId int primary key identity,
StoreProcedureName varchar(50),
ErrorMessage varchar(200),
ErrorSeverity int,
ErrorState int,
ErrorLineNumber int,
ErrorDateTime datetime
)

--log error information in ErrorLogs table
alter proc usp_insertStudentV2
@RN int,@Name varchar(50),@Gender varchar(10),@Email varchar(100)
as
begin
    begin try
    insert into StudentV2 values (@RN,@Name,@Gender,@Email)
    print'usp_insertStudentV2 execution completed'
	end try

	begin catch
	  --print'error in inserting student'
	  --raiserror('Error in inserting student',16,1)
	  insert into ErrorLogs values
	  ( ERROR_PROCEDURE(),ERROR_MESSAGE(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_LINE(),
	  GETDATE())
	end catch
end

select *from Errorlogs

exec usp_insertStudentV2 3,'om','male', 'o@o.com'
exec usp_insertStudentV2 3,'komal','female', 'k@k.com'
exec usp_insertStudentV2 4,'komal','female', null

------------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------session20----------------------------------------------

--transaction 
--tcl--commit,rollback,savepoint
--if we have block or queries and which are dependent queries we want to run then all or none
--basic syntax

select *from Student
update Student set Name ='Bahubali'where RollNumber=8

----transaction
begin transaction
update Student set Name ='Bahubali'where RollNumber=8

commit transaction--permanent in table

Rollback transaction---previous state/value permanent in table

---tranaction with some logic
create table Account
(
AccountNumber int primary key,
Name varchar(50),
Balance int check( Balance >=5000 and Balance<=10000)
)
insert into Account values (1,'Nishant',8000),(2,'Suraj',6000)
select *from Account

--------------------------
---balance transfer--sp
create proc usp_FundTransfer
@FromAccountNumber int,@ToAccountNumber int,@Amount int
as
begin
begin try
 declare @FromAccountBalance int
 select @FromAccountBalance=Balance from Account where AccountNumber=@FromAccountNumber
 if(@FromAccountBalance<@Amount)
 begin
 raiserror('Low balance',16,1)
 end
     else
	   begin
	   ---debit
	       update Account set Balance=Balance-@Amount where AccountNumber=@FromAccountNumber
	   ---credit
	   	       update Account set Balance=Balance+@Amount where AccountNumber=@ToAccountNumber

	   end

end try

  begin catch
        print error_message()
  end catch
end

exec usp_FundTransfer @fromAccountNumber=1,@ToAccountNumber=2,@Amount=500

select *into #Account from Account
select *from #Account
select *from Account

exec usp_FundTransfer @fromAccountNumber=1,@ToAccountNumber=2,@Amount=2500

--add some amount to 1 account number
update Account set Balance=10000 where AccountNumber=1
---
exec usp_FundTransfer @fromAccountNumber=1,@ToAccountNumber=2,@Amount=1000

alter proc usp_FundTransfer
@FromAccountNumber int,@ToAccountNumber int,@Amount int
as
begin
begin try
begin transaction
 declare @FromAccountBalance int
 select @FromAccountBalance=Balance from Account where AccountNumber=@FromAccountNumber
 if(@FromAccountBalance<@Amount)
 begin
 raiserror('Low balance',16,1)
 end
     else
	   begin
	   ---debit
	       update Account set Balance=Balance-@Amount where AccountNumber=@FromAccountNumber
	   ---credit
	   	       update Account set Balance=Balance+@Amount where AccountNumber=@ToAccountNumber

	   end
commit
end try

  begin catch
  rollback
        print error_message()
  end catch
end

------------------------------------------------------------------------------------
--update records in two tables at same time
--1--using transaction
--2--using join--select/insert/update/delete

---------------------------------------------------------------------------
---concurrent requests
---concurrent means requests at the same time
--dead lock
--resource --table
