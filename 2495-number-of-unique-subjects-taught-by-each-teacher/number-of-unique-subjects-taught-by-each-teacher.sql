# Write your MySQL query statement below
SELECT t.teacher_id, count(DISTINCT t.subject_id) cnt
FROM Teacher t
GROUP BY t.teacher_id