use b19DB

create table DotNetStudents
(
 RollNumber int,
 Name varchar(50),
 City varchar(50)
)

insert into DotNetStudents values (1, 'Vishal', 'Mumbai'), (2, 'Shital', 'Pune'),
(3, 'Aniket', 'Pune')

create table TestingStudents
(
 RollNumber int,
 Name varchar(50),
 Gender varchar(50)
)

insert into TestingStudents values (1, 'Mahesh', 'Male'), (2, 'Shital', 'Female'),
(3, 'Dipak', 'Male')

select RollNumber, Name from DotNetStudents
select RollNumber, Name from TestingStudents

-- it combines all records from both select queries 
select RollNumber, Name from DotNetStudents
union all
select RollNumber, Name from TestingStudents

-- it combines all records from both select queries 
-- it avoid duplicates retrieve only unique records 
-- it sorts records 
select RollNumber, Name from DotNetStudents
union
select RollNumber, Name from TestingStudents

-- it checks all records from both select queries only retrieves common records
select RollNumber, Name from DotNetStudents
intersect
select RollNumber, Name from TestingStudents

-- it checks all records from both select queries only retrieves uncommon records from first select
select RollNumber, Name from DotNetStudents
except
select RollNumber, Name from TestingStudents

-- combine records as well as columns from select queries using union 
select RollNumber, Name, City from DotNetStudents
union all 
select RollNumber, Name, Gender from TestingStudents

-- answer
select RollNumber, Name, null as Gender, City from DotNetStudents
union all 
select RollNumber, Name, Gender, null as City from TestingStudents

-- two or more select queries
select RollNumber, Name, null as Gender, City from DotNetStudents
union all 
select RollNumber, Name, Gender, null as City from TestingStudents
union all 
select RollNumber, Name, null as Gender, City from DotNetStudents
