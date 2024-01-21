-- Create Person table
CREATE TABLE Person (
    id INT,
    email VARCHAR(255)
);

-- Insert data into Person table
INSERT INTO Person (id, email) VALUES
   -- (1, 'john@example.com'),
   -- (2, 'bob@example.com'),
    (3, 'john@example.com');

	delete from Person where id not in(
	select id  from  
	(select * , row_number() over( partition by email order by id  ) rn from Person) t
	where t.rn = 1 )

	--DELETE p1
	select *
FROM person p1
INNER JOIN person p2 ON p1.email = p2.email
WHERE p1.id > p2.id;