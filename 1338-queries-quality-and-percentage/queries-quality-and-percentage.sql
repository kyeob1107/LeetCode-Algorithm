# Write your MySQL query statement below
WITH poor_query AS(
    SELECT q_s.query_name, COUNT(q_s.result) cnt
    FROM Queries q_s 
    WHERE q_s.rating < 3 
    GROUP BY q_s.query_name
)
SELECT q.query_name,
        ROUND(sum(q.rating/q.position)/COUNT(q.result),2) quality,
        CASE WHEN p.cnt IS NULL THEN 0 
        ELSE ROUND(100*(cnt/COUNT(q.result)),2) 
        END poor_query_percentage
FROM Queries q
LEFT JOIN poor_query p ON q.query_name = p.query_name
WHERE q.query_name IS NOT NULL
GROUP BY q.query_name;