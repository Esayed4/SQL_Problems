WITH user_activity_trends AS (
    SELECT 
        user_id,
        event_date,
        -- Get the date of the user's immediate previous action
        LAG(event_date) OVER (
            PARTITION BY user_id 
            ORDER BY event_date ASC
        ) AS previous_action_date
    FROM user_actions
),

retained_users AS (
    SELECT 
        user_id,
        EXTRACT(MONTH FROM event_date) AS event_month
    FROM user_activity_trends
    WHERE 
        -- Ensure the current event is in the month directly following the last one
        DATE_TRUNC('month', event_date) = DATE_TRUNC('month', previous_action_date + INTERVAL '1 month')
)

SELECT 
    event_month AS month,
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM retained_users
WHERE event_month = 7
GROUP BY 1
ORDER BY 1;