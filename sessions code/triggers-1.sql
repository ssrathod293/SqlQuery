use b19db

drop table s1

create table s1 (Id int)

-- eventdata() function - returns xml output
-- this xml contains information about that ddl command 

--<EVENT_INSTANCE>
--  <EventType>DROP_TABLE</EventType>
--  <PostTime>2022-04-27T07:49:29.717</PostTime>
--  <SPID>66</SPID>
--  <ServerName>PC-VIKUL-RATHOD\SQLEXPRESS</ServerName>
--  <LoginName>PC-VIKUL-RATHOD\user</LoginName>
--  <UserName>dbo</UserName>
--  <DatabaseName>B19DB</DatabaseName>
--  <SchemaName>dbo</SchemaName>
--  <ObjectName>s1</ObjectName>
--  <ObjectType>TABLE</ObjectType>
--  <TSQLCommand>
--    <SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" />
--    <CommandText>drop table s1</CommandText>
--  </TSQLCommand>
--</EVENT_INSTANCE>

-- XML - extensible markup language - why? store and transfer data 

-- table to store logs 
create table DatabaseSchemaChanges
(
LogId int primary key identity,
LoginName varchar(50),
ServerName varchar(50),
DatabaseName varchar(100),
ObjectType varchar(100),
ObjectName varchar(100),
CommandText varchar(500),
LogDateTime datetime 
)

-- alter trigger to insert logs to DatabaseSchemaChanges 
ALTER trigger [Tr_Server_DDL_Table]
on all server 
for create_table, alter_table, drop_table, create_procedure
as
begin
	declare @XML xml
	select @XML = EVENTDATA()
	declare @LoginName varchar(50), @ServerName varchar(50), @DatabaseName varchar(100),
	@ObjectType varchar(100), @ObjectName varchar(100), @CommandText varchar(500)
	set @LoginName = @XML.value('(/EVENT_INSTANCE/LoginName)[1]','nvarchar(max)')
	set @ServerName = @XML.value('(/EVENT_INSTANCE/ServerName)[1]','nvarchar(max)')
	set @DatabaseName = @XML.value('(/EVENT_INSTANCE/DatabaseName)[1]','nvarchar(max)')
	set @ObjectType = @XML.value('(/EVENT_INSTANCE/ObjectType)[1]','nvarchar(max)')
	set @ObjectName = @XML.value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)')
	set @CommandText = @XML.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')

	insert into B19DB.dbo.DatabaseSchemaChanges values
	(@LoginName, @ServerName,@DatabaseName,@ObjectType,@ObjectName, @CommandText, GETDATE())

	-- print 'Tr_Server_DDL_Table trigger executed'
end
GO

create table s1 (Id int)

drop table s1

select * from DatabaseSchemaChanges

use B18DB

create table s1 (Id int)

drop table s1

use B19DB

select * from DatabaseSchemaChanges

use B18DB
go
create proc usp_demoTrigger as 
begin 
	select * from student
end
go

use B19DB

select * from DatabaseSchemaChanges

-- logon trigger 
-- trigger logic will get executed on connecting to sql server 

-- number of sessions on this server
select * from sys.dm_exec_sessions
select count(1) from sys.dm_exec_sessions

-- select count(1) from sys.dm_exec_connections

select ORIGINAL_LOGIN()

select * from sys.dm_exec_sessions where original_login_name = ORIGINAL_LOGIN()

-- if we want to limit number of sessions per user 
select count(1) from sys.dm_exec_sessions where original_login_name = ORIGINAL_LOGIN()

-- logic to restrict session to 5 for a user 

declare @NumberOfSessions int 
select @NumberOfSessions = count(1) from sys.dm_exec_sessions where original_login_name = ORIGINAL_LOGIN()

begin transaction
if(@NumberOfSessions <= 4)
	begin
		print 'session allowed'
	end
else
	begin
		rollback -- send him back 
		print '5th session not allowed'
	end

