# Write your MySQL query statement below
-- SELECT s.salary SecondHighestSalary
-- FROM(   
--     SELECT e.id, e.salary,
--             DENSE_RANK() OVER(ORDER BY e.salary DESC) rk
--     FROM Employee e
--     ) s
-- WHERE s.rk=2
SELECT MAX(e.salary) SecondHighestSalary
FROM Employee e
WHERE e.salary < (SELECT MAX(e2.salary) FROM Employee e2)