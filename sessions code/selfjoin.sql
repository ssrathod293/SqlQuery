create table VHaaShEmployees
(
Id int,
Name varchar(50),
ManagerId int
)

insert into VHaaShEmployees values
(1, 'Shashikant', 3), (2, 'Vikul', null), (3, 'Usha', 2),
(4, 'Nikita', 3), (5, 'Atul', 2)

select * from VHaaShEmployees

-- all employee names 
select Name from VHaaShEmployees

-- all employee names with their manager name
select e.Name as EmployeeName, m.Name as ManagerName
from VHaaShEmployees e join VHaaShEmployees m 
on e.ManagerId = m.Id

select e.Name as EmployeeName, m.Name as ManagerName
from VHaaShEmployees e left join VHaaShEmployees m 
on e.ManagerId = m.Id

-- all manager names with reporting employee count
select m.Name as ManagerName, count(e.Id) as TotalEmployee
from VHaaShEmployees e join VHaaShEmployees m 
on e.ManagerId = m.Id
group by m.Name

