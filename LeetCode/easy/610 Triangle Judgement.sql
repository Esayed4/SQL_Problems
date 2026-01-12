/* Write your PL/SQL query statement below */

select t.*,
        case
        when x+y<=z then 'No'
         when x+z<=y then 'No'
          when z+y<=x then 'No'
          else 'Yes'
          end as triangle 
from Triangle t
