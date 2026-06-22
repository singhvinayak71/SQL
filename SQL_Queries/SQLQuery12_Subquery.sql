-- find the customer who paid higher sales
with customerSales as (
						select [Customer ID], [Customer Name], SUM(sales) as total_sales
						from Orders
						group by [Customer ID],[Customer Name]
						)
		select *
		from customerSales
		where total_sales > (select AVG(total_sales) from customerSales)

-- CORELATED SUB-QUERY

-- find the region whose sales is grater than avg sales of that particular region
select region, sales
from Orders as o1
where Sales > (select avg(sales) from Orders as o2
				where o1.Region = o2.Region)


-- find the employee whose salary is grater than dept avg salary

select emp_NAME,DEPT_NAME ,SALARY
from Employees2 as emp_salary
where SALARY > (select AVG(salary) from Employees2 as dept_avgSalary
				where emp_salary.DEPT_NAME = dept_avgSalary.DEPT_NAME)

-- find the profit whose profit is greater than avg profit of thier category
select [Product ID],Category ,sum(Profit)
from Orders as product_profit
group by [Product ID], Category
having sum(profit) > (select AVG(profit) from Orders as overall_avgprft
						where product_profit.Category = overall_avgprft.Category)

-- find the employee who earn the higest salary in their department
select *
from Employees2 e
where SALARY = (select MAX(salary) from Employees2
				where DEPT_NAME = e.DEPT_NAME)

-- find customer who placed at least one order in every month
select distinct [customer id]
from orders o1
where exists
(select count(distinct month([order date]))
from Orders o2
where o2.[Customer ID] = o1.[Customer ID]
having count(distinct month([order date])) =12)

-- find customer who placed at least 10 orders in the year
select distinct [customer id]
from orders o1
where exists
(select count(distinct month([order date]))
from Orders o2
where o2.[Customer ID] = o1.[Customer ID]
having count(distinct month([order date])) =12)

-- find the empolyees who earn more than at least one employee in another dept
select *
from Employees2 e1
where exists (select 1 
					from Employees2 e2
					where e1.DEPT_NAME <> e2.DEPT_NAME
					AND e1.Salary > e2.Salary)

-- find the duplicate salaries using correlated subquery
select *
from Employees2 e1
where exists (select 1
				from Employees2 e2
				where e1.SALARY = e2.SALARY
				and e2.emp_ID = e1.emp_ID)

-- find second highet salary
select MAX(salary)
from Employees2
where SALARY < (select MAX(salary)
from Employees2)

-- find third highest salary
select MAX(salary)
from Employees2
where SALARY < (select MAX(salary)
from Employees2 
where SALARY < (select MAX(salary)
from Employees2))

-- find the employee working in the same employee as mohan
select *
from Employees2 e1
where exists (select 1
			from Employees2 e2
			where e1.DEPT_NAME = e2.DEPT_NAME
			and e2.emp_NAME = 'mohan')
