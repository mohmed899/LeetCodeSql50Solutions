/* Write your T-SQL query statement below */

select product_name ,sum (unit ) unit from Orders o join 
Products p on o.product_id = p.product_id
where '2020-02' = left(order_date,7)
group by product_name
having sum (unit ) > 99