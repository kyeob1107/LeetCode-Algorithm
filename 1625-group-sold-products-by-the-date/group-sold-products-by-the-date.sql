# Write your MySQL query statement below
SELECT 
        a.sell_date, 
        COUNT(DISTINCT a.product) num_sold,
        GROUP_CONCAT(DISTINCT a.product) products
FROM 
        Activities a
GROUP BY 
        a.sell_date
ORDER BY
        a.sell_date