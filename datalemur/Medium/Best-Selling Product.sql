select 
      DISTINCT
      category_name,
      FIRST_value(product_name) 
      OVER(PARTITION by category_name order by sales_quantity desc,rating desc ) AS
      product_name
from 
    products p inner join  product_sales ps 
    on p.product_id=ps.product_id
order by category_name,product_name
    
