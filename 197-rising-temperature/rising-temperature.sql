# Write your MySQL query statement below
SELECT w.id
FROM Weather w
WHERE w.temperature>(SELECT w_s.temperature FROM weather w_s WHERE DATEDIFF(w.recordDate,w_s.recordDate) = 1)
ORDER BY w.recordDate