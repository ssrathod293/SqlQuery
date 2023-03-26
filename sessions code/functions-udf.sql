use b19db

-- user defined functions 

--scalar functions

create function fn_StudentName()
returns varchar(50)
as
begin
	return 'Vikas'
end

select dbo.fn_StudentName()

alter function fn_StudentName(@RollNumber int)
returns varchar(50)
as
begin
	declare @Name varchar(50)
	select @Name = Name from Student where RollNumber = @RollNumber
	return @Name
end


select RollNumber, dbo.fn_StudentName(RollNumber) from Student

create function fn_Age(@DOB date)
returns varchar(100)
as
begin
	declare @CurrentDate date = getdate()
	declare @Years int, @Months int, @Days int
	declare @Temp date = @DOB
	select @Years = datediff(year, @Temp, @CurrentDate) - 
	(case when month(@Temp) > month(@CurrentDate) or
	(month(@Temp) = month(@CurrentDate) and day(@Temp) > day(@CurrentDate)) then 1 else 0 end)

	set @Temp = DATEADD(year, @Years, @Temp)

	select @Months = DATEDIFF(month, @Temp, @CurrentDate) - 
	(case when day(@DOB) > day(@CurrentDate) then 1 else 0 end)

	set @Temp = DATEADD(month, @Months, @Temp)

	select @Days = DATEDIFF(day, @Temp, @CurrentDate)

	return cast(@Years as varchar(5)) + ' years ' + cast(@Months as varchar(5)) + ' months ' +
	cast(@Days as varchar(6)) + ' days'
end

select dbo.fn_Age('1989-09-16') -- 32 years 7 months 4 days

-- inline table valued functions - returns table

-- 1 - we cannot write begin end 
-- 2 - we cannot customize schema of returned table

create function fn_Student()
returns table
as
return (select * from student)

select * from fn_Student()

alter function fn_Student(@City varchar(50))
returns table
as
return (select * from student where City = @City)

select * from fn_Student('S')

-- when function  when view????
-- answer : we cannot write parameter to view but we can write parameter to a function

-- multi statement table valued functions - returns table

-- 1 - we can write begin end 
-- 2 - we can customize schema of returned table

create function fn_Students()
returns @Student table (RollNumber int, StudentName varchar(50))
as
begin
	insert into @Student
	select RollNumber, Name from Student

	return
end

select * from fn_Students()

alter function fn_Students(@City varchar(50))
returns @Student table (RollNumber int, StudentName varchar(50))
as
begin
	insert into @Student
	select RollNumber, Name from Student where City = @City

	return
end

select * from fn_Students('M')


select count(1) from student

-- sp supports deferred name resolution 
-- we can create sp even if that object does not exists
create proc usp_sp1
as
begin
	select * from abcd
end

exec usp_sp1

-- function does not supports deferred name resolution 
-- we cannot create function if that object does not exists

create function fn_fn1()
returns table
as
return(select * from abcd)