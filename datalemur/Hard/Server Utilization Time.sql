with t as(
    select server_id,session_status,status_time,
          lag(status_time)over(PARTITION by server_id order by status_time asc) as startTime
    from server_utilization  
)

SELECT EXTRACT(DAY FROM JUSTIFY_INTERVAL(SUM(status_time - starttime))) AS total_uptime_days
FROM t
WHERE session_status = 'stop';