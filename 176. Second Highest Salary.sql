select case when EXISTS(
            select salary SecondHighestSalary from(select * , dense_rank() over (order by salary desc) rn  from Employee) t where rn = 2
                )
then (select top 1 salary SecondHighestSalary from(
	select * , dense_rank() over (order by salary desc) rn  from Employee
	) t where rn = 2 )   else null  end SecondHighestSalary
