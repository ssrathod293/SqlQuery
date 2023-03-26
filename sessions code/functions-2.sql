use b19db

-- character = alphabets + digits + special characters 
select ASCII('A') -- 65
select ASCII('Z') -- 90
select ASCII('a') -- 97
select ASCII('z') -- 122
select ASCII('0') -- 48
select ASCII('9') -- 57
select ASCII('#') -- 35

-- if I have ascii code and I want to find character?
select char(38) -- &
select char(65) -- A

declare @Name varchar(50) = '   Anil   '
print len(@Name) -- 4
print lower(@Name) -- anil
print upper(@Name) -- ANIL
print reverse(@Name) -- linA
select @Name -- '   Anil   '
select ltrim(@Name) -- 'Anil   ' 'Anil   '
select rtrim(@Name) -- '   Anil' '   Anil'
select trim(@Name) -- 'Anil' 'Anil'


--len()
--lower()
--upper()
--reverse()
--ltrim()
--rtrim()
--trim()

select Name, lower(Name) as NameInLower, 
UPPER(Name) as NameInUpper, len(Name) as Length,
reverse(Name) as ReveresedName from student
