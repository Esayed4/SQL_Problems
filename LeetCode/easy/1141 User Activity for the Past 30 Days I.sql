 

SELECT 
    TO_char(activity_date, 'yyyy-mm-dd') AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN
      TO_DATE('2019-07-27', 'yyyy-mm-dd') - 29
  AND TO_DATE('2019-07-27', 'yyyy-mm-dd')
GROUP BY activity_date
ORDER BY activity_date;
