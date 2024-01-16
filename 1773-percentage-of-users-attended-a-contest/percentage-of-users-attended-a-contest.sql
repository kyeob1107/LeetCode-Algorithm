# Write your MySQL query statement below
SELECT r.contest_id, 
    ROUND(100*COUNT(r.user_id)/(SELECT COUNT(user_id) FROM Users u),2) percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id;