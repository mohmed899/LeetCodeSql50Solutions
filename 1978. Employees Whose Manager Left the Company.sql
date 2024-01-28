CREATE TABLE #Employees (
    employee_id INT,
    name VARCHAR(255),
    manager_id INT,
    salary INT
);

INSERT INTO #Employees (employee_id, name, manager_id, salary) VALUES
(3, 'Mila', 9, 60301),
(12, 'Antonella', NULL, 31000),
(13, 'Emery', NULL, 67084),
(1, 'Kalel', 11, 21241),
(9, 'Mikaela', NULL, 50937),
(11, 'Joziah', 6, 28485);

--sol1 
select employee_id from #Employees
where salary < 30000
and manager_id not in ( select employee_id from #Employees)


--sol2 

select e.employee_id from #Employees e left  join #Employees m 
on e.manager_id = m.employee_id 
where e.salary < 30000 and m.employee_id is null and e.manager_id is not null
order by  e.employee_id

