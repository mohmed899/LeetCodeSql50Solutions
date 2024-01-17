
CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE NOT NULL,
    temperature INT NOT NULL
);

-- Inserting sample data
INSERT INTO Weather (id, recordDate, temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

--sol 1
select t.id from Weather t join Weather y 
on t.recordDate =  DATEADD(DAY, 1,y.recordDate)
where t.temperature > y.temperature
--sol 2
select id from (
select *  ,  lag(temperature ) over(order by recordDate) yt  ,  lag(recordDate ) over(order by recordDate) yd  from Weather) as t
where  t.temperature > t.yt and DATEDIFF(DAY, yd, t.recordDate)  = 1 


  

