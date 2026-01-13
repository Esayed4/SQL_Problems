/* Write your PL/SQL query statement below */

with weight_t as(

    select person_name , (select  sum(weight ) from Queue where turn <= q.turn ) as wieght
    from Queue q order by wieght;
)

select PERSON_NAME 
from weight_t
where  WIEGHT =(select max(WIEGHT ) from weight_t where wieght<=1000 )