WITH annual_product_spend AS (
    SELECT 
        EXTRACT(YEAR FROM transaction_date) AS report_year,
        product_id,
        SUM(spend) AS current_year_spend
    FROM user_transactions
    GROUP BY 1, 2
),

yearly_comparison AS (
    SELECT 
        report_year,
        product_id,
        current_year_spend,
        LAG(current_year_spend) OVER (
            PARTITION BY product_id 
            ORDER BY report_year
        ) AS previous_year_spend
    FROM annual_product_spend
)

SELECT 
    *,
    ROUND(
        100.0 * (current_year_spend - previous_year_spend) / NULLIF(previous_year_spend, 0), 
        2
    ) AS yoy_rate
FROM yearly_comparison;