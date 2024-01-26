-- Create Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    income INT
);

-- Insert data into Accounts table
INSERT INTO Accounts (account_id, income) VALUES
    (3, 108939),
    (2, 12747),
    (8, 87709),
    (6, 91796);












DECLARE @Categories TABLE(category NVARCHAR(30) ,starR int , endR int)
INSERT INTO @Categories
VALUES 
('Low Salary',0,20000-1)  ,
('Average Salary',20000,50000)  ,
('High Salary',50000+1,2147483647)  


SELECT g.category , Count( a.income ) accounts_count FROM @Categories g left join Accounts a on 
a.income between g.starR and g.endR

group by g.category






SELECT 'Low Salary' as category, sum(iif(income<20000,1,0)) AS accounts_count FROM Accounts
union
SELECT 'Average Salary' as category, sum(iif(income>=20000 and income<=50000,1,0)) AS accounts_count FROM Accounts
union
SELECT 'High Salary' as category, sum(iif(income>50000,1,0)) AS accounts_count FROM Accounts