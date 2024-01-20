# Write your MySQL query statement below
SELECT MAX(m.num) num
FROM MyNumbers m
WHERE (SELECT COUNT(m_s.num) FROM MyNumbers m_s 
        WHERE m.num = m_s.num) = 1