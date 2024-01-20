# Write your MySQL query statement below
WITH single AS (
    SELECT m_s.num
    FROM MyNumbers m_s
    GROUP BY m_s.num
    HAVING COUNT(m_s.num) = 1
),
max_n AS (
    SELECT m_m.num
    FROM MyNumbers m_m
    GROUP BY m_m.num
    HAVING MAX(m_m.num) = m_m.num
)
SELECT MAX(s.num) num
FROM max_n m
LEFT JOIN single s ON m.num = s.num