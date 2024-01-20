select user_id, count(*) followers_count from 
Followers 
group by user_id
