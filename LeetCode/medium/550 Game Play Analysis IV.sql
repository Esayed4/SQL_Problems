/* Write your PL/SQL query statement below */
with first_day as(
    select player_id,min(event_date) as event_date from Activity
    group by player_id
)

select round (
            sum(
                case 
                    when event_date=(select event_date+1 from first_day where player_id=a.player_id) then 1
                    else 0 end
                )/count(distinct player_id),2) as fraction
from  Activity a 