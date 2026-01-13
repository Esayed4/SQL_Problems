/* Write your PL/SQL query statement below */
with from_num_to_char as(
    select 
            case
                    when income <20000 then 'Low Salary'
                    when income <=50000 then 'Average Salary'
                    else 'High Salary'
            end as  category       
    from Accounts 

    union all 
    select 'Low Salary' from dual;
    union all 
    select 'Average Salary' from dual;
    union all 
    select 'High Salary' from dual;
)

select 
    category,count(*)-1 as accounts_count 
from from_num_to_char
group by category

