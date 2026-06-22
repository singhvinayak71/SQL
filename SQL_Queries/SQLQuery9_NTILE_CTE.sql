-- NTILE

select *,
ntile(3) over (order by salary)
from Employees

-- find the first product sold by orderdate in each region
select Region, [Product Name], [Order Date],
FIRST_VALUE([product name]) over (partition by region order by [order date]) as First_product
from Orders

-- find the last product sold by order date in each segment
select Segment, [Product Name], [Order Date],
LAST_VALUE([product name]) over (partition by segment order by [order date]
								rows between unbounded preceding and unbounded following) as last_product
from Orders

-- Find each customer, find the first and last order dates
select [Customer Name], [Order Date],
first_value([order date]) over (order by [order date]) as first_order,
last_value([order date]) over (order by [order date]
						rows between unbounded preceding and unbounded following) as last_order
from Orders

-- divide the empolyee date into three vased on highest to lowest salary,
-- then generate a column where 1 specifices higherst paid, 2 as average paid,
-- 3 as lowest paid

select *,
ntile(3) over (order by salary desc) as NTILE_,
case when ntile(3) over (order by salary desc) = 1 then 'high paid'
	when ntile(3) over (order by salary desc) = 2 then 'average paid'
	else 'lowest paid'
	end as [salary category]
from Employees


-- TEMPORARY TABLE

-- local temp: we donate with #
--				are only avaiable in the current window/session
--				gets automatically deleted when the current window is closed

create table #temp(id int, name varchar(30))
select * from #temp

-- globle temp: we denote with ##
--				can be use in all window/session
--				gets deleted when all windows are closed

create table ##temp2(salary int, dept varchar(30))
select * from ##temp2


--- CTE: Common Table Expression

select *,
ntile(3) over (order by salary desc) as NTILE_,
case when ntile(3) over (order by salary desc) = 1 then 'high paid'
	when ntile(3) over (order by salary desc) = 2 then 'average paid'
	else 'lowest paid'
	end as [salary category]
from Employees

with cte as (
		select *,
		ntile(3) over (order by salary desc) as NTILE_
		from Employees
		)
	select *,
	case
		when NTILE_ = 1 THEN 'HIGH PAID'
		WHEN NTILE_ = 2 THEN 'AVERAGE PAID'
		ELSE 'LOWEST PAID'
		END AS SALARY_GROUP
		FROM CTE

--Find the empolyee who is earning more than average salary

with x as (select AVG(salary) as avg_salary from Employees)

select *
from Employees
cross join x
where Salary > avg_salary

-- find the dept whose average salary is grater then overall average salary
with t1 as (select [dept_name], AVG(salary) as dept_avg
			from Employees2
			group by [dept_name]),
	t2 as (select AVG(salary) as overall 
			from Employees2)
			
select *
from t1 cross join t2
where dept_avg > overall
