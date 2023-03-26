use b19db

select * from course 
select * from student

-- retrieve student name & course name 
select Student.Name as StudentName, Course.Name as CourseName
from Student inner join Course 
on Student.CourseId = Course.CourseId

-- table aliases 
select s.Name as StudentName, c.Name as CourseName
from Student s inner join Course c
on s.CourseId = c.CourseId

-- join is by default inner join
select s.Name as StudentName, c.Name as CourseName
from Student s join Course c
on s.CourseId = c.CourseId

-- left table ? = Student
-- right table ? = Course 

-- foriegn key table = Student 
-- primary key table = Course 

-- Trick: use foreign key table as left table & primary key table as right table 

-- Outer join 

-- left outer join - common plus uncommon data from left table 
select s.Name as StudentName, c.Name as CourseName
from Student s left join Course c
on s.CourseId = c.CourseId

-- right outer join - common plus uncommon data from right table 
select s.Name as StudentName, c.Name as CourseName
from Student s right join Course c
on s.CourseId = c.CourseId

-- full outer join - common plus uncommon data from both tables
select s.Name as StudentName, c.Name as CourseName
from Student s full join Course c
on s.CourseId = c.CourseId

-- cross join - cartesian product 
-- it maps each row from left table with each row of right table 
select s.Name as StudentName, c.Name as CourseName
from Student s cross join Course c

-- real time example - school db = student table & subject table = each student has all subjects

-- difference between full join & cross join
	-- full join requires on condition whereas cross join not
	-- full join returns common plus uncommon records from both tables whereas
	-- cross join maps each row of left table with every row from right table 

-- inner join 
select *
from Student s join Course c
on s.CourseId = c.CourseId

select s.*, c.Name as CourseName
from Student s join Course c
on s.CourseId = c.CourseId

-- only uncommon data from left table
select *
from Student s left join Course c
on s.CourseId = c.CourseId
where c.CourseId is null 

-- only uncommon data from right table
select *
from Student s right join Course c
on s.CourseId = c.CourseId
where s.RollNumber is null 

-- only uncommon data from both tables
select *
from Student s full join Course c
on s.CourseId = c.CourseId
where c.CourseId is null or s.RollNumber is null 


-- join scenario without PK & FK 
create table table1(col1 int)
insert into table1 values (1), (1), (2)

create table table2(col1 int)
insert into table2 values (1), (3), (4)

select * from table1
select * from table2

select * from table1 t1 join table2 t2 on t1.col1 = t2.col1

select * from table1 t1 left join table2 t2 on t1.col1 = t2.col1

select * from table1 t1 right join table2 t2 on t1.col1 = t2.col1

select * from table1 t1 full join table2 t2 on t1.col1 = t2.col1

select * from table1 t1 cross join table2 t2 

select * 
from student s join course c
on s.CourseId = c.CourseId

