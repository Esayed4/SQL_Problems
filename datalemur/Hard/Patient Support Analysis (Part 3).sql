WITH call_history AS (
    SELECT 
           policy_holder_id,
           call_date,
           LAG(call_date) OVER (
               PARTITION BY policy_holder_id
               ORDER BY call_date
           ) AS prev_date
    FROM callers
)
SELECT 
      count(DISTINCT policy_holder_id) as policy_holder_count
FROM call_history
WHERE EXTRACT(DAY FROM (call_date - prev_date)) < 7;
