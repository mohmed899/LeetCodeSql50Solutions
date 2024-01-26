CREATE TABLE Logs (
    id INT PRIMARY KEY,
    num INT NOT NULL
);

INSERT INTO Logs (id, num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2);

with cte as (
select *, lag(num) over ( order by id ) lag , lead(num) over ( order by id ) lead from Logs
)
select  distinct num ConsecutiveNums  from cte  where num = lag and num = lead



