# Write your MySQL query statement below
WITH day_amount AS(
    SELECT c.visited_on , SUM(c.amount) amount
    FROM Customer c
    GROUP BY c.visited_on
),
tot_amount AS (
  SELECT 
    da.visited_on, 
    (SELECT SUM(da_s.amount) FROM day_amount da_s 
    WHERE 
        DATEDIFF(da.visited_on, da_s.visited_on) BETWEEN 0 AND 6) amount
  FROM day_amount da
  WHERE 
    DATEDIFF(da.visited_on, (SELECT MIN(da_s2.visited_on) 
                                FROM day_amount da_s2))>=6
)
SELECT ta.visited_on, ta.amount, ROUND((ta.amount)/7,2) average_amount
FROM tot_amount ta