CREATE TABLE Queries (
    query_name VARCHAR(50),
    result VARCHAR(50),
    position INT,
    rating INT
);

INSERT INTO Queries (query_name, result, position, rating)
VALUES 
    ('Dog', 'Golden Retriever', 1, 5),
    ('Dog', 'German Shepherd', 2, 5),
    ('Dog', 'Mule', 200, 1),
    ('Cat', 'Shirazi', 5, 2),
    ('Cat', 'Siamese', 3, 3),
    ('Cat', 'Sphynx', 7, 4);


	select query_name  ,  round( AVG(rating*1.0/position), 2) quality , round((sum(case when rating<3 then 1.0 else 0 end )/count(*)* 100),2) poor_query_percentage  from Queries 
	group by query_name
    having query_name is not null