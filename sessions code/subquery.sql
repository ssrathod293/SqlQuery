select * from course 
select * from student 
select * from trainer 

-- retrieve all students which are enrolled for courses 
select Name, CourseId from Student 
where CourseId in (1, 2) -- hard coded value

select CourseId from Course -- all course Id 

-- subquery 
-- retrieve all students which are enrolled for courses 
select Name, CourseId from Student 
where CourseId in (select CourseId from Course) 

-- retrieve all students which are not enrolled for any courses 
select Name, CourseId from Student 
where CourseId not in (select CourseId from Course) 

-- all courses which has students
select distinct CourseId from Student 

-- retrieve course name which does not have any students 
select CourseId, Name from Course
where CourseId not in (select distinct CourseId from Student where CourseId is not null)

-- there are two different queries 
-- inner query (subquery) and outer query 
-- outer query depends on inner query
-- inner query executes first 
-- inner query execute once 

-- retrieve all courseId along with number of students 
select CourseId, count(RollNumber) as Total from Student
where CourseId is not null
group by CourseId

-- retrieve all course names along with number of students 
select CourseId, count(RollNumber) as Total from Student
where CourseId is not null
group by CourseId


select count(RollNumber) from Student where CourseId = 1
select count(RollNumber) from Student where CourseId = 2

select Name from Course

-- retrieve all course names along with number of students
select Name, (select count(RollNumber) from Student where CourseId = Course.CourseId) as Total
from Course 

-- there are two different queries (corelated subquery)
-- inner query (subquery) and outer query
-- inner query depends on outer query
-- outer query executes first 
-- inner query execute multiple times till the recordss are there in outer query 

-- Task:
	-- trainer, course, student 
	-- insert few more records into all these 3 tables 
	-- 1 - write a query to retrive trainer name and number of students assigned him 
	-- 2 - write a query to retrive trainer name who does not have any students
	-- 3 - write a query to retrive student names who does not have course 
	-- 4 - write a query to retrive student names who does not have trainer
	-- 5 - write a query to retrive student names who does not have course & trainer both


-- all students 
select Name, Age from student

-- maximum age 
select max(Age) from student 

-- second highest age 
select max(Age) from student 
where Age < (select max(Age) from student)