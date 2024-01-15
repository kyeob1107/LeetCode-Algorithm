# Write your MySQL query statement below
SELECT s.user_id, 
        CASE 
        WHEN 
        ROUND(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0
        END)/count(c.action),2) IS NULL 
                                        THEN 0
        ELSE 
        ROUND(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0
        END)/count(c.action),2) 
        END confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id