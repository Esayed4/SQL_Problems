select 
         order_id +  case 
                      when order_id%2=1 and (select count(*) from orders)=order_id THEN 0
                      when order_id%2=0 then -1 else 1 end as order_id
         ,item
from orders 
order by order_id