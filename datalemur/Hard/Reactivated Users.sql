WITH user_months AS (
    SELECT DISTINCT 
           user_id,  
           EXTRACT(MONTH FROM login_date) AS login_month
    FROM user_logins
),
previous_months AS (
    SELECT 
           user_id,
           login_month,
           LAG(login_month) OVER (
               PARTITION BY user_id 
               ORDER BY login_month
           ) AS prev_month
    FROM user_months
)
SELECT 
       login_month AS month,
       COUNT(*) AS reactivated_users
FROM previous_months
WHERE prev_month IS NULL 
   OR login_month != prev_month + 1
GROUP BY login_month
ORDER BY login_month;
