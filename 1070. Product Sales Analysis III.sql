
-- Create Sales table
CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);

-- Insert data into Sales table
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
    (1, 100, 2008, 10, 5000),
    (2, 100, 2009, 12, 5000),
    (7, 200, 2011, 15, 9000);
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
with cte  as
 (
	select product_id, min(year) first_year  from Sales

	group by product_id)
	
	select  s.product_id , first_year , quantity ,price from cte join Sales s on 
	s.product_id = cte.product_id and s.year = cte.first_year


	 with CTE as( 
    Select  product_id, year, quantity, price, rank() over (partition by product_id      order by year)  as min_year
    from Sales
 )
 Select  product_id, year as first_year, quantity, price
 From CTE 
 where min_year = 1