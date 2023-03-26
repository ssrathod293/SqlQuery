use b19db

create table #Student
(
Name varchar(50),
Gender varchar(10)
)

insert into #Student values ('Suraj', 'Male'), ('Nikita', 'Female') ,
('Suraj', 'Male'), ('Suraj', 'Male'), ('Kiran', 'Female'), ('Kiran', 'Male') 

select * from #Student

-- duplicate fetch / delete - it wont work correctly 
select * from #Student where Name = 'Suraj'
delete from #Student where Name = 'Suraj'

-- over clause 
select * from student

select City, Count(1) from Student group by City
select distinct City, count(1) over(partition by City) from student

-- row_number()
select Name, Gender from #Student

select Name, Gender, ROW_NUMBER() over(order by Name) as RollNumber from #Student

select Name, Gender, ROW_NUMBER() over(partition by Name order by Name) as RollNumber 
from #Student

select Name, Gender, ROW_NUMBER() over(partition by Name, Gender order by Name) as RollNumber 
from #Student

-- unique select 
select distinct Name, Gender from #Student -- performance wise not good 


with cte
as
(
select Name, Gender, ROW_NUMBER() over(partition by Name, Gender order by Name) as RollNumber 
from #Student
)
-- select * from cte where RollNumber > 1 -- fetching duplicates 
delete from cte where RollNumber > 1 -- deleting duplicates

select Name, Gender from #Student

create table #Employee
(
	Id int primary key identity,
	Name varchar(50),
	Gender varchar(10),
	Salary int 
)

insert into #Employee values ('Suraj', 'Male', 50000), ('Sagar', 'Male', 45000),
 ('Shubham', 'Male', 45000),  ('Varsha', 'Female', 40000),
  ('Nishat', 'Male', 37000),  ('Suyog', 'Male', 37000),
   ('Sandip', 'Male', 30000)

select Id, Name, Gender, Salary from #Employee
select Id, Name, Gender, Salary,
row_number() over(partition by salary order by salary) as R1
from #Employee

-- rank()
-- in case of duplicates gives same ranking
-- it skips default ranking

select Id, Name, Gender, Salary,
rank() over(order by salary) as R1
from #Employee

select Id, Name, Gender, Salary,
rank() over(order by salary desc) as R1
from #Employee

with cte 
as
(
select Id, Name, Gender, Salary,
rank() over(order by salary desc) as R1
from #Employee
)
select * from cte where R1 = 2

-- 3rd highest salary 
with cte 
as
(
select Id, Name, Gender, Salary,
rank() over(order by salary desc) as R1
from #Employee
)
select * from cte where R1 = 3

-- dense_rank() 
-- in case of duplicates gives same ranking
-- it does not skips default ranking
select Id, Name, Gender, Salary,
dense_rank() over(order by salary desc) as R1
from #Employee

declare @HighestSalary int = 4
;with cte
as
(
select Id, Name, Gender, Salary,
dense_rank() over(order by salary desc) as R1
from #Employee
)
select * from cte where R1 = @HighestSalary

-- ntile() - to create chunks or group of records 
-- useful in case of data backup or data migration 
select Id, Name, Gender, Salary,
ntile(3) over(order by salary desc) as R1
from #Employee


-- all in one 
select Id, Name, Gender, Salary,
row_number() over(order by salary desc) as R1,
rank() over(order by salary desc) as R2,
dense_rank() over(order by salary desc) as R3,
ntile(3) over(order by salary desc) as R4
from #Employee

-- competition  - top 3 winners 
-- 1st winner = 25000 
-- 2nd winner = 20000 
-- 3rd winner = 15000 

-- marks = 98, 95, 95, 95, 92
-- dense_rank() = 1,2,2,2,3
-- rank() = 1,2,2,2,5 = rank() will be useful 
	-- 1 - 25000
	-- 2 - 3 people = 35000 / 3 = 11500

