/* Write your PL/SQL query statement below */
with date_amount  as(
    select visited_on   , sum(amount) as amount  
    from  Customer
    group by visited_on
    order by visited_on
);





select 
    to_char(visited_on+6,'yyyy-mm-dd') as VISITED_ON           ,  
                ( select  
                            sum(amount)       
                  from date_amount 
                  where 
                        visited_on between f1.visited_on and f1.visited_on+6) as amount    ,

                   ( select  
                            round( sum(amount)/7.0,2)  
                      from date_amount 
                      where 
                        visited_on between f1.visited_on and f1.visited_on+6) as  average_amount 
from date_amount f1
where  visited_on+6 in ( select  
                                  visited_on
                          from date_amount)