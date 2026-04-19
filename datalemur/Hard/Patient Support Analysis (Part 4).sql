WITH call_history AS (
     select 
         EXTRACT(YEAR from call_date) as yr,
         EXTRACT(MONTH from call_date) as mth,
         count(call_duration_secs)      as long_calls
     from callers 
     where call_duration_secs>300 
     group by 
         EXTRACT(YEAR from call_date) ,
         EXTRACT(MONTH from call_date) 
)
 select yr,mth,
         
              
        round(100*(1.0*long_calls/lag(long_calls)over(order by  yr,mth)-1.0 ),1) as 
        long_calls_growth_pct
             
 from call_history
order by  yr,mth

