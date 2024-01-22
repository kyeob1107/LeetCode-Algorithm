# Write your MySQL query statement below
WITH total_by_turn AS (
    SELECT q.turn, q.person_id, q.person_name, q.weight,
    (SELECT SUM(q_s.weight) FROM Queue q_s 
                            WHERE q_s.turn<=q.turn) sum_weight
    FROM Queue q
    ORDER BY q.turn DESC
)
SELECT tbt.person_name
FROM total_by_turn tbt
WHERE tbt.sum_weight <=1000
LIMIT 1