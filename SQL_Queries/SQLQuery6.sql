create database selfjoin
use selfjoin

-- self join
select *
from table1 as a
join table1 as b
on a.managerid = b.id

-- 1. find the manaer name of the each empolyee
select a.name as empname, b.name as managername
from selfjoin as a
join selfjoin as b
on a.managerid = b.empid

-- 2. find the empolyees working under parul
select b.name as managername, a.name as empname
from selfjoin as a
join selfjoin as b
on a.managerid = b.empid
where b.name = 'parul'

-- 3. find the employees who are manager
select distinct b.name as managername
from selfjoin as a
join selfjoin as b
on a.managerid = b.empid

-- 4. find employees who do not have manager
select a.name as empname
from selfjoin as a
left join selfjoin as b
on a.managerid = b.empid
where a.managerid is null

select *
from selfjoin
where managerid is null

-- 5. find the employees earning more than their manager
select a.name, b.name
from selfjoin as a
join selfjoin as b
on a.managerid = b.empid
where a.salary > b.salary

-- find the employee working in the same dept
select a.name as empname,b.name, a.deptname as departname
from selfjoin as a 
join selfjoin as b
on a.deptname = b.deptname
where a.empid < b.empid

UPDATE selfjoin
SET deptname = 'Marketing'
WHERE empid = 7;

select *
from selfjoin
--
-- 7. find the employee reporting to the same manager
select a.name as empname,b.name, a.deptname as departname
from selfjoin as a 
join selfjoin as b
on a.managerid = b.managerid
where a.empid < b.empid

