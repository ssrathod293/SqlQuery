use b19db

select * from employee 
-- employee id = S-1, S-2, S-3

select Id, Name, 'S-' + Id from Employee

-- type conversion using cast() function 
select Id, Name, 'V#' + cast(Id as varchar(5)) as EmpID from Employee

-- type conversion using convert() function 
select Id, Name, 'V#' + CONVERT(varchar(5), Id) as EmpID from Employee

-- current datetime - we will se in detail
select getdate() -- 2022-04-17 08:17:15.917

-- declare @Date varchar(50) = '2022-04-17'
print 'style 100 : ' + convert(varchar(50), getdate(), 100) -- style 100 : Apr 17 2022  8:20AM
print 'style 101 : ' + convert(varchar(50), getdate(), 101) -- style 101 : 04/17/2022
print 'style 102 : ' + convert(varchar(50), getdate(), 102) -- style 102 : 2022.04.17
print 'style 103 : ' + convert(varchar(50), getdate(), 103) -- style 103 : 17/04/2022
print 'style 104 : ' + convert(varchar(50), getdate(), 104) -- style 104 : 17.04.2022

select abs(-10) -- 10
select ceiling(10.1) -- 11
select ceiling(-2.1) -- -2
select floor(10.1) -- 10 
select floor(-2.1) -- -3
select square(47) -- 2209
select sqrt(16) -- 4
select ROUND(10.457,2) -- 10.460
select ROUND(10.457,2,1) -- 10.450
select ROUND(786.457,2) -- 786.460
select ROUND(786.457,-2) -- 800.000
select ROUND(786.457,-1) -- 790.000
select POWER(2, 3) -- 8

-- deterministic functions 
	-- functions whose result will remain same for given set of input values 
	-- for ex. square(), sqrt(), power() etc.. etc..
-- non deterministic functions 
	-- functions whose result will not remain same always 
	-- for ex. rand()

-- rand() function always gives random value between 0 & 1
select rand() 
-- 0.457086045646337
-- 0.643110351005103
-- 0.0936853128874936
-- 0.672062263049945

-- 0 value??? 
	-- 0000001 / 1000000 / 1.00000

-- random values between 0 to 100
select rand() * 100 -- 87.3213667008826
select FLOOR(rand() * 100) 
select FLOOR(rand() * 1000) 

-- questions bank - question table - 100 questions 
-- 12th paper - A B C D

declare @start int = 1
while(@start <= 10)
begin
	print floor(rand() * 100)
	set @start = @start + 1
end

-- can we make rand() function as deterministic function?
-- YES, we can give seed value 

print floor(rand(5) * 100) -- 5 is seed value here, we can provide any value