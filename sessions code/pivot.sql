drop table #Employee

CREATE TABLE #Employee  
(  
   Name [nvarchar](max),  
   [Year] varchar(50) ,  
   Sales [int]  
)  

INSERT INTO #Employee  
SELECT 'Pankaj','2010',72500 UNION ALL  
SELECT 'Rahul','2010',60500 UNION ALL  
SELECT 'Sandeep','2010',52000 UNION ALL  
SELECT 'Pankaj','2011',45000 UNION ALL  
SELECT 'Sandeep','2011',82500 UNION ALL  
SELECT 'Rahul','2011',35600 UNION ALL  
SELECT 'Pankaj','2012',32500 UNION ALL  
SELECT 'Pankaj','2010',20500 UNION ALL  
SELECT 'Rahul','2011',200500 UNION ALL  
SELECT 'Sandeep','2010',32000   

select * from #Employee

select Name, Year, Sales from #Employee

-- name in columns 
SELECT [Year], Pankaj,Rahul,Sandeep FROM  #Employee 
PIVOT  
(  
SUM(Sales) FOR Name IN (Pankaj,Rahul,Sandeep)
) PTable

-- year in columns 
SELECT [Year], 2010,2011, 2012 FROM  #Employee 
PIVOT  
(  
SUM(Sales) FOR Year IN ('2010','2011','2012')
) PTable

-- TASK - add a new column "country" - INDIA, PAK, CHINA 

-- in output 
select Name, INDIA, PAK, CHINA from #EMployee -- this whould work use pivot 

-- name in columns - pivot 
SELECT [Year], Pankaj,Rahul,Sandeep into #Employee1 FROM #Employee 
PIVOT  
(  
SUM(Sales) FOR Name IN (Pankaj,Rahul,Sandeep)
) PTable

-- name in rows - unpivot 
select * from #Employee1

SELECT [Year], Name, Sales  FROM #Employee1 
UNPIVOT  
(  
Sales FOR Name IN (Pankaj,Rahul,Sandeep)
) PTable
