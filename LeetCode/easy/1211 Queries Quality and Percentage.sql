/* Write your PL/SQL query statement below */

select 
    query_name ,
    round(sum(rating/position )/count(*),2) as quality ,
    round(
         100*(select count(*) from Queries  where  rating <3 and q.query_name = query_name)/count(*),2) 
         as poor_query_percentage 
from Queries q
group by query_name
 