CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    reports_to INT,
    age INT
);

INSERT INTO Employees (employee_id, name, reports_to, age) VALUES
(9, 'Hercy', NULL, 43),
(6, 'Alice', 9, 41),
(4, 'Bob', 9, 36),
(2, 'Winston', NULL, 37);


/* Write your T-SQL query statement below */
select m.employee_id  , m.name , count(m.name) reports_count ,Round( AVG(e.age*1.0),0) average_age from Employees m join Employees e 
on m.employee_id = e.reports_to

group by m.employee_id , m.name

order by m.employee_id