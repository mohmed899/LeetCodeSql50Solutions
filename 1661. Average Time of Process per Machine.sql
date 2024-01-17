-- Assuming a database named 'YourDatabaseName'
CREATE TABLE Activity (
    machine_id INT NOT NULL,
    process_id INT NOT NULL,
    activity_type VARCHAR(10) NOT NULL,
    timestamp FLOAT NOT NULL
);

-- Inserting sample data
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end', 1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end', 4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end', 1.550),
(1, 1, 'start', 0.430),
(1, 1, 'end', 1.420),
(2, 0, 'start', 4.100),
(2, 0, 'end', 4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end', 5.000);


--sol 1 
select a1.machine_id , ROUND( avg(a2.timestamp - a1.timestamp) ,3)   processing_time from Activity a1 join Activity a2 
on a1.machine_id = a2.machine_id  and 
   a1.process_id = a2.process_id  and
   a1.activity_type = 'start'     and 
   a2.activity_type = 'end'     
group by a1.machine_id


-- sol 2

with cte as
(select machine_id , process_id , timestamp - lag (timestamp) over (partition by machine_id , process_id order by activity_type desc) as diff from activity)

select machine_id , round(avg(diff*1.0),3) processing_time from cte 
group by machine_id










