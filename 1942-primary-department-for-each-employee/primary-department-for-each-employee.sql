# Write your MySQL query statement below
SELECT e.employee_id, e.department_id
FROM Employee e
WHERE e.primary_flag = 'Y' OR e.employee_id in (
    SELECT e2.employee_id
    FROM Employee e2
    GROUP BY e2.employee_id
    HAVING COUNT(*) = 1
)