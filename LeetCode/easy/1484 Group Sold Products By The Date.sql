/* Write your PL/SQL query statement below */
/* Write your PL/SQL query statement below */

with numOfProducts as (
    select 
        to_char(sell_date,'yyyy-mm-dd')  as sell_date    ,count( distinct product ) as num_sold 
    from Activities  a 
    group by sell_date  
 ),
 date_productes as (

    SELECT 
        distinct to_char(sell_date,'yyyy-mm-dd') as sell_date,
        LISTAGG( product     , ',')
            WITHIN group(order by product) over (partition by sell_date) as products
    FROM (
            select distinct * from Activities
         )
  
  )

  select nop.sell_date ,num_sold,products
  from numOfProducts nop inner join date_productes dp
        on  nop.sell_date=dp.sell_date
  order by  sell_date  

 