# Write your MySQL query statement below
WITH rating_movie AS (
    SELECT mr1.movie_id, AVG(mr1.rating) avg_m
    FROM MovieRating mr1
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr1.movie_id
),
count_user AS (
    SELECT mr2.user_id, COUNT(mr2.movie_id) cnt_u
    FROM MovieRating mr2
    GROUP BY mr2.user_id
)
(SELECT u.name AS results
FROM count_user cu
JOIN Users u ON cu.user_id = u.user_id
WHERE cu.cnt_u = (SELECT MAX(cu_s.cnt_u) FROM count_user cu_s)
ORDER BY results
LIMIT 1)
UNION ALL
(SELECT m.title AS results
FROM rating_movie rm
JOIN Movies m ON rm.movie_id = m.movie_id
WHERE rm.avg_m = (SELECT MAX(rm_s.avg_m) FROM rating_movie rm_s)
ORDER BY results
LIMIT 1);
