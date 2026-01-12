/* Write your PL/SQL query statement below */
with order_table as(
    select 
        customer_id,
        case when order_date=customer_pref_delivery_date then 1 else 0 end as is_immediate,
        rank() over(partition by customer_id order by order_date asc ) as date_order
    from Delivery

)


select 
    round(
    avg(IS_IMMEDIATE)*100
    ,2)as immediate_percentage
from order_table
where  DATE_ORDER =1