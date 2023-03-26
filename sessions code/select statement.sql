select * from Course 
select * from trainer 
select * from student

-- select means retrieve 
-- selection criteria

-- select all records from table
select * from student 

-- avoid using *, performance & maintainability 
select RollNumber, Name, Mobile, Email,
PAN, Adhaar, Age, City, CourseId, TrainerId from Student 

-- to select limited number of records 
select top 2 RollNumber, Name, Mobile, Email,
PAN, Adhaar, Age, City, CourseId, TrainerId from Student

-- to select unique records 
select distinct Mobile, Email, PAN, ADHaar from student

select distinct RollNumber, Name, Mobile, Email,
PAN, Adhaar, Age, City, CourseId, TrainerId from Student 

-- column alias 
select distinct RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 

-- filter data - where clause 
-- condition - true / false 
-- condition - operators 
-- = equalto, != <> not equal, <, <=, >, >=

-- all students
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 

-- select students who has 123 as mobile 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Mobile = '123'

-- select records with always true condition 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where 1 <> 1

-- select student who has 1 as rollnumber 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where RollNumber = 1

-- select student whose name is Vishal
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Name = 'Vishal'

-- select student who belongs to trainer id 1
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where TrainerId = 1

-- to combine multiple conditions we can use "and" or "or" keyword  
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where RollNumber = 2 and Name = 'Vishal'

select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where RollNumber = 2 or Name = 'Vishal'

-- students having age 20 or 21 or 22 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Age = 20 or Age = 21 or Age = 22

-- range 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Age between 20 and 30

-- students having age 12 or 21 or 25 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Age in (12,21,25)
-- where Age = 12 or Age = 21 or Age = 25

-- students not having age 12 or 21 or 25 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Age not in (12,21,25)

-- student having name kiran
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Name = 'kiran'

-- student having name which starts with K
-- we can achieve using "like" operator 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Name like 'k%'

-- student having name which ends with l
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Name like '%l'

-- student having name which contains with sh
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Name like '%sh%'

-- student having name which contains with second character is i
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Name like '_i%'

-- %, _, [], {}, ^ - wild card characters 

-- student having name which does not contains with second character is i
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where Name not like '_i%'


select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
where City = 'Mumbai' or Age between 15 and 20

-- normal mathematical operators - between and, and or, in, like, not

-- all students 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 

-- sort - ascending order a to z or 1 to 10, descending order z to a, 10 to 1

-- ascending order by age 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
order by Age

select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
order by Age desc

-- we can sort records based on multiple columns 
select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student 
order by City, Age 


select top 2 RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student
order by RollNumber desc

-- group by clause 
-- grouping 
-- aggregate functions 

select RollNumber, Name as [Student Name], Mobile, Email,
PAN as PANNumber, Adhaar, Age, City, CourseId, TrainerId from Student

-- count() - returns number of records - count(1)
select count(*) from student -- 4

-- min() - returns minimum value from all records 
select min(Age) from Student -- 12

-- max() - returns maximum value from all records 
select max(Age) from Student -- 25

-- sum() - returns total sum of all records 
select sum(Age) from Student -- 76

-- avg() - returns average of all records 
select avg(Age) from Student -- 19

-- select city and number of students 
select City, count(RollNumber) as TotalStudents from Student
group by City

select CourseId, count(RollNumber) as TotalStudents from Student
group by CourseId

select CourseId, TrainerId, count(RollNumber) as TotalStudents from Student
group by CourseId, TrainerId
