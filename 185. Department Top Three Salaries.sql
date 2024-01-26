-- Create Employee table
CREATE TABLE #Employee (
    id INT,
    name VARCHAR(255) NOT NULL,
    salary INT NOT NULL,
    departmentId INT NOT NULL
);

-- Insert data into Employee table
INSERT INTO #Employee (id, name, salary, departmentId) VALUES
(1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1);



-- Create Department table
CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Insert data into Department table
INSERT INTO Department (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

WITH cte as(
select * , DENSE_RANK() over( partition by departmentId order by salary desc ) DR from #Employee)
select d.name Department , c.name Employee  ,c.salary Salary from cte c join Department d on c.departmentId = d.id
where DR<4
