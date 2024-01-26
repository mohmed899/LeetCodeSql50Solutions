-- Create Movies table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Insert data into Movies table
INSERT INTO Movies (movie_id, title) VALUES
    (1, 'Avengers'),
    (2, 'Frozen 2'),
    (3, 'Joker');
-- Create Users table
CREATE TABLE #Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Insert data into Users table
INSERT INTO #Users (user_id, name) VALUES
    (1, 'Daniel'),
    (2, 'Monica'),
    (3, 'Maria'),
    (4, 'James');

	-- Create MovieRating table
CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,

);

-- Insert data into MovieRating table
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES
    (1, 1, 3, '2020-01-12'),
    (1, 2, 4, '2020-02-11'),
    (1, 3, 2, '2020-02-12'),
    (1, 4, 1, '2020-01-01'),
    (2, 1, 5, '2020-02-17'),
    (2, 2, 2, '2020-02-01'),
    (2, 3, 2, '2020-03-01'),
    (3, 1, 3, '2020-02-22'),
    (3, 2, 4, '2020-02-25');

	/* Write your T-SQL query statement below */
select 
	(select  top 1   u.name results from MovieRating m join #Users u  on m.user_id = u.user_id
    group by m.user_id , u.name 
    order by count(*) desc , name) as results
	
	union all
	select 
   (select  top 1  m.title results from MovieRating  mr join Movies m
   on mr.movie_id = m.movie_id
   where LEFT(created_at,7) = '2020-02'
   group by m.movie_id , m.title
   order by avg(rating*1.0) desc , m.title)