print getdate() -- Apr 19 2022  9:04AM
print current_timestamp -- Apr 19 2022  9:04AM
print sysdatetime() -- 2022-04-19 09:04:24.4959653
print sysdatetimeoffset() -- 2022-04-19 09:04:24.4959653 +05:30
print getutcdate() -- Apr 19 2022  3:34AM
print sysutcdatetime() -- 2022-04-19 03:34:24.4969637

create table tblDate
(
c_date date,
c_time time,
c_smalldatetime smalldatetime,
c_datetime datetime,
c_datetime2 datetime2,
c_datetimeoffset datetimeoffset
)

insert into tblDate values
(getdate(), getdate(),getdate(),getdate(),getdate(),getdate())

insert into tblDate values
(getdate(), getdate(),getdate(),getdate(),getdate(),sysdatetimeoffset())

select * from tblDate

-- datatype
-- date - only date hold
-- time - only time hold
-- datetimeoffset - date along with offset hold 
-- smalldatetime - date range - less, 4 bytes memory
-- datetime - date range - less but more than smalldatetime, 8 bytes memory
-- datetime2 - date range - more, 6 to 8 bytes memory

-- current
print getdate() -- Apr 19 2022  9:28AM

declare @DOB date = '1989-09-16'
print @DOB
set @DOB = '09/16/1989' -- 'mm/dd/yyyy' 
print @DOB
set @DOB = '16/09/1989' -- 'dd/mm/yyyy' 
print @DOB

print isdate('16/09/1989') -- 0 (invalid date)
print isdate('09/16/1989') -- 1 (valid date)
print isdate('vikul')
print isdate('13/30/1990')

print day(getdate()) -- 19
print day('09/16/1989') -- 16

print month(getdate()) -- 4
print month('09/16/1989') -- 9

print year(getdate()) -- 2022
print year('09/16/1989') -- 1989

-- datepart - year, month, day, quarter, dayname, hours, mins, seconds etc.. etc..

print datename(hour, getdate()) -- 9
print datename(minute, getdate()) -- 38
print datename(weekday, getdate()) -- Tuesday
print datename(q, getdate()) -- 2 
print datename(dayofyear, getdate()) -- 109

--datepart()
--dateadd()
--datediff()