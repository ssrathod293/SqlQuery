use b19db

drop table Student1

create table Student1
(
RollNumber int, 
Name varchar(50),
Gender varchar(10),
Fees int 
)

insert into Student1 values (1, 'Vishal', 'Male', 15000),
(11, 'Shital', 'Female', 20000), (6, 'Snehal', 'Female', 25000),
(4, 'Suraj', 'Male', 10000), (47, 'Sandip', 'Male', 5000)

select * from Student1

-- print Name and length of characters - using cursor 

create table #Student (Name varchar(50), NumberOfCharacters int)

declare @Name varchar(50)
declare StudentCursor cursor for 
select Name from Student1

open StudentCursor

fetch next from StudentCursor into @Name

while(@@FETCH_STATUS = 0)
begin
	-- print @Name + ' - ' + cast(len(@Name) as varchar(5))
	insert into #Student values(@Name, len(@Name))
	fetch next from StudentCursor into @Name
end

close StudentCursor

deallocate StudentCursor

select * from #Student

-- reading multiple columns 

drop table #Student

create table #Student (Name varchar(50), Fees int, NumberOfCharacters int)

declare @Name varchar(50), @Fees int
declare StudentCursor cursor for 
select Name, Fees from Student1

open StudentCursor

fetch next from StudentCursor into @Name, @Fees

while(@@FETCH_STATUS = 0)
begin
	-- print @Name + ' - ' + cast(len(@Name) as varchar(5))
	insert into #Student values(@Name, @Fees, len(@Name))
	fetch next from StudentCursor into @Name, @Fees
end

close StudentCursor

deallocate StudentCursor

select * from #Student

-- reading multiple columns - remaining fees 

drop table #Student

create table #Student (Name varchar(50), NumberOfCharacters int, Fees int, RemainingFees int)

declare @Name varchar(50), @Fees int
declare StudentCursor cursor for 
select Name, Fees from Student1

open StudentCursor

fetch next from StudentCursor into @Name, @Fees

while(@@FETCH_STATUS = 0)
begin
	-- print @Name + ' - ' + cast(len(@Name) as varchar(5))
	insert into #Student values(@Name, len(@Name), @Fees, 50000 - @Fees)
	fetch next from StudentCursor into @Name, @Fees
end

close StudentCursor

deallocate StudentCursor

select * from #Student