
with payments  as(
    select 
          merchant_id	,credit_card_id,	amount,transaction_timestamp,
          lag(transaction_timestamp) over(
            PARTITION by merchant_id	,credit_card_id,	amount
            order by transaction_timestamp
          ) as pretime
    from transactions 
)

select count(*) as  payment_count
from payments 
where EXTRACT(EPOCH FROM (transaction_timestamp - pretime))<=600