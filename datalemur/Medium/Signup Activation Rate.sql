with a as(
  select 
    email_id,
    sum( case when  signup_action='Confirmed' then 1 else 0 end) as is_confirmed
  from texts 
  group by email_id
)
, b as(
  SELECT e.email_id,is_confirmed
  from emails  e left join a on e.email_id=a.email_id

)
select round(sum(is_confirmed)/count(*),2) from b