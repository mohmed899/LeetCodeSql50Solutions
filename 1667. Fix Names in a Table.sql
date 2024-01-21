select user_id , CONCAT(upper(left(name,1)),LOWER( right(name,len(name)-1)))name 
from users 
order by user_id 

