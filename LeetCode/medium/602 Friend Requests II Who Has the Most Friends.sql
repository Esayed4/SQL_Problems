/* Write your T-SQL query statement below */
/* Write your PL/SQL query statement below */
with col1 as(
    select requester_id 
    from RequestAccepted  

    union all 

    select accepter_id  
    from RequestAccepted 

)
select  top 1 requester_id as id,count(*) as num  
from col1 
group by requester_id 
order by num desc 
 

