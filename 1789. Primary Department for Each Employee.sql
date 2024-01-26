-- Create Employee table
CREATE TABLE Employee (
    employee_id INT,
    department_id INT,
    primary_flag CHAR(1)
);

-- Insert data into Employee table
INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES
    (1, 1, 'N'),
    (2, 1, 'Y'),
    (2, 2, 'N'),
    (3, 3, 'N'),
    (4, 2, 'N'),
    (4, 3, 'Y'),
    (4, 4, 'N');



with  CTE as(
	select * , dense_rank() over (partition by employee_id order by primary_flag desc) RN from Employee)
	select employee_id , department_id from cte where RN =1



	