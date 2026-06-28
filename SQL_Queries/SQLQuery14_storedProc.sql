-- stored precedure

alter proc SP_sample2
@segment varchar(30)

as begin

select * from Orders
where Segment = @segment

end
SP_sample2 'corporate'

-- VIEWS

create view VW_test
as
select emp_ID, emp_NAME, DEPT_NAME
from Employees2
where DEPT_NAME = 'it'

select * from vw_test

-- find the empolyee who logged in 3 or more consecutive days
with t1 as (select empid, logindate,
			ROW_NUMBER() over (partition by empid order by logindate) as rn
								from tablex),
			t2 as (select *,
					DATEADD (day, -rn, logindate) as datediff_
					from t1)

			select empid
			from t2
			group by empid, datediff_
			having count(*) > 3

-- find the customers who have placed order in any first 3 months and not in last 9 months
select distinct [customer id]
from Orders
where MONTH([order date]) in (1,2,3)
group by [Customer ID]


-- find the customers who have placed order in all first 3 months and not in last 9 months
select distinct [customer id]
from Orders
where MONTH([order date]) <= 3
group by [Customer ID]
having COUNT(month([order date])) = 3