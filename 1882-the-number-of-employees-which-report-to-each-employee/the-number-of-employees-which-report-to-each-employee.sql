# Write your MySQL query statement below
WITH manager AS (
    SELECT e2.employee_id,
            e2.reports_to,
            COUNT(e2.employee_id) reports_count,
            ROUND(AVG(e2.age)) average_age
    FROM Employees e2
    WHERE e2.reports_to IS NOT NULL
    GROUP BY e2.reports_to
)
SELECT e.employee_id, e.name,
        m.reports_count,
        m.average_age
FROM manager m 
JOIN Employees e ON m.reports_to = e.employee_id
ORDER BY e.employee_id
