use b19db

-- datename returns varchar() value 
-- datepart returns int value 

print datename(day, getdate()) -- 20
print datepart(day, getdate()) -- 20

print datename(m, getdate()) -- April
print datepart(m, getdate()) -- 4

print datename(dw, getdate()) -- Wednesday
print datepart(dw, getdate()) -- 4 [Sun to Sat]

print datename(dw, '09/16/1989') -- Saturday
print datename(dw, '09/16/1990') -- Sunday

print sysdatetimeoffset() -- 2022-04-20 07:48:59.3258674 +05:30
print datename(tz, sysdatetimeoffset())

--dateadd()
print dateadd(day, 2, getdate()) -- Apr 22 2022  7:51AM
print dateadd(m, 1, getdate())  -- May 20 2022  7:52AM
print dateadd(day, -10, getdate()) -- Apr 10 2022  7:53AM

--datediff()
print datediff(year, '1989-09-16', '2022-04-20') -- 33
print datediff(day, '1989-09-16', '2022-04-20') -- 11904
print datediff(month, '1989-09-16', '2022-04-20') -- 391
print datediff(day, '2022-04-20', '2022-04-22') -- 2
print datediff(month, '2022-04-1', '2022-04-30') -- 0
print datediff(month, '2022-04-30', '2022-05-01') -- 1

-- age calculate
--	2022-04-20
-- -
--	1989-09-16
---------------
--  33 age 
--	32 7 4 age 

declare @DOB date = '1998-06-05', @CurrentDate date = getdate()
declare @Years int, @Months int, @Days int
declare @Temp date = @DOB
select @Years = datediff(year, @Temp, @CurrentDate) - 
(case when month(@Temp) > month(@CurrentDate) or
(month(@Temp) = month(@CurrentDate) and day(@Temp) > day(@CurrentDate)) then 1 else 0 end)

set @Temp = DATEADD(year, @Years, @Temp)

select @Months = DATEDIFF(month, @Temp, @CurrentDate) - 
(case when day(@DOB) > day(@CurrentDate) then 1 else 0 end)

set @Temp = DATEADD(month, @Months, @Temp)

select @Days = DATEDIFF(day, @Temp, @CurrentDate)

print cast(@Years as varchar(5)) + ' years ' + cast(@Months as varchar(5)) + ' months ' +
cast(@Days as varchar(6)) + ' days'

-- end of the month 
print eomonth(getdate()) -- 2022-04-30
-- salary last working day of month 

-- parts 
print datefromparts(2022,4,20) -- 2022-04-20
print datefromparts(2022,2,30) -- error
print timefromparts(12, 45, 52, 785, 3) -- 12:45:52.785
print smalldatetimefromparts(2022, 4, 20, 8, 39) -- Apr 20 2022  8:39AM
print datetimefromparts(2022,4,20,8,39,57,784) -- Apr 20 2022  8:39AM
print datetime2fromparts(2022,4,20,8,40,55,7894, 4) -- 2022-04-20 08:40:55.7894
print datetime2fromparts(2022,4,20,8,40,55,7894789, 7) -- 2022-04-20 08:40:55.7894789
print datetimeoffsetfromparts(2022, 4,20,8,41,54,789,5,30,3) -- 2022-04-20 08:41:54.789 +05:30

