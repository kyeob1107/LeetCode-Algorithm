# Write your MySQL query statement below
SELECT DISTINCT l1.num ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id+1 = l2.id
JOIN Logs l3 ON l1.id+2 = l3.id
WHERE l1.num=l2.num AND l1.num = l3.num