WITH get_activity_time AS (
  SELECT 
    ag.age_bucket,
    a.activity_type,
    SUM(a.time_spent) AS activity_time
  FROM activities a 
  INNER JOIN age_breakdown ag
    ON a.user_id = ag.user_id
  GROUP BY ag.age_bucket, a.activity_type
),
truy as(
    select o.age_bucket,
            o.activity_time as openTime,
            s.activity_time as spendTime
    from (select * from get_activity_time where activity_type ='open') as  o
          inner join 
          (select * from get_activity_time where activity_type ='send') as  s
          on o.age_bucket=s.age_bucket
)
SELECT age_bucket,
      round(spendtime*100.0/(spendtime+opentime),2) as send_perc,
      round(opentime*100.0/(spendtime+opentime),2) as open_perc
FROM truy
order by age_bucket ;
