# Write your MySQL query statement below
WITH id_list AS (
    SELECT r1.requester_id id
    FROM RequestAccepted r1
    UNION
    SELECT r2.accepter_id id
    FROM RequestAccepted r2
)
SELECT il.id,
        (SELECT COUNT(r1_s.requester_id) FROM RequestAccepted r1_s
        WHERE r1_s.requester_id = il.id) 
        + (SELECT COUNT(r2_s.accepter_id) FROM RequestAccepted r2_s
        WHERE r2_s.accepter_id = il.id) num
FROM id_list il
ORDER BY num DESC
LIMIT 1