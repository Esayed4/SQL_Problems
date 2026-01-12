/* Write your PL/SQL query statement below */

with table_without_name as(
    select  reports_to as employee_id ,
        count(*) as reports_count ,
        round(avg(age),0) as average_age 
    from Employees 
    where reports_to is not null
    group by reports_to

)

select e.employee_id,name  ,twn.reports_count ,twn.average_age
from table_without_name twn inner join Employees e
on e.employee_id=twn.employee_id
order by e.employee_id