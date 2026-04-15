with newTable as(
  select 
    measurement_value,
    ROW_number()over (PARTITION by to_char(measurement_time,'yyyy-mm-dd') order by measurement_time asc) as OrderNum
    ,to_char(measurement_time,'yyyy-mm-dd') as d
    from measurements 
)

SELECT 
    CAST(d AS DATE) as measurement_day,  
    SUM(CASE WHEN OrderNum % 2 != 0 THEN measurement_value ELSE 0 END) as odd_sum,
    SUM(CASE WHEN OrderNum % 2 = 0 THEN measurement_value ELSE 0 END) as even_sum
FROM newTable
GROUP BY d
ORDER BY measurement_day;
 