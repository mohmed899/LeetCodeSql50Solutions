CREATE TABLE RequestAccepted (
    requester_id INT,
    accepter_id INT,
    accept_date DATE
);

INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09');

with cte as (
select  requester_id  from RequestAccepted 
union all 
select  accepter_id  from RequestAccepted )

select top 1  requester_id  id, count(requester_id) num from cte 
group by requester_id
order by num desc


