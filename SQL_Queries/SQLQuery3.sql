-- DISTINCT

-- find unique state,city
select distinct state, city
from Orders

-- top N
select top 100 *
from Orders
order by sales

--1 find the name of the product with maximam sales
select [Product Name], max(sales) as Max_sales
from Orders
group by [Product Name]
order by Max_sales desc

--2 how many unique orders are placed in central and east region
select region, count(distinct [order id]) as total_unique_order
from Orders
where region in ('central', 'east')
group by Region

--3 find ship mode wise orders placed
select [ship mode], COUNT(distinct [order id]) as total_order
from Orders
group by [Ship Mode]

--4 find the total orders placed in 2016
select COUNT(distinct [Order ID]) as total_orders
from orders
where YEAR([order date]) = '2016'

--5 find the total sales each category and sub-category wise
select category, [Sub-Category] SUM(sales) as total sales
from Orders
group by Category, [sub-category]
order by category

--6 find the names that has 2 words
select state
from orders
where State like '% %'

--7 find the state whose postal codes start with 9
select [postal code]
from Orders
where [postal code] like '9%'

--8 find the products whose total quantity sold is more than 50 in central region
select [Product Name],sum(quantity) as TQ, Region
from Orders
where region = 'central'
group by [Product Name], region
having sum(quantity) > 50


--9 show customers with their total sales, average profit, total quantity
select [customer name],  SUM(sales)as total_sales, AVG(profit) as AVG_Profit, SUM(quantity) as quantity
from Orders
group by [Customer Name]

--10 find the state names that has I, O, A
select state
from Orders
where state like '%[IOA]%'


-- CASE WHEN
select region,
case when region in ('east', 'west') then 'A'
	when region = 'central' then 'B'
	else 'C'
	end as region_category
	from Orders

-- if state is in florida or texas and sales >90 then option

select state, sales,
case when state in ('texas', 'california') and sales > 90 then 'option1'
	when state ='california' and sales > 50 then 'option2'
else 'Option3'
end as 'category'
from orders



-- if postal code start with 8 or 9 then opta
--if postal code starts with 1,2,3,4 then optb
--else optc

select [Postal Code],
case when [Postal Code] like '[89]%'
when [Postal Code] like '[1234]%' then 'OPT 2'
else 'opt c'
end as nw_col
from Orders