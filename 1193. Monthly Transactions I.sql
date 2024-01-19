-- Create Transactions table
CREATE TABLE Transactions (
    id INT,
    country VARCHAR(2),
    state VARCHAR(10),
    amount INT,
    trans_date DATE
);

-- Insert data into Transactions table
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
    (121, 'US', 'approved', 1000, '2018-12-18'),
    (122, 'US', 'declined', 2000, '2018-12-19'),
    (123, 'US', 'approved', 2000, '2019-01-01'),
    (124, 'DE', 'approved', 2000, '2019-01-07');


SELECT
    FORMAT(trans_date, 'yyyy-MM') as month,
    country,
    COUNT(state) as trans_count, 
    COUNT(CASE WHEN state = 'approved' THEN state ELSE NULL END) as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM
    Transactions
GROUP BY
    FORMAT(trans_date, 'yyyy-MM'),
    country


--select  LEFT(GETDATE(), '7')  get the most 7 left char