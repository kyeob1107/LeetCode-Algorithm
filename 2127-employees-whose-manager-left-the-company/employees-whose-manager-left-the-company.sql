# Write your MySQL query statement below
SELECT e.employee_id
FROM Employees e
WHERE e.salary < 30000
 AND e.manager_id IS NOT NULL
 AND NOT EXISTS(
            SELECT e2.employee_id
            FROM Employees e2
            WHERE e2.employee_id = e.manager_id
            )
ORDER BY e.employee_id