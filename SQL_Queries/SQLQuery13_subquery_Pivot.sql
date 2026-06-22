
-- find the empolyeewhose salary is grater than the salary of all emps in HR dept
select *
from Employees2 e1
where SALARY > all (select max(SALARY) from Employees2 e2
				where DEPT_NAME = 'hr'
				)


-- find the empolyeewhose salary is grater than the salary of any emps in admin dept

select *
from Employees2 e1
where SALARY > any (select max(SALARY) from Employees2 e2
				where DEPT_NAME = 'admin'
				)

-- find the dept with more than 3 employees
select distinct DEPT_NAME
from Employees2 e1
where (select COUNT(*) from Employees2 e2 where e2.DEPT_NAME = e1.DEPT_NAME) >3

-- find the employee whose salary is unique in their department
select *
from Employees2 e1
where (select COUNT(*)
				from Employees2 e2
				where e2.DEPT_NAME = e1.DEPT_NAME
				and	e2.SALARY = e1.SALARY
				--and e2.emp_ID <> e2.emp_ID
				) = 1
order by DEPT_NAME

--PIVOT TABLE

SELECT year, [p1], [p2]
from (select year_, p1, p2, from tablex) as source_table
pivot (sum(sales) for product_ in [p1], [p2]) as pivot_table

-- year,region, total profit

select yr, [East], [West], [South], [Central]
from (select year([Order Date]) as yr,Region, profit from orders) as source_table
pivot (sum(profit) for region in ([East], [West], [south], [Central])) as pivot_table 

-- region, segment, average sales
select region, [home office], [corporate], [consumer]
from (select region, Segment, Sales from Orders) as t1
pivot (avg(sales) for segment in ([home office], [corporate], [consumer])) as t2

-- INDEX 

-- Clustered Index: index key is shorted in the same table
--					there can be only one clustered index
--					clustered index is faster compare to non-clustered
create clustered index I1
on orders ([order id], [order date]) 

-- Non-Clustered Index: index key is shorted in the saperat table
--						there can be multipal non-clustered index
--						non-clustered in slower than clustered index
create nonclustered index I2
on orders ([customer id])

create nonclustered index I3
on orders (sales)

-- stored procedures

-- stored procedure without parameter
create procedure SP_Sample1
as
begin

select [order id], [customer id], Sales
from Orders
where Region = 'central'
and Sales >700
end

-- to execute the SP without parameter: there are three mathods
SP_Sample1
exec SP_Sample1
execute SP_Sample1


-- to edit the Stored Procedure
alter procedure SP_Sample1
as
begin

select [order id], [customer id], Sales, Region
from Orders
where Region = 'east'
and Sales >500
end