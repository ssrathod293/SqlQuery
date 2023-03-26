use b19db

--left()
select Name, LEFT(Name, 3) from Student

-- all student whose name starts with V 
select Name from Student where Name like 'V%'
select Name from Student where left(Name, 1)  = 'V'

--right()
select Name, RIGHT(Name, 3) from Student

-- all student whose name ends with l
select Name from Student where Name like '%l'
select Name from Student where right(Name, 1)  = 'l'

--charindex() - to find a character position in expression
select * from Student

declare @Email varchar(50) = 'vikulrathod'
print charindex('@', @Email) -- 0 means not exists
set @Email = 'vikul@gmail.com'
print charindex('@', @Email) -- 6
print charindex('v', @Email) -- 1

set @Email = 'vikul.rathod.net@rediffmail.com'

--substring() - part of string / portion of string / partial string 
print substring(@Email, 1, 5) -- username 
print substring(@Email, 7, 9) -- username 

-- email = username + domain

print substring(@Email, 1, charindex('@', @Email) - 1) -- username 
print substring(@Email, charindex('@', @Email) + 1, len(@Email) - charindex('@', @Email)) -- username 

select Email, 
substring(Email, 1, charindex('@', Email) - 1) as UserName,
substring(Email, charindex('@', Email) + 1, len(Email) - charindex('@', Email)) as Domain
from Student

create table #Student(Id int primary key identity, Name varchar(50), Email varchar(50))

insert into #Student values ('vishal', 'vishal@gmail.com'),('shital', 'shital1989@mail.com'),
('nishant', 'nishant2022@rediffmail.com'), ('suraj', 'suraj.sonawane@gmail.com')

select Name, Email,
substring(Email, 1, charindex('@', Email) - 1) as UserName,
substring(Email, charindex('@', Email) + 1, len(Email) - charindex('@', Email)) as Domain
from #Student

select 
substring(Email, charindex('@', Email) + 1, len(Email) - charindex('@', Email)) as Domain,
count(Id) as Total from #Student
group by substring(Email, charindex('@', Email) + 1, len(Email) - charindex('@', Email))

declare @Adhaar varchar(14) = '4567 7894 4455'
print 'XXXX XXXX ' + substring(@Adhaar, 11, 4)

--replicate()
print replicate('chandani', 5)
declare @Adhaar1 varchar(14) = '4567 7894 4455'
print replicate('X', 8) + substring(@Adhaar1, 11, 4)

declare @Mobile varchar(10) = '8956890522'
print replicate('*', 8) + right(@Mobile, 2)

--space()
print space(50)
print 'anil' + space(50) + 'rathod'

--patindex() - to check pattern - we can use all wild card characters
declare @Name varchar(50) = 'vihaan'
print patindex('%[0-9]%', @Name)

--replace()
declare @Email2 varchar(50) = 'pratidnya@gmail.com'
print @Email2
print replace(@Email2, 'gmail', 'vhaashtech')

--stuff()
-- stuffed email
declare @Email3 varchar(50) = 'pratidnya@gmail.com' -- 'pra****ya@gmail.com'
print @Email3
print stuff(@Email3, 4, 4, '****')
print stuff(@Email3, 2, 6, '******')

