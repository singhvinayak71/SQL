select *
from orders



-- 1. Show: Order_ID, Customer_Name, Sales using Orders and Customers table.

select o.Customer_ID as CID,
	c.Customer_ID as customer_name,
	o.Sales
from orders as o
left join customers as c
on o.Customer_ID = c.Customer_ID

-- 2. Show Product_Name, Category, Sales
select p.Product_Name,
	p.Category,
	o.Sales
from products as p
left join orders as o
--on p.Product_ID = o.Product_ID
on p.Product_ID = o.Product_ID

-- Show all orders with Customer Name, City, Product Name

-- 4. Customers who placed orders above 1000 sales

-- 5. Show Order_ID, Customer_Name, Product_Name, Category

-- 6. Customer-wise Total Sales

--7. Top 5 Customers by Total Sales

-- 8. Show all Technology category orders

-- 9. Customers who never placed orders

-- 10. Products never ordered

-- 11. Customer_Name, Product_Name, Payment_Mode, Shipping_Status

-- 12. Category-wise Total Sales


-- 13. Most Profitable Category

-- 14. Employee with Department, Manager, Salary

-- 15. Customers who ordered more than 3 products

-- 17. Region-wise and Category-wise Sales

-- 18. Top 10 Products by Sales

-- 19. Customers who purchased Furniture

-- 20. Sub-category wise Sales and Profit