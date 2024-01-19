-- Create Delivery table
CREATE TABLE Delivery (
    delivery_id INT,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

-- Insert data into Delivery table
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
    (1, 1, '2019-08-01', '2019-08-02'),
    (2, 2, '2019-08-02', '2019-08-02'),
    (3, 1, '2019-08-11', '2019-08-12'),
    (4, 3, '2019-08-24', '2019-08-24'),
    (5, 3, '2019-08-21', '2019-08-22'),
    (6, 2, '2019-08-11', '2019-08-13'),
    (7, 4, '2019-08-09', '2019-08-09');
---sol 1 
with  cte as
	(select *, row_number() over(partition by customer_id order by order_date) rn   from Delivery)
	select round(sum( case when order_date = customer_pref_delivery_date then 1.0 else 0 end) / count(*) * 100,2) immediate_percentage  from cte where rn = 1 
-- sol 2
WITH FirstOrders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
)

SELECT 
      ROUND(SUM(CASE WHEN first_order_date = customer_pref_delivery_date THEN 1.0 ELSE 0 END)  / COUNT(*) , 2) AS immediate_percentage
FROM  FirstOrders
JOIN Delivery ON Delivery.customer_id = FirstOrders.customer_id and Delivery.order_date = FirstOrders.first_order_date

select * from Delivery
