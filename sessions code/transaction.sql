use b19db

select * from student

update Student set Name = 'Bahubali' where RollNumber = 8

-- transaction 
begin transaction
	update Student set Name = 'Rocky' where RollNumber = 8

commit transaction -- permanent in table

select * from student

begin transaction
	update Student set Name = 'Bahubali' where RollNumber = 8

rollback transaction -- previous state/ value permanent in table

-- transaction with some logic 
create table Account
(
	AccountNumber int primary key,
	Name varchar(50),
	Balance int check (Balance >= 5000 and Balance <= 10000)
)

insert into Account values (1, 'Nishant', 8000), (2, 'Suraj', 6000)

select * from Account

-- balance transfer - sp 

create proc usp_FundTransfer
@FromAccountNumber int, @ToAccountNumber int, @Amount int
as
begin
	begin try 
		declare @FromAccountBalance int
		select @FromAccountBalance = Balance from Account where AccountNumber = @FromAccountNumber
		if(@FromAccountBalance < @Amount)
			begin
				raiserror('Low Balance', 16, 1)
			end
		else
			begin
				-- debit 
				update Account set Balance = Balance - @Amount where AccountNumber = @FromAccountNumber
				-- credit 
				update Account set Balance = Balance + @Amount where AccountNumber = @ToAccountNumber
			end
	end try
	begin catch 
		print error_message()
	end catch 
end

select * into #Account from Account
select * from #Account

exec usp_FundTransfer @FromAccountNumber = 1, @ToAccountNumber = 2, @Amount = 500

select * from #Account
select * from Account

exec usp_FundTransfer @FromAccountNumber = 1, @ToAccountNumber = 2, @Amount = 1000

-- 1	Nishant	6500
-- 2	Suraj	7500

exec usp_FundTransfer @FromAccountNumber = 1, @ToAccountNumber = 2, @Amount = 2500
select * from Account

-- add some amount to 1 account number 
update Account set Balance = 10000 where AccountNumber = 1

--1	Nishant	10000
--2	Suraj	7500

exec usp_FundTransfer @FromAccountNumber = 1, @ToAccountNumber = 2, @Amount = 3000

select * from Account

-- sp alter with transaction 

alter proc usp_FundTransfer
@FromAccountNumber int, @ToAccountNumber int, @Amount int
as
begin
	begin try 
	begin transaction
		declare @FromAccountBalance int
		select @FromAccountBalance = Balance from Account where AccountNumber = @FromAccountNumber
		if(@FromAccountBalance < @Amount)
			begin
				raiserror('Low Balance', 16, 1)
			end
		else
			begin
				-- debit 
				update Account set Balance = Balance - @Amount where AccountNumber = @FromAccountNumber
				-- credit 
				update Account set Balance = Balance + @Amount where AccountNumber = @ToAccountNumber
			end
	 commit
	end try
	begin catch 
		rollback
		print error_message()
	end catch 
end

--1	Nishant	10000
--2	Suraj	7500

exec usp_FundTransfer @FromAccountNumber = 1, @ToAccountNumber = 2, @Amount = 3000

select * from Account

-- update records in two tables at same time 
	-- 1 - using transaction 
	-- 2 - using join -> select / insert/ update / delete  (check it) - TASK 

