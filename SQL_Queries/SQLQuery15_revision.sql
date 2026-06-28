-- salesdata - salesperson, quarter, salesamount
-- show total sales per salesperson for each quarter for each quarter 


-- increase salary by 20% for emplyees earning below their dept avg
update e1
set salary = salary + (salary *0.20)
from emp as e1
where salary < (select avg(salary) from emp as e2
			where e2.dept = e1.dept

select *,
case when  salary < (select avg(salary)
						from emp as e1
						where e1.dept = e2.dept)
						then (salary * 1.20)
else salary
end as new_salary
from emp as e2

--find the total sales and the number of orders for each region where the orders were ruturned
select region, SUM(o.sales) as TS, count(distinct o.[Order ID]) as total_orders
from Orders as o
inner join returns as r
on o.[order id] = r.[order id]
group by region

-- identify the product category with the highest return rate
select category,
		count(distinct o.[order id]) as Total_orders,
		count(distinct r.[order id]) as total_returned_orders,
	count(distinct r.[order id]) * 100/ count (distinct o.[order id]) as return_rate
from Orders as o
left join returns as r
on o.[Order ID] = r.[order id]
group by Category

-- find the customers with more than 20% return rate
with X as(
select [Customer Name],
		count(distinct o.[order id]) as Total_orders,
		count(distinct r.[order id]) as total_returned_orders,
	count(distinct r.[order id]) * 100/ count (distinct o.[order id]) as return_rate
from Orders as o
left join returns as r
on o.[Order ID] = r.[order id]
group by [Customer Name]
)
select *
from x
where return_rate > 20


--highest, lowest, median salesselect [customer id],FIRST_VALUE (sales) over (partition by [customer id] order by sales desc) as max_sales,FIRST_VALUE (sales) over (partition by [customer id] order by sales) as min_sales,PERCENTILE_CONT (0.50) within group (order by sales) over (partition by [customer id]) as medianfrom Orders