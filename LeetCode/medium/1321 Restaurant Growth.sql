 Write your PLSQL query statement below 
with t as(
    select 
        visited_on,amount ,
        dense_rank() over(order by visited_on desc) as t_order
    from Customer 

)


select distinct dis to_char(VISITED_ON,'yyyy-mm-dd') as VISITED_ON  ,
       (select sum(amount) from t where T_ORDER  between tt.T_ORDER and tt.T_ORDER+6 ) as amount,
       round( (select sum(amount) from t where T_ORDER  between tt.T_ORDER and tt.T_ORDER+6 )  7 ,2) as average_amount  
from t tt

where T_ORDER+5 (select max(T_ORDER) from t)