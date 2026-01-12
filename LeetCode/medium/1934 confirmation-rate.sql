WITH temp_confirmation AS (
    SELECT 
        user_id,
        CASE 
            WHEN action = 'confirmed' THEN  1
            ELSE 0
        END AS confirmation
    FROM Confirmations
)

SELECT 
    s.user_id ,
            round(
                avg(tc.confirmation),2
            )  as confirmation_rate 
 FROM Signups  s left join temp_confirmation tc on s.user_id=tc.user_id
 group by s.user_id
 