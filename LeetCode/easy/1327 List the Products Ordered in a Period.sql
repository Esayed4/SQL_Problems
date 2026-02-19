/* Write your PL/SQL query statement below */

WITH get_product_id as(
select 
     product_id    , sum(unit) as unit
from 
    Orders 
where 
    to_char(order_date,'yyyy-mm') = '2020-02'
group by 
    product_id    
having 
    sum(unit) >99 

    )



select product_name ,unit
from Products  p inner join get_product_id g on p.product_id  =g.product_id  