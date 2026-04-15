with getNextDay as(

  select t1.user_id
  FROM transactions t1 
        inner JOIN
          transactions t2 
          on t1.user_id=t2.user_id 
          AND t2.transaction_date = t1.transaction_date + INTERVAL '1 day'
        inner join 
              transactions t3
              on t1.user_id=t3.user_id 
              AND t3.transaction_date = t2.transaction_date + INTERVAL '1 day'
    )

select DISTINCT user_id from getNextDay  order by user_id