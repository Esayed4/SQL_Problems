with first_year as(
    select product_id ,
            year,
            quantity ,
             price,
             rank()over(partition by product_id order by year asc ) as date_order
    from Sales 
)
select PRODUCT_ID , YEAR as first_year ,QUANTITY , PRICE from first_year  where DATE_ORDER =1

