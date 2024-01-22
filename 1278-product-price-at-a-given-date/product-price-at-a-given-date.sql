# Write your MySQL query statement below
WITH latest_update AS(
    SELECT p2.product_id,
        p2.new_price,
        p2.change_date
    FROM Products p2
    WHERE p2.change_date <= '2019-08-16'
        AND EXISTS (
                SELECT 1
                FROM Products p_s
                WHERE p_s.change_date <= '2019-08-16'
                 AND p2.product_id = p_s.product_id
                GROUP BY p_s.product_id
                HAVING MAX(p_s.change_date) = p2.change_date
                )
)
SELECT p.product_id , 
        CASE WHEN lu.product_id IS NULL THEN 10
        ELSE lu.new_price END price
FROM Products p
LEFT JOIN latest_update lu ON p.product_id = lu.product_id
GROUP BY p.product_id