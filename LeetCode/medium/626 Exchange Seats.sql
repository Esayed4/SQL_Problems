/* Write your PL/SQL query statement below */
with t as(
select 
    case 
        when mod(id,2)=0 then id-1
        else id+1
    end as id,
    student 
from Seat 
order by id
)

select 
    case 
        when mod((select count(*) from Seat),2)=1 and id = (select max(id) from t) then
            id-1
        else id
    end as id,
     student 
from t 