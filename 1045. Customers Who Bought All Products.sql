-- Create CustomerProduct table
CREATE TABLE #CustomerProduct (
    customer_id INT,
    product_key INT
);

-- Insert data into CustomerProduct table
INSERT INTO #CustomerProduct (customer_id, product_key) VALUES
    (1, 5),
    (2, 6),
    (3, 5),
    (3, 6),
    (1, 6);

	-- Create Product table
CREATE TABLE #Product (
    product_key INT
);

-- Insert data into Product table
INSERT INTO #Product (product_key) VALUES
    (5),
    (6);




    select  customer_id from #CustomerProduct 

	group by customer_id 
	having count ( distinct product_key) =( select count(product_key) from #Product)
