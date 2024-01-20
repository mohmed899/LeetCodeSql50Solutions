CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255)
);

INSERT INTO Users (user_id, user_name)
VALUES
    (6, 'Alice'),
    (2, 'Bob'),
    (7, 'Alex');

CREATE TABLE Register (
    contest_id INT,
    user_id INT,
    PRIMARY KEY (contest_id, user_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Register (contest_id, user_id)
VALUES
    (215, 6),
    (209, 2),
    (208, 2),
    (210, 6),
    (208, 6),
    (209, 7),
    (209, 6),
    (215, 7),
    (208, 7),
    (210, 2),
    (207, 2),
    (210, 7);



	/* Write your T-SQL query statement below */
Declare @c float;
SET @c = (SELECT Count(*) FROM Users) * 1.0; 
select contest_id ,Round(count(*)/@c*100,2) percentage
from Register
group by contest_id

order by percentage desc , contest_id