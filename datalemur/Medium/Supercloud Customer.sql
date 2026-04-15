with t as(
    SELECT distinct customer_id,product_category
    from 
        customer_contracts cc  
        inner join 
        products p 
        on cc.product_id=p.product_id
    order by customer_id

)

select DISTINCT customer_id
from t gt
where (
        SELECT count(*)
        from t
        where gt.customer_id=customer_id
      )
        =
      (select count(DISTINCT product_category) from products)
