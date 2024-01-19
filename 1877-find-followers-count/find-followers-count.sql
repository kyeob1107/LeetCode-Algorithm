# Write your MySQL query statement below
SELECT f.user_id, count(f.follower_id) followers_count
FROM Followers f
GROUP BY f.user_id
ORDER BY f.user_id;