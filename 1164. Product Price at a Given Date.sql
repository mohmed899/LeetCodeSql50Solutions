CREATE TABLE Products (
    product_id INT NOT NULL,
    new_price INT NOT NULL,
    change_date DATE NOT NULL
);

INSERT INTO Products (product_id, new_price, change_date) VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');

with cte as (
select product_id , max(change_date) maxdate from Products where change_date <= '2019-08-16'
group by product_id)


select p.product_id, p.new_price price from cte c  join  Products p  on 
p.product_id = c.product_id and p.change_date = c.maxdate

union 
select product_id, 10 price from Products  where product_id not in (select product_id from cte)


