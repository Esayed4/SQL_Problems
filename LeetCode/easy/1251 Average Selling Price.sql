WITH products_priceses AS ( 
    SELECT  
        p.product_id, 
        p.price, 
        u.units 
    FROM Prices p 
    LEFT JOIN UnitsSold u 
        ON p.product_id = u.product_id 
        AND u.purchase_date BETWEEN p.start_date AND p.end_date 
) 

SELECT  
    product_id, 
    ROUND(SUM(price * units) / SUM(units), 2) AS average_price
FROM products_priceses
WHERE units IS NOT NULL
GROUP BY product_id

UNION ALL

SELECT  
    p.product_id,
    0 AS average_price
FROM Prices p
WHERE p.product_id NOT IN (
    SELECT product_id FROM UnitsSold
);
