use b19db

select * from student

insert into student values 
(5, 'Dipak', '9527788887', 'dipak@gmail.com', 'PAN5', 'ADHAAR5', 22, 'Mumbai', 1, 1)

-- basic syntax - for trigger 
create trigger Tr_Student_Insert
on Student
for insert 
as
begin
	print 'Tr_Student_Insert trigger executed'
end

-- new student 
insert into student values 
(6, 'Mohan', '9527788887', 'mohan@gmail.com', 'PAN6', 'ADHAAR6', 23, 'Pune', 1, 1)

select * from student

-- after trigger
alter trigger Tr_Student_Insert
on Student
after insert 
as
begin
	print 'Tr_Student_Insert trigger executed'
end

-- new student 
insert into student values 
(7, 'Mahendra', '9527788887', 'mahendra@gmail.com', 'PAN7', 'ADHAAR7', 26, 'Pune', 1, 1)

select * from student

-- instead of trigger
alter trigger Tr_Student_Insert
on Student
instead of insert 
as
begin
	print 'Tr_Student_Insert trigger executed'
end

-- new student 
insert into student values 
(8, 'Jitendra', '9527788887', 'jitendra@gmail.com', 'PAN8', 'ADHAAR8', 52, 'Mumbai', 1, 1)

select * from student



-- with after trigger - query will throw error 
alter trigger Tr_Student_Insert
on Student
after insert 
as
begin
	print 'Tr_Student_Insert trigger executed'
end

-- instead of trigger 
alter trigger Tr_Student_Insert
on Student
instead of insert 
as
begin
	print 'Tr_Student_Insert trigger executed'
end

-- use of instead of trigger 
-- new student 
insert into student values 
(1, 'Jitendra', '9527788887', 'jitendra@gmail.com', 'PAN8', 'ADHAAR8', 52, 'Mumbai', 1, 1)

select * from student

select * from inserted -- works only within trigger
select * from deleted -- works only within trigger

-- altering instead of trigger with magical tables 
alter trigger Tr_Student_Insert
on Student
instead of insert 
as
begin
	select * from inserted
	select * from deleted
end

-- new student 
insert into student values 
(1, 'Jitendra', '9527788887', 'jitendra@gmail.com', 'PAN8', 'ADHAAR8', 52, 'Mumbai', 1, 1)

select * from student

-- altering instead of trigger with magical tables - benefit
alter trigger Tr_Student_Insert
on Student
instead of insert 
as
begin
	declare @RN int, @Name varchar(50), @Mobile varchar(10), @Email varchar(100),
	@PAN varchar(15), @ADHAAR varchar(20), @Age int, @City varchar(50), @CId int, @TId int
	select @Name = Name, @Mobile = Mobile, @Email = Email, @City = City,
	@PAN = PAN, @ADHAAR = Adhaar, @Age = Age, @CId = CourseId, @TId = TrainerId from inserted

	select @RN = max(ROllNumber) from Student

	insert into student values 
	(@RN + 1, @Name, @Mobile, @Email, @PAN, @ADHAAR, @Age, @City, @CId, @TId)

	print 'new student inserted successfully using trigger'
end

-- new student 
insert into student values 
(1, 'Jitendra', '9527788887', 'jitendra@gmail.com', 'PAN8', 'ADHAAR8', 52, 'Mumbai', 1, 1)

select * from student

-- we will create a student audit table 
	-- 1 - student admission 
	-- 2 - student modified any data 
	-- 3 - student admission cancel 

create table StudentAuditLogs
(
	LogId int primary key identity,
	RollNumber int, 
	LogDate datetime,
	LogAction varchar(50),
	Description varchar(200)
)

select * from StudentAuditLogs

drop trigger Tr_Student_Insert

-- we will create a student audit table 
-- 1 - student admission log 

create trigger Tr_Student_Insert
on Student 
for insert
as
begin
	declare @RN int, @Name varchar(50)
	select @RN = RollNumber, @Name = Name from inserted

	insert into StudentAuditLogs values
	(@RN, getdate(), 'NEW ADMISSION', @Name + ' confirmed admission')
end

-- new student 
insert into student values 
(9, 'Rocky', '8956890522', 'rocky@gmail.com', 'PAN9', 'ADHAAR9', 42, 'Pune', 1, 1)

select * from student
select * from StudentAuditLogs

-- 2 - student admission cancel - log maintain
create trigger Tr_Student_Delete
on Student 
for delete
as
begin
	declare @RN int, @Name varchar(50)
	select @RN = RollNumber, @Name = Name from deleted

	insert into StudentAuditLogs values
	(@RN, getdate(), 'CANCEL ADMISSION', @Name + ' cancelled admission')
end

-- delete student 
delete from student where RollNumber = 9

select * from student
select * from StudentAuditLogs

-- 3 - student modified any data - log maintain
alter trigger Tr_Student_update
on Student 
for update
as
begin
	declare @OldRN int, @OldName varchar(50), @OldPAN varchar(20)
	select @OldRN = RollNumber, @OldName = Name, @OldPAN = PAN from deleted   -- old records from table

	declare @NewRN int, @NewName varchar(50), @NewPAN varchar(20)
	select @NewRN = RollNumber, @NewName = Name, @NewPAN = PAN  from inserted  -- newly data which is going to update

	declare @Description varchar(200) = 'Student with roll number ' + cast(@OldRN as varchar(5)) + ' has changed '
	if(@OldName <> @NewName)
		begin
			set @Description = @Description + ' name from ' + @oldName + ' to ' + @NewName
		end
	if(@OldPAN <> @NewPAN)
		begin
			set @Description = @Description + ' pan number from ' + @OldPAN + ' to ' + @NewPAN
		end

	insert into StudentAuditLogs values
	(@OldRN, getdate(), 'STUDENT PROFILE CHANGE', @Description)
end

-- modify student 
update student set Name = 'Rocky' where RollNumber = 8
-- student old name = jitendra => rocky 
-- deleted table will contain old data which will going to remove from table
-- inserted table will contain new data which will going to update in table

select * from student
select * from StudentAuditLogs

update student set PAN = 'AZYPR8940H' where RollNumber = 8

update student set Name = 'Nishant', PAN = 'NOT CREATED' where RollNumber = 1

-- particular student logs
select * from StudentAuditLogs where RollNumber = 8

-- recent logs 
select * from StudentAuditLogs order by LogDate desc

-- first 2 recent logs 
select top 2 * from StudentAuditLogs order by LogDate desc

-- can we create trigger on view = YES 
-- can we create trigger on temp table / table variable/ derived table/ cte = NO

select * from  [dbo].[vw_Student]

insert into vw_Student values (9, 'Pushpa', '8956890522')

-- trigger on view 
create trigger Tr_Vw_Student_Insert
on vw_Student
instead of insert
as
begin
	-- if we want to explicitely insert or update or delete records to base table 
	-- use inserted & deleted magical tables 
	print 'View is not created for insert or update or delete actions'
end

-- DDL trigger - database scope

create table s2 (Id int)

create trigger Tr_B19DB_Create_Table
on database 
for create_table
as
begin
	print 'Tr_B19DB_Create_Table trigger executed'
end

-- if we want to maintain all logs in one separate table - different database ?? = YES
-- DDL - table/ sp/ function/ view 

alter trigger Tr_B19DB_Create_Table
on database 
for create_table, alter_table, drop_table
as
begin
	print 'Tr_B19DB_Create_Table trigger executed'
end

drop table s1

-- DDL trigger - server scope - applicable to all databases 
create trigger Tr_Server_DDL_Table
on all server 
for create_table, alter_table, drop_table
as
begin
	print 'Tr_Server_DDL_Table trigger executed'
end

drop table s2

use b18db

create table s1(Id int)

use b19db

-- all logs happened on database we can track

select ORIGINAL_LOGIN() -- PC-VIKUL-RATHOD\user

alter trigger Tr_Server_DDL_Table
on all server 
for create_table, alter_table, drop_table
as
begin
	select EVENTDATA()
	print 'Tr_Server_DDL_Table trigger executed'
end

create table s1(Id int)

-- eventdata() funciton returns xml data 

--<EVENT_INSTANCE>
--  <EventType>CREATE_TABLE</EventType>
--  <PostTime>2022-04-26T09:18:07.520</PostTime>
--  <SPID>58</SPID>
--  <ServerName>PC-VIKUL-RATHOD\SQLEXPRESS</ServerName>
--  <LoginName>PC-VIKUL-RATHOD\user</LoginName>
--  <UserName>dbo</UserName>
--  <DatabaseName>B19DB</DatabaseName>
--  <SchemaName>dbo</SchemaName>
--  <ObjectName>s1</ObjectName>
--  <ObjectType>TABLE</ObjectType>
--  <TSQLCommand>
--    <SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" />
--    <CommandText>create table s1(Id int)</CommandText>
--  </TSQLCommand>
--</EVENT_INSTANCE>

