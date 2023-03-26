use b19db

select * from VhaashEmployees

-- null - absense of value 

-- employee name & manager name 
select e.Name as EmployeeName, m.Name as ManagerName
from VhaashEmployees e left join VhaashEmployees m
on e.ManagerId = m.Id 

-- isnull function = 2 parameter = most prefferable choice to replace null value
select e.Name as EmployeeName, ISNULL(m.Name, 'NO MANAGER') as ManagerName
from VhaashEmployees e left join VhaashEmployees m
on e.ManagerId = m.Id 

-- case statement 
select e.Name as EmployeeName, 
(case when m.Name is not null then m.Name else 'NO MANAGER' end) as ManagerName
from VhaashEmployees e left join VhaashEmployees m
on e.ManagerId = m.Id 

-- coalesce function 
select e.Name as EmployeeName, COALESCE(m.Name, 'NO MANAGER') as ManagerName
from VhaashEmployees e left join VhaashEmployees m
on e.ManagerId = m.Id


-- case statement with multiple conditions

select e.Name as EmployeeName,
(case 
when m.Name is null then 'BOSS'
when m.Name = 'Vikul' then 'MANAGER'
else m.Name
end
) as ManagerName
from VhaashEmployees e left join VhaashEmployees m
on e.ManagerId = m.Id

select Name, City from Student

select Name, City, 
(case 
when City = 'Mumbai' then 'M'
when City = 'Sangali' then 'S'
else 'NO CITY'
end
) as NewCity
from Student

-- update city Mumbai = M 
update Student set City = 'M' where City = 'Mumbai'
-- update city Sangali = S
update Student set City = 'S' where City = 'Sangali'

-- update city Mumbai = M, Sangali = S
update Student set City = (case 
when City = 'Mumbai' then 'M'
when City = 'Sangali' then 'S'
else 'NO CITY'
end
)

select Name, City from Student

-- month number to month name 
declare @M int = 13
select 
(
case 
	when @M = 1 then 'January'
	when @M = 2 then 'February'
	when @M = 3 then 'March'
	when @M = 4 then 'April'
	when @M = 5 then 'May'
	when @M = 6 then 'June'
	when @M = 7 then 'July'
	when @M = 8 then 'August'
	when @M = 9 then 'September'
	when @M = 10 then 'October'
	when @M = 11 then 'November'
	when @M = 12 then 'December'
	else 'INVALID MONTH'
end 
) as MonthName

-- coalesce function = we can write multiple arguments 
-- coalesce function returns first non null value
select e.Name as EmployeeName, coalesce(m.Name, 'NO MANAGER') as ManagerName
from VhaashEmployees e left join VhaashEmployees m
on e.ManagerId = m.Id

create table Customer
(
Id int primary key identity,
Name varchar(50),
PrimaryEmail varchar(50),
AlternateEmail varchar(50)
)

insert into Customer values ('Suraj', 's@s.com', 's1@s.com'),
('Nishant', 'n@n.com', null), ('Shashikant', null, 's1@s.com'),
('Mohan', null, null)

select Name, PrimaryEmail,AlternateEmail from Customer

select Name, PrimaryEmail,AlternateEmail,
coalesce(PrimaryEmail, AlternateEmail, 'NO EMAIL') as CommunicationEmail
from Customer