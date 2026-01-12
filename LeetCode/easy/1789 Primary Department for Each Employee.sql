/* Write your PL/SQL query statement below */
select employee_id ,department_id 
from Employee e
where   (select count(*) from Employee where e.employee_id=employee_id)=1 or primary_flag ='Y'