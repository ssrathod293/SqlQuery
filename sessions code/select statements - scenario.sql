select * from Student

-- select statement returns a table 
select count(1) as TotalStudents from Student

select 1 as Col1

select 'Vishal'  as Name -- one query

select 1 as RollNumber, 'Vishal' as Name, null as City

-- variable 
-- variable name should prefix with @ symbol 

declare @RollNumber int = 10
select @RollNumber
set @RollNumber = 20
select @RollNumber as RN

select RollNumber, Name from Student

print 'HELLO'

-- conditional statement 
-- to control flow of queries 
-- if else 

declare @OldName varchar(50), @NewName varchar(50) -- declarations
set @OldName = 'Mahesh' -- value set 
set @NewName = 'Vishal' -- value set 

set @OldName = null
set @NewName = null

if (@OldName = @NewName)
	begin 
		-- if condition is true
		-- if body - where we can write multiple queries
		print 'EQUAL'
	end
else 
	begin 
		-- if condition is false
		print 'NOT EQUAL'
	end 

-- to check if value is null 
if(@OldName is null) -- true 
	begin
		print 'Old Name is null'
		set @OldName = 'Vishal'
	end

-- begin end = body where we can write multiple sql statements 


declare @RN int = 3
if exists (select Name from Student where RollNumber = @RN)
begin 
	update Student 
	set Name = 'Pratiksha'
	where RollNumber = @RN

	print 'SUCCESS'
end 
else 
begin
	print 'FAILED'
end

select Name from Student where RollNumber = 3

-- get new rollnumber to insert for new student 
declare @InsertRN int 
select @InsertRN = max(RollNumber) from Student
set @InsertRN = @InsertRN + 1

-- looping statement 
-- loop means iterations / repeat 

declare @start int = 1
while(@start <= 5)
	begin
			-- block will get executed till the condition is true 
		print @start
		set @start = @start + 1
	end

declare @s1 int = 2
while(@s1 <= 20)
	begin 
		print @s1 
		set @s1 = @s1 + 2
	end

declare @Number int = 29
declare @begin int = 1
while(@begin <= 10)
	begin 
		print @Number * @begin
		set @begin = @begin + 1 
	end

select 1

---------------------------------------------------------

select * from Student
select * from Course
select * from Trainer

-- school 
-- admission - rollnumber 26 
-- new admission - rollnumber ? - 27
-- company 
-- employees - employee id 51 
-- new employee join - employee id? 52
-- society - security - notebook 
-- entries - 29
-- new entry - 30

create table Employee 
(
Id int primary key identity,
Name varchar(50),
City varchar(50)
)

-- insert into Employee (Id, Name, City) values (1, 'Vishal', 'Pune')
insert into Employee (Name, City) values ('Vishal', 'Pune') -- 1
insert into Employee (Name, City) values ('Mahesh', 'Mumbai') -- 2 


insert into Employee (Name, City) values ('Shital', 'Pune') -- 3
insert into Employee (Name, City) values ('Snehal', 'Mumbai') -- 4



-- shital left company 
delete from Employee where Id = 3

select * from Employee

-- new employee - Id - ? = 5 
insert into Employee (Name, City) values ('Nishant', 'Pune') -- 5


-- new employee - Id - ? = 5  = and 3 Id is vacant 

set identity_insert Employee ON -- we can insert indentity value explicitely
insert into Employee (Id, Name, City) values (3,'Suraj', 'Pune') -- 3

-- new employee - Id - ? = auto incremented 
set identity_insert Employee OFF -- Id inserted automatically
insert into Employee (Name, City) values ('Pranav', 'Pune') 

-- organization closed - employees
delete from Employee

select * from Employee

-- reopening organization - new hiring 

insert into Employee (Name, City) values ('Nikita', 'Pune') 

-- reseed 
dbcc checkident(Employee, reseed, 0)

insert into Employee (Name, City) values ('Nikita', 'Pune') 

select * from Employee

---------------- seed increment customize 
create table Person
(
Id int identity(1000, 1), -- otp - no 100% secured
Name varchar(50)
)

insert into Person values ('Suyog'), ('Suraj'), ('Shubham')

select * from Person