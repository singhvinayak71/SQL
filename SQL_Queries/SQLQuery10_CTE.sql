-- CTE

-- find the region whose avg_sales is grater than over all avg_sales
with t1 as (
			select region, AVG(sales) as region_avg from orders
			group by Region
			),
	t2 as (
			select AVG(sales) as overall_sales from Orders
			)
select *
from t1 cross join t2
where region_avg > overall_sales

-- find the third highest sales in each region
with SalesRank as (
					select region, sales,
					DENSE_RANK() over (partition by region order by sales desc) as rnk
					from Orders
				)
	select *
	from SalesRank
	where rnk = 3

-- find top 3 profit per segment 
with top3Profit as(
			select segment, profit,
			ROW_NUMBER() over (partition by segment order by Profit desc) as rn
			from Orders
			)
		select *
		from top3Profit
		where Profit<=3
		-----

		-- solution2
WITH CTE AS
(
    SELECT Segment,profit,
           DENSE_RANK() OVER
           (PARTITION BY Segment ORDER BY Profit DESC) AS rnk
    FROM Orders
)
SELECT *
FROM CTE
WHERE rnk <= 3;


-- find the latest order per customers

with latestOrder as (
					select [Customer Name], [Order Date],
					LAST_VALUE([order date]) over (partition by [customer name] order by [order date]
											rows between unbounded preceding and unbounded following) as latest_date
											from orders
					)
	select distinct [customer name], latest_date
	from latestOrder



-- find top 5 customers by sales
