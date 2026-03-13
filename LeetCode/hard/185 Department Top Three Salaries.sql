/* Write your PL/SQL query statement below */
/* Write your T-SQL query statement below */

with order_salary as(
    select 
        d.name as dep_name, e.name as emp_name,salary,
        dense_rank() over (partition by  d.name order by e.salary desc ) as emp_order
    from Employee e inner join Department  d on
            e.departmentId =d.id 
 )

 select 
    DEP_NAME as Department ,
    EMP_NAME as Employee ,
    salary
    
 from 
     order_salary
where EMP_ORDER <=3