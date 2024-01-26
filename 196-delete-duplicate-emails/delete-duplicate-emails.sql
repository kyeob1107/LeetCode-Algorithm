# Write your MySQL query statement below
-- WITH temp AS (
--     SELECT p.email, MIN(p.id) AS min_id
--     FROM Person p
--     GROUP BY p.email
--     HAVING COUNT(*) > 1)

-- DELETE p
-- FROM Person p
-- JOIN temp t ON p.email = t.email AND p.id <> t.min_id
WITH temp AS (
    SELECT p.email, MIN(p.id) AS min_id
    FROM Person p
    GROUP BY p.email)

DELETE p
FROM Person p
JOIN temp t ON p.email = t.email AND p.id <> t.min_id