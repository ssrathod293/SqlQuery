use b19db

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

select * from Student1 where RollNumber between 5 and 15


drop table Student1

create table Student1
(
RollNumber int primary key, 
Name varchar(50),
Gender varchar(10),
Fees int 
)

insert into Student1 values (1, 'Vishal', 'Male', 15000),
(11, 'Shital', 'Female', 20000), (6, 'Snehal', 'Female', 25000),
(4, 'Suraj', 'Male', 10000), (47, 'Sandip', 'Male', 5000)

select * from Student1

select * from Student1 where RollNumber between 5 and 15

select * from Student1 where Fees between 5000 and 10000

-- basic syntax
create index Ix_Student_Fees
on Student1(Fees)

-- non clustered - non unique index 
create index Ix_Student_Fees
on Student1(Fees)

-- non clustered - unique index 
create unique index Ix_Student_Fees
on Student1(Fees)

-- clustered - non unique index 
create clustered index Ix_Student_Fees
on Student1(Fees)

-- clustered - unique index 
create unique clustered index Ix_Student_Fees
on Student1(Fees)


-- if we have multiple columns involved either in condition or while selecting from table
select Name, Fees from Student1 where Fees between 5000 and 10000

-- covering index - index which is created on more columns 
create index Ix_Student_Fees_Name
on Student1(Fees, Name)

-- by default primary key creates clustered index 
-- can we create clustered index on other column than primary key column?
-- YES. 

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

-- clustered index on fees column
create clustered index Ix_Student_Fees
on Student1(Fees)

-- primary key - YES - drop recreate - design mode 
-- PK creates unique non clustered index 

-- unique constraint creates unique non clustered index 

exec sp_help Student1

-- covering index
create index Ix_Student_Fees_Name
on Student1(Fees, Name)

select count(1) from Student1

drop table Student1

create table Student1
(
RollNumber int, 
Name varchar(50),
Gender varchar(10),
Fees int 
)

-- it will insert 5000 dummy records into Student1 table
declare @start int = 1
while(@start <= 5000)
begin
	insert into Student1 values
	(@start, 'Student ' + cast(@start as varchar(6)), 'Male', @start * 100)
	set @start = @start + 1
end

select count(1) from Student1
select RollNumber, Name from Student1

-- insert 1 lac records 
declare @start int = 5001
while(@start <= 100000)
begin
	insert into Student1 values
	(@start, 'Student ' + cast(@start as varchar(10)), 'Male', @start * 100)
	set @start = @start + 1
end

select count(1) from Student1
select RollNumber, Name from Student1