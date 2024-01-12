# Write your MySQL query statement below
SELECT CASE WHEN eu.unique_id is NULL THEN NULL
            ELSE eu.unique_id
        END unique_id,
        e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu on e.id = eu.id