# Write your MySQL query statement below
SELECT a.activity_date day, COUNT(DISTINCT a.user_id) active_users
FROM Activity a
WHERE DATEDIFF('2019-07-27',a.activity_date) BETWEEN 0 and 29
GROUP BY a.activity_date