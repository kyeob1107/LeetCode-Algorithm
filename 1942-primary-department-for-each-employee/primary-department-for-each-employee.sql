# Write your MySQL query statement below
SELECT e.employee_id, e.department_id
FROM Employee e
GROUP BY e.employee_id
HAVING COUNT(e.department_id) = 1
UNION
SELECT e2.employee_id, e2.department_id FROM Employee e2 WHERE e2.primary_flag = 'Y'