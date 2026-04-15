with newtable as(
select 
  ticker,
  to_char(date,'Mon-yyyy') as tdate,
  open
from stock_prices  
)
,

highest as(
 select ticker,
        FIRST_value(tdate) over(PARTITION by ticker order by open desc),
        FIRST_value(open) over(PARTITION by ticker order by open desc),
        FIRST_value(tdate) over(PARTITION by ticker order by open asc),
        FIRST_value(open) over(PARTITION by ticker order by open asc)
  from newtable

)

select DISTINCT * from highest order by ticker
