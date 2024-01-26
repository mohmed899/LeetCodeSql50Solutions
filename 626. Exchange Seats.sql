-- Create Seat table
CREATE TABLE Seat (
    id INT PRIMARY KEY,
    student VARCHAR(255) NOT NULL
);

-- Insert sample data
INSERT INTO Seat (id, student) VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');

Select
case
when id%2!=0 then id+1
When id%2=0 then id-1
when (id%2!=0 and id=(select max(id) from Seat)) then id
end as id,
student
from Seat
order by id



select case when id = 5 then id-4 end , student  from Seat
