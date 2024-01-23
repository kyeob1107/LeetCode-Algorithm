# Write your MySQL query statement below
WITH process_seat AS (
    SELECT s.id, s.student,
        s.id DIV 2 quotient,
        (s.id)%2 remainder
    FROM Seat s
)
SELECT ps.id,
    CASE 
        WHEN s_next.id IS NOT NULL 
                AND ps.remainder = 1 THEN s_next.student
        WHEN ps.remainder = 0 THEN s_pre.student
        ELSE ps.student
    END student
FROM process_seat ps
LEFT JOIN Seat s_next ON s_next.id = ps.id + 1
LEFT JOIN Seat s_pre ON s_pre.id = ps.id - 1