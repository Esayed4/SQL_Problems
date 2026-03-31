with TRANSACTION_rank as (
  SELECT 
        user_id,spend,transaction_date,
        rank() OVER (PARTITION by user_id order by transaction_date) as row_order
  from transactions 

)

select 
      user_id,spend,transaction_date
from 
      TRANSACTION_rank 
where 
      row_order=3;