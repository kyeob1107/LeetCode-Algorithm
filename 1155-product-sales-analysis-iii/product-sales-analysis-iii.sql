# Write your MySQL query statement below
WITH first_sale AS(
    SELECT s_s.product_id, MIN(s_s.year) first_year
    FROM Sales s_s
    GROUP BY s_s.product_id
)
SELECT s.product_id, f.first_year, s.quantity, s.price
FROM Sales s
JOIN first_sale f ON s.product_id = f.product_id 
WHERE f.first_year = s.year