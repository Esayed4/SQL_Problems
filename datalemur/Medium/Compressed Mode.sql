select item_count
from items_per_order 
where order_occurrences =(select max(order_occurrences) from items_per_order )
order by item_count