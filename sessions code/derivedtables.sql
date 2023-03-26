use b19db

select * from course
select * from trainer 
select * from student

-- trainer id along with student count 
select TrainerId, count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId

-- trainer id along with student count which has equal or more than 2 students 

-- 1 - view 
create view vw_trainerAssignedStudents
as
(select TrainerId, count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId)

select * from vw_trainerAssignedStudents where Total >= 2

-- 2 - temporary table 
select TrainerId, count(RollNumber) as Total into #Student from Student
where TrainerId is not null
group by TrainerId

select * from #Student where Total >= 2

-- 3 - table variable 
declare @Student table (TrainerId int, Total int)

insert into @Student 
select TrainerId, count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId

select * from @Student where Total >= 2

-- 4 - derived table 
select * from 
(select TrainerId, count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId) TTable
where Total >= 2

-- select * from TTable -- this wont work

-- 5 - cte 

-- declare cte 
with cte
as
(
select TrainerId, count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId
)
-- use cte 
select * from cte where Total >= 2

-- declare cte 
with TrainerCTE
as
(
select TrainerId, count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId
)
-- use cte 
select * from TrainerCTE where Total >= 2

-- declare cte 
with TrainerCTE (TrainerId, TotalStudents)
as
(
select TrainerId, count(RollNumber) as Total from Student
where TrainerId is not null
group by TrainerId
)

-- sql query 
select 'Hello'

-- use cte 
select * from TrainerCTE where TotalStudents >= 2 -- wont work 

-- we can use cte in any query like select/ update/ delete/ insert 
-- even we can use in join or union also 

select * from VHaaShEmployees

-- emp name & manager name 
select e.Name as EmpName, m.Name as MgrName
from VHaaShEmployees e left join VHaaShEmployees m
on e.ManagerId = m.Id

-- emp level 
with cte (Id, Name, ManagerId, Level)
as
(
	select Id, Name, ManagerId, 1 as Level from VHaaShEmployees where ManagerId is null
	union all
	select e.Id, e.Name, e.ManagerId, (cte.Level + 1) as Level from VHaaShEmployees e join cte 
	on e.ManagerId = cte.Id
)
select Name, Level from cte

insert into VHaaShEmployees values (6, 'Sneha', 4)

-- inserting through cte 
with cte 
as
(
select * from VHaaShEmployees
)
insert into cte values(7, 'Diksha', 4)

select * from VHaaShEmployees

-- can we insert/ update/ delete through cte?
-- may or may not be 


