use b19db

-- query 1
select * from Student where RollNumber = 1
select distinct * from Student where RollNumber = 1

-- write query -> compile query -> execute query
-- compile = check syntax + efficient way to execute query (Execution plan)

-- query 1
select * from Student where RollNumber = 1 -- execution  plan 
-- query 2
select * from Student where RollNumber = 2 -- new execution  plan

select * from vw_Student

execute sp_helptext vw_Student

create view vw_Student  
as  
(select RollNumber, Name, Mobile from Student)

execute sp_help Student

-- basic syntax

create procedure usp_getStudents
as
begin
	-- body - we can write mutiple queries inside it
	select * from Student
end

-- where to find it? -> object explorer -> database -> Programmability -> stored procedures

-- execute sp
execute usp_getStudents

-- alter stored procedure
alter procedure usp_getStudents
as
begin
	-- body - we can write mutiple queries inside it
	select RollNumber, Name, Age, CourseId, TrainerId from Student
end

-- execute sp
execute usp_getStudents

-- read value from stored proecure which is returned using return statement 

declare @spValue int 
execute @spValue = usp_getStudents
print @spValue

-- return statement in stored procedure 
create procedure usp_getStudentsCount
as
begin
	-- body - we can write mutiple queries inside it
	declare @count int
	select @count = count(1) from Student
	return @count
end

-- execute 
declare @spValue int 
execute @spValue = usp_getStudentsCount
print @spValue

-- return statement in stored procedure to return name of student
create procedure usp_getStudentName
as
begin
	-- body - we can write mutiple queries inside it
	declare @name varchar(50)
	select @name = Name from Student where RollNumber = 1
	return @name
end

-- execute 
declare @spValue varchar(50) 
execute @spValue = usp_getStudentName
print @spValue

-- error : Conversion failed when converting the varchar value 'Vishal' to data type int.

-- stored procedure with parameters 
-- remember : parameter name & variable name always prefixed with @ symbol
create proc usp_getStudentByCity
@City varchar(50)
as
begin
	select * from Student where City = @City
end

-- execute 
exec usp_getStudentByCity
-- error: Procedure or function 'usp_getStudentByCity' expects parameter '@City', which was not supplied.

exec usp_getStudentByCity @City='M'

-- stored procedure with multiple input parameters 
alter proc usp_getStudentByCity
@City varchar(50), @Age int
as
begin
	select * from Student where City = @City and Age > @Age
end

-- execute 
exec usp_getStudentByCity @City='M'
-- error : Procedure or function 'usp_getStudentByCity' expects parameter '@Age', which was not supplied.

exec usp_getStudentByCity @City = 'M', @Age = 20

-- stored procedure with multiple input parameters & output parameters
create proc usp_getStudentsWithOutput
@RollNumber int, @Name varchar(50) output
as
begin
	select @Name = Name from Student where RollNumber = @RollNumber
end

-- execute 
declare @N varchar(50)
exec usp_getStudentsWithOutput @RollNumber = 1,@Name = @N out
print @N


-- stored procedure with multiple input parameters & output parameters
alter proc usp_getStudentsWithOutput
@RollNumber int, @Name varchar(50) output, @PAN varchar(50) output
as
begin
	select @Name = Name, @PAN = PAN from Student where RollNumber = @RollNumber
end

-- execute 
declare @N varchar(50), @P varchar(50)
exec usp_getStudentsWithOutput @RollNumber = 1,@Name = @N out, @PAN = @P output
print @N + ' ' + @P

-- sp with multiple tables 
create proc usp_StudentDetails
as
begin
	select s.RollNumber, s.Name as StudentName, ISNULL(c.Name, 'NA') as CourseName,
	ISNULL(t.Name, 'NA') as TrainerName
	from student s left join course c on s.CourseId = c.CourseId
	left join trainer t on s.TrainerId = t.Id
end

-- execute 
exec usp_StudentDetails

-- stored procedure with optional parameters 
create proc usp_students
as
begin
	select * from Student
end

-- execute 
exec usp_students

alter proc usp_students
@City varchar(50)
as
begin
	select * from Student where City = @City 
end

-- execute 
exec usp_students -- all students -- not working
exec usp_students @City = 'M' -- all students having city = 'M'

-- city as optional parameter
alter proc usp_students
@City varchar(50) = null 
as
begin
	select * from Student where (City = @City or @City is null)
end

-- execute 
exec usp_students -- all students 
exec usp_students @City = 'M' -- all students having city = 'M'
exec usp_students @City = 'S' -- all students having city = 'S'

alter proc usp_students
@City varchar(50) = null, @Age int = null
as
begin
	select * from Student where 
	(City = @City or @City is null) and
	(Age > @Age or @Age is null)
end

-- execute
exec usp_students -- all students 
exec usp_students @City = 'M' -- all students having city = 'M'
exec usp_students @City = 'S' -- all students having city = 'S'
exec usp_students @Age = 18 -- all students having age > 18
exec usp_students @Age = 18, @City = 'S'  -- all students having age > 18 and City = 'S'

