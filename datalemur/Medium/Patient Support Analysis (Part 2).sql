select
      round(
          sum(case  
                when call_category='n/a' then 1 
                when call_category is NULL then 1
                else 0 end )*100.0
          /count(*),1
      ) as uncategorised_call_pct
from  callers 