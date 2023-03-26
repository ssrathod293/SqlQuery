-- new session 1

begin transaction
	insert into Account values (3, 'Nikita', 5000)

commit 
select * from Account

set transaction isolation level read uncommitted 
begin transaction
	insert into Account values (4, 'Pradnya', 6000)

rollback

-- new session 2

set transaction isolation level read uncommitted 
select * from Account