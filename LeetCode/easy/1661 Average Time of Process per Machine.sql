/* Write your PL/SQL query statement below */


select 
       machine_id , 
       round(

            (
                ( select sum(timestamp) from Activity  where activity_type ='end' and machine_id= a.machine_id )
                -( select sum(timestamp) from Activity where activity_type ='start' and machine_id= a.machine_id )
            )*2/ count(*) 
       ,3)as processing_time 

from Activity  a
group by machine_id;