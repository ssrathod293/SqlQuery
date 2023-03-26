use b19db

select * from Employee

insert into Employee (Name, City) values ('Nishant', 'Pune'), ('Sneha', 'Mumbai')

-- set identity_insert Employee ON  -- we can insert identity column value explicitely 

insert into Employee (Id, Name, City) values (4, 'Mahesh', 'Pune') -- not possible

declare @Name varchar(50) = null  -- absense of value 
set @Name = 'null' -- null value 

select * from Employee

-- how to retrieve Id for this newly inserted employee?
insert into Employee (Name, City) values ('Mahesh', 'Pune') -- Id ???

select SCOPE_IDENTITY() -- 4
select @@IDENTITY -- 4
select IDENT_CURRENT('Employee') -- 4


-- session 1 

insert into Employee (Name, City) values ('Vishal', 'Pune') -- 5

select SCOPE_IDENTITY() -- 5
select @@IDENTITY -- 5
select IDENT_CURRENT('Employee') -- 5

exec usp_insertEmployee -- new employee inserted using sp 

select SCOPE_IDENTITY() -- 5
select @@IDENTITY -- 6
select IDENT_CURRENT('Employee') -- 6


-- sp to insert employee 
create proc usp_insertEmployee
as
begin
	insert into Employee (Name, City) values ('Suraj', 'Pune')
end 

-- session 2

select SCOPE_IDENTITY() -- null 
select @@IDENTITY -- null 
select IDENT_CURRENT('Employee') -- 6

execute usp_insertEmployee -- new employee is inserted 

select SCOPE_IDENTITY() -- null 
select @@IDENTITY -- 7
select IDENT_CURRENT('Employee') -- 7

execute usp_insertEmployee -- new employee is inserted 

select SCOPE_IDENTITY() --  null 
select @@IDENTITY -- 8
select IDENT_CURRENT('Employee') -- 8

insert into Employee values('Om', 'Mumbai')

select SCOPE_IDENTITY() -- 9   
select @@IDENTITY -- 9
select IDENT_CURRENT('Employee') -- 9


