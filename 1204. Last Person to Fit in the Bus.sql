CREATE TABLE Persons (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50) NOT NULL,
    weight INT NOT NULL,
    turn INT NOT NULL
);

INSERT INTO Persons (person_id, person_name, weight, turn) VALUES
(5, 'Alice', 250, 1),
(4, 'Bob', 175, 5),
(3, 'Alex', 350, 2),
(6, 'John Cena', 400, 3),
(1, 'Winston', 500, 6),
(2, 'Marie', 200, 4);


with cte as (
SELECT
  *,
    SUM(weight) OVER (ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING) AS SumOfPreviousRows
FROM
    Persons
	
	)

select top 1  person_name from cte where SumOfPreviousRows <= 1000 
order by turn desc


---SELECT person_name, sum(weight) OVER(ORDER BY turn ) as total FROM Persons

