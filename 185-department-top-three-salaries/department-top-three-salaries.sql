# Write your MySQL query statement below
WITH rk_salary AS (
    SELECT 
    e.id, e.name, e.salary, e.departmentId, 
    DENSE_RANK() 
        OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) rk
FROM
    Employee e
)

SELECT d.name Department, rs.name Employee, rs.salary
FROM Department d
LEFT JOIN rk_salary rs ON d.id = rs.departmentId
WHERE rs.rk <= 3