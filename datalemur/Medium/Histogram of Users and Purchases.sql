 with t as(
    SELECT 
        transaction_date,
        user_id,
        rank()over(PARTITION by user_id order by transaction_date desc) as tc
    FROM user_transactions
)

select transaction_date ,user_id,count(*) as purchase_count
from  t
where tc=1
GROUP by transaction_date,user_id
order by transaction_date