-- Create Customer table
CREATE TABLE Customer (
    customer_id INT,
    name VARCHAR(255) NOT NULL,
    visited_on DATE NOT NULL,
    amount INT NOT NULL
);

-- Insert data into Customer table
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150),
(8, 'Maria', '2019-01-08', 80),
(9, 'Jaze', '2019-01-09', 110),
(1, 'Jhon', '2019-01-10', 130),
(3, 'Jade', '2019-01-10', 150);

select visited_on, sum amount ,average_amount from 

(
select  *  , sum(amount)   over ( order by visited_on  ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) sum ,          
             round( (sum(amount)  over ( order by visited_on  ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) /7.0),2) average_amount , 
		     ROW_NUMBER()  over ( order by visited_on  ) rn
from (select visited_on ,  sum (amount) amount from Customer group by visited_on) Customer

) tem  where rn >6
order by visited_on