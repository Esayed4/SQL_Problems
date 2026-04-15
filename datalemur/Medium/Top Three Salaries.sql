with A as (
  select department_name,name,salary,
  dense_rank()over(PARTITION by department_name order by salary desc) as so 
  from department  d inner join employee e 
        on d.department_id=e.department_id
)

select department_name,name,salary  
from A 
where so<4
order by department_name,salary desc,name 