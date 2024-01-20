# Write your MySQL query statement below
WITH single AS (
    SELECT m_s.num
    FROM MyNumbers m_s
    GROUP BY m_s.num
    HAVING COUNT(m_s.num) = 1
)
SELECT MAX(s.num) num
FROM single s
