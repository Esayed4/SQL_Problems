
select t.salary as second_highest_salary
from (
  select
     salary,
    dense_rank()OVER(order by salary desc) as salary_rank
  from employee
) t
where t.salary_rank=2
limit 1 

