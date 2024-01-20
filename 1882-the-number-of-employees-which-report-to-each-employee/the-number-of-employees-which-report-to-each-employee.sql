# Write your MySQL query statement below
SELECT e.employee_id, e.name, 
        (SELECT COUNT(e_s.employee_id) FROM Employees e_s
        WHERE e.employee_id = e_s.reports_to) reports_count
        ,(SELECT ROUND(AVG(e_s2.age)) FROM Employees e_s2
        WHERE e.employee_id = e_s2.reports_to) average_age
FROM Employees e
WHERE EXISTS(SELECT distinct e2.reports_to
            FROM Employees e2
            WHERE e2.reports_to IS NOT NULL
            AND e.employee_id = e2.reports_to)
ORDER BY e.employee_id