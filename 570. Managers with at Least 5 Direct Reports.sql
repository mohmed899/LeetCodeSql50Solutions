CREATE TABLE Employee (
    id INT,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);

INSERT INTO Employee (id, name, department, managerId) VALUES
(101, 'John', 'A', null),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);


select s.name from Employee e join Employee s
on e.managerId = s.id  
 group by s.id , s.name
 having COUNT(s.id) > 4