create database joins
use joins

-- list all products along with their categories and producers
select p.id as product_id,
		p.name as product_name,
		pp.name as producer_name,
		c.name as category_name
from Product as p
inner join producer as pp
on p.producer_id = pp.id
inner join Category as c
on p.department_id = c.id

-- find the total sales amount for each product along with its producers
select p.id as productid,
	p.name as productname,
	SUM(sh.amount) as totalamount,
	c.name as categoryname,
	pp.name as producername
from Product as p
	inner join sales_history as SH
	on p.id = SH.product_id
	inner join category as c
	on p.department_id = c.id
	inner join producer as pp
	on p.producer_id = pp.id
	group by p.id, p.name, c.name,pp.name



-- list all the products along with their categories including products that do not belong to any category
select p.id as productid,
	p.name as productname,
	c.name as categoryname
from product as p
left join category as c
on p.department_id = c.id


-- for each product show its name,price, producer name and category name
select p.name as productname,
	



--CROSS JOIN
SELECT *
FROM TABLE1 CROSS JOIN TABLE2

-- SELF JOIN
SELECT *
FROM TABLE1 AS A
JOIN TABLE2 AS B
