/* Write your PL/SQL query statement below */

with table_t as (
select p.* , rank()over(partition by product_id  order by change_date  desc) as order_t
from Products p 
where change_date<=to_date('2019-08-16','yyyy-mm-dd') )



select distinct p.product_id ,NVL(t.NEW_PRICE,10) as price 
from Products p left join  table_t t on p.product_id =t.product_id 
where t.order_t=1 or order_t is null

