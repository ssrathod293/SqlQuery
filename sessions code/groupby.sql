-- group by clause 

select * from Student

-- total student count 
select count(1) from Student -- 4

-- city wise student count
select City, count(1) as Total from Student 
group by City

-- city wise student count which has more than 2 student 
select City, count(1) as Total from Student 
where count(1) > 2
group by City

-- Msg 147, Level 15, State 1, Line 14
-- An aggregate may not appear in the WHERE clause unless it is in a subquery 
-- contained in a HAVING clause or a select list, and the column being 
-- aggregated is an outer reference.

-- city wise student count which has more than 2 student 
select City, count(1) as Total from Student 
group by City
having count(1) > 2
