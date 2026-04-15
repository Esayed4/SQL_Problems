select 
      DISTINCT
      card_name,
      first_value(issued_amount) over(
          PARTITION by card_name
          order by issue_year asc,issue_month ASC
      ) as issued_amount
from monthly_cards_issued 
order by issued_amount desc