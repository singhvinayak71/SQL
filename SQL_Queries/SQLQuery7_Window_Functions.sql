-- WINDOW FUNCTIONS
create database windowFunction
use windowFunction

UPDATE Employees
SET Salary = 65000
WHERE EmpID = 1014;

-- ROW-NUMBER ():- It provides unique number to each row

select *,
ROW_NUMBER () OVER (partition by departmentid order by departmentid) as RN
from Employees

select *,
ROW_NUMBER () OVER (partition by managerID order by EmpID) as RN
from Employees

-- 1. find the unique row in the empolyee table
select *,
ROW_NUMBER () over (order by departmentid)
from Employees
-- 2. find the unique row in each department
select *,
ROW_NUMBER () over (partition by managerID order by empname)
from Employees

-- RANK ():- it providers ranking to each row,same number gets same ranking but skips the next number in case of duplicates
select *,
rank () over (order by salary) Rank
from Employees

-- DENSE_RANK ():- it provides ranking to each row, same number gets same rank but next number is not skip
select *,
DENSE_RANK () over (partition by managerID order by salary) rank
from Employees

select *,
ROW_NUMBER () over (partition by managerID order by empname),
rank () over (order by salary) Rank,
DENSE_RANK () over (partition by managerID order by salary) Drank
from Employees

use sql6052
select Region, Sales,
ROW_NUMBER () over (partition by region order by sales desc) as RN,
RANK () over (partition by region order by sales desc) as Ranks,
DENSE_RANK () over (partition by region order by sales desc) as DE_Rank
from Orders


-- LEAD ():- next row from the current row
select *,
LEAD (EmpName) over (order by empid) as nxt_empName 
from Employees

select *,
LEAD (EmpName,2) over (order by empid) as nxt_empName 
from Employees

-- LAG ():- previous row from the current row
select *,
lag (EmpName,2,0) over (order by empid) as nxt_empName 
from Employees

-- FIRST_VALUE ()
-- LAST_VALUE ()
-- SUM() -- RUNNING TOTAL
-- AVG() -- MOVING AVG
-- NTILE ()