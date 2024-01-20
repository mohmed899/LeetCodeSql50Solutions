select top 1 iif(len(num) != 0,num,null) as num  from MyNumbers -- for stupid null 
group by num 
having count(*) = 1 
order by num desc


with  cte As
(select num  from MyNumbers 
group by num 
having count(*) = 1 )
select Max(num) as Num from  cte 
