use b19db

go

create table StudentV2 
(
RollNumber int primary key,
Name varchar(50),
Gender varchar(10) check (Gender = 'Male' or Gender = 'Female'),
Email varchar(50) not null
)

insert into StudentV2 values (1, 'Nishat', 'Male', 'n@n.com')

select * from StudentV2

-- error 1
insert into StudentV2 values (1, 'Suraj', 'Male', 's@s.com')
-- Msg 2627, Level 14, State 1, Line 17
-- Violation of PRIMARY KEY constraint 'PK__StudentV__E9F06F17CA2BB004'. Cannot insert duplicate key in object 'dbo.StudentV2'. The duplicate key value is (1).

-- error 2
insert into StudentV2 values (2, 'Suraj', 'Bond007', 's@s.com')
--Msg 547, Level 16, State 0, Line 23
--The INSERT statement conflicted with the CHECK constraint "CK__StudentV2__Gende__25518C17". The conflict occurred in database "B19DB", table "dbo.StudentV2", column 'Gender'.

-- error 3
insert into StudentV2 values (2, 'Suraj', 'Male', null)
--Msg 515, Level 16, State 2, Line 28
--Cannot insert the value NULL into column 'Email', table 'B19DB.dbo.StudentV2'; column does not allow nulls. INSERT fails.

select * from menahiahere
--Msg 208, Level 16, State 1, Line 32
--Invalid object name 'menahiahere'.

-- sp to insert student 
create proc usp_insertStudentV2
@RN int, @Name varchar(50), @Gender varchar(10), @Email varchar(100)
as
begin
	insert into StudentV2 values (@RN, @Name, @Gender, @Email)
end

exec usp_insertStudentV2 1, 'Om', 'Male', 'o@o.com'

-- alter with @@Error
alter proc usp_insertStudentV2
@RN int, @Name varchar(50), @Gender varchar(10), @Email varchar(100)
as
begin
	insert into StudentV2 values (@RN, @Name, @Gender, @Email)
	if(@@Error <> 0)
		begin 
			print 'there is error in inserting student'
		end
	else
		begin
			print 'student insert success'
		end
	print 'usp_insertStudentV2 execution completed'
end

exec usp_insertStudentV2 3, 'Om', 'Male', 'o@o.com'

exec usp_insertStudentV2 3, 'Komal', 'Female', 'k@k.com'

-- alter with try catch block
alter proc usp_insertStudentV2
@RN int, @Name varchar(50), @Gender varchar(10), @Email varchar(100)
as
begin
	begin try
		insert into StudentV2 values (@RN, @Name, @Gender, @Email)
		print 'usp_insertStudentV2 execution completed'
	end try
	begin catch
		print 'Error in inserting student'
	end catch
end

exec usp_insertStudentV2 3, 'Komal', 'Female', 'k@k.com'

-- raiserror function -> 

alter proc usp_insertStudentV2
@RN int, @Name varchar(50), @Gender varchar(10), @Email varchar(100)
as
begin
	begin try
		insert into StudentV2 values (@RN, @Name, @Gender, @Email)
		print 'usp_insertStudentV2 execution completed'
	end try
	begin catch
		raiserror('Error in inserting student',16,1)
	end catch
end

exec usp_insertStudentV2 3, 'Komal', 'Female', 'k@k.com'


-- table to store error logs 
create table ErrorLogs
(
ErrorLogId int primary key identity,
StoredProcedureName varchar(50),
ErrorMessage varchar(200),
ErrorSeverity int,
ErrorState int,
ErrorLineNumber int,
ErrorDateTime datetime 
)

-- log error information in ErrorLogs table 
alter proc usp_insertStudentV2
@RN int, @Name varchar(50), @Gender varchar(10), @Email varchar(100)
as
begin
	begin try
		insert into StudentV2 values (@RN, @Name, @Gender, @Email)
		print 'usp_insertStudentV2 execution completed'
	end try
	begin catch
		-- raiserror('Error in inserting student',16,1)
		insert into ErrorLogs values 
		(ERROR_PROCEDURE(), ERROR_MESSAGE(), ERROR_SEVERITY(), ERROR_STATE(), ERROR_LINE(), getdate())
	end catch
end

exec usp_insertStudentV2 3, 'Komal', 'Female', 'k@k.com'
exec usp_insertStudentV2 4, 'Komal', 'GENDER NOT SPECIFIED', 'k@k.com'
exec usp_insertStudentV2 3, 'Komal', 'Female', null
exec usp_insertStudentV2 3, 'Komal', 'Female', 'k@k.com'

select * from ErrorLogs
select * from StudentV2

-- remember  -- schema changes - DatabaseSchemaChanges

select * from DatabaseSchemaChanges

-- if you are creating any database on shared server 
-- and you dont want anyone to disturb your database 
-- 1 - permission - grant / revoke 
-- 2 - database in single user mode 

go
USE master;
GO
-- single user mode set 
ALTER DATABASE YourDatabaseName
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO
--ALTER DATABASE AdventureWorks2012
--SET READ_ONLY;
GO
-- multi user mode set 
ALTER DATABASE AdventureWorks2012
SET MULTI_USER;
GO