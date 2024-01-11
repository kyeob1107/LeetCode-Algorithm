# Write your MySQL query statement below
SELECT distinct v.author_id id
FROM Views v
WHERE v.author_id = v.viewer_id
ORDER BY v.author_id