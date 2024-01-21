# Write your MySQL query statement below
WITH tri_max_update AS (
    SELECT t.x, t.y, t.z,
            GREATEST(x, y, z) max_len
    FROM Triangle t
)
SELECT tmu.x, tmu.y, tmu.z,
        CASE WHEN (tmu.x + tmu.y + tmu.z)> 2*tmu.max_len THEN "Yes"
        ELSE "No" END triangle
FROM tri_max_update tmu;

