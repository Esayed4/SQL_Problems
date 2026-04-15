with getCountries as (
     select 
        pi1.country_id as caller_coutry,
        pi2.country_id as reciver_coutry
    from phone_calls pc1 
        inner join phone_info pi1
            on pc1.caller_id=pi1.caller_id
        inner join phone_info pi2
            on pc1.receiver_id=pi2.caller_id
)

SELECT round(
              100.0 * sum(case when caller_coutry<>reciver_coutry then 1 else 0 end )
              /count(*)
  
        ,1) as international_calls_pct
from getCountries
 






