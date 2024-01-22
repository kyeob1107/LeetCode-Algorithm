# Write your MySQL query statement below
SELECT q.person_name
FROM Queue q
WHERE 1000 >= (
    SELECT SUM(q_s.weight) 
    FROM Queue q_s 
    WHERE q_s.turn<=q.turn
)
ORDER BY q.turn DESC
LIMIT 1;