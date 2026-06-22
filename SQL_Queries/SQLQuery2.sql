use sql6052
-- find the data for central region
select *
from Orders
where region = 'central'

-- find the data where state is not Texas
select *
from orders
where state <> 'Texas'

-- find the sales grater then 200
select *
from orders
where sales > 200

-- find the order where profit is less than 20
select [order id]
from Orders
where profit < 20
-- find the costumers whose sales is less then equal to 500
select [order id], [customer name],[sales]
from Orders
where sales <= 500
-- find the custumers whose sales is grater then equal to 1000
select [order id], [customer name], [sales]
from Orders
where sales >= 1000

-- find the customers who have placed order in - New York, California, florida, Arizona
select [customer id], [customer name], [state]
from Orders
where state in ('New York', 'California', 'florida', 'Arizona')

-- find the customers who have placed order other than New York, California, florida, Arizona
select [customer id], [customer name], [state]
from Orders
where state not in ('New York', 'California', 'florida', 'Arizona')

-- find the costumers who are in east region and their segment is consumer
select [customer id], [customer name], [region], [segment]
from Orders
where region = 'east'
and
segment = 'consumer'

--find the costumers who are in state florida or california
select [customer id], [customer name], state
from Orders
where state = 'florida'
or
state = 'california'
-- correct mathod
select [customer id], [customer name], state
from Orders
where state in ('florida','california')

--find the sales between 500 to 700, profit less than 0, region is east
select sales, profit, Region
from Orders
where sales between 500 and 700
and profit < 0
and region = 'east'

-- names starting with A
select [customer name]
from Orders
where [customer name]  like 'A%'

-- names ending with G
select [customer name]
from Orders
where [customer name]  like '%G'

--name that contain N in it
select [customer name]
from Orders
where [customer name]  like '%n%'

-- name that contain 10 characters
select [customer name]
from Orders
where [customer name]  like '__________'

-- name that has N at second position
select [customer name]
from Orders
where [customer name]  like '_n%'

-- name that contaion any vowel
select [customer name]
from Orders
where [customer name]  like '%[aeiou]%'

-- name that contains X and T
select [customer name]
from Orders
where [customer name]  like '%xt%'

-- name that contains X or T
select [customer name]
from Orders
where [customer name]  like '%[xt]%'

-- first name ending with D and last name ending with N
select [customer name]
from Orders
where [customer name]  like '%D %N'

-- first name has I and last name has M
select [customer name]
from Orders
where [customer name]  like '%I% %M%'

-- ORDER BY
select [customer name], state
from Orders
ORDER BY state

--for desending order
select [customer name], state
from Orders
ORDER BY state desc

-- AGGRIGATE FUNCTION
-- find the total sales
select SUM(sales)
as [total sales]
from Orders

-- find the average profit 
select AVG(profit)
as [AVG_Profit]
from Orders

--find the max discount
select MAX(discount)
as [Max dis]
from Orders

-- find the min sales
select MIN(sales)
as min_sales
from orders

-- find the total number of rows
select COUNT(*)
from Orders

-- GROUP BY
select region, round(sum(sales),2) as total_sales
from Orders
group by Region

-- HAVING
select region, SUM(sales) as TS
from Orders
group by Region
having SUM(sales)>500000
order by TS

-- order of opration at frontend
select
from
where
group by
having
order by

-- order of opration at backend
from
where
group by
having
select
order by
