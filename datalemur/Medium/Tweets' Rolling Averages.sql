SELECT user_id ,	tweet_date,
      round(
        avg(tweet_count) over(  PARTITION BY user_id    
                                order by to_char(tweet_date,'dd-mm-yyy') 
                                rows BETWEEN 2 PRECEDING and current row  )
        ,2
      )
FROM tweets;