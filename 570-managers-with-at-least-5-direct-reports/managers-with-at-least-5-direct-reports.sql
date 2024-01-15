# Write your MySQL query statement below
SELECT e_s.name
FROM Employee e
CROSS JOIN Employee e_s
WHERE e.managerId = e_s.id
GROUP BY e_s.id
HAVING count(e.managerId)>=5