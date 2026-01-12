/* Write your PL/SQL query statement below */

with unique_cp as(
    select 
        customer_id 
    from Customer
    group by customer_id , product_key
)

select 
customer_id
from unique_cp
having count(*)=(select count(*) from Product  )
group by customer_id