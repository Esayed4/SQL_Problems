/* Write your PL/SQL query statement below */

select 
        id
from Weather w
where 
    temperature > (select temperature from Weather where recordDate +1 =w.recordDate );