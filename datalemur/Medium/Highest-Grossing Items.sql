with a as (
SELECT 
  category, 
  product, 
  SUM(spend) AS total_spend 
FROM product_spend 
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product
),
b as(
  select 
    category, 
    product,total_spend,
    row_number()over(PARTITION by category order by  total_spend desc) as so
  from a
)
SELECT category, 
       product,
       total_spend 
from b 
where so<3;