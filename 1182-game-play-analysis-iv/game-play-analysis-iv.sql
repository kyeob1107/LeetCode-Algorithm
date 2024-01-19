# Write your MySQL query statement below
WITH first AS(
    #연속적으로 로그인 한 경우 아이디
    SELECT a_m.player_id,
            MIN(a_m.event_date) first_date
    FROM Activity a_m
    GROUP BY a_m.player_id
) 
SELECT ROUND(COUNT(DISTINCT a.player_id)/
            (SELECT COUNT(DISTINCT a_s.player_id) FROM Activity a_s)
            ,2) fraction
FROM Activity a
INNER JOIN first f ON a.player_id = f.player_id
AND DATE_ADD(f.first_date, INTERVAL 1 DAY) = a.event_date;