-- Create ScriptPrices table
CREATE TABLE price (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price DECIMAL(10, 2)
);

-- Insert data into ScriptPrices table
INSERT INTO price (product_id, start_date, end_date, price) VALUES
    (1, '2019-02-17', '2019-02-28', 5.00),
    (1, '2019-03-01', '2019-03-22', 20.00),
    (2, '2019-02-01', '2019-02-20', 15.00),
    (2, '2019-02-21', '2019-03-31', 30.00);

-- Create UnitsSold table
CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);

-- Insert data into UnitsSold table
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
    (1, '2019-02-25', 100),
    (1, '2019-03-01', 15),
    (2, '2019-02-10', 200),
    (2, '2019-03-22', 30);


	select s.product_id , ISNULL( round( ( sum (s.price * u.units)*1.0)/sum(u.units) ,2),0) average_price from Prices s left join UnitsSold u 
	 on s.product_id = u.product_id and u.purchase_date between s.start_date  and s.end_date
	 group by s.product_id