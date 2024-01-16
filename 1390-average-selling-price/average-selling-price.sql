# Write your MySQL query statement below
WITH update_unitsold AS(
    SELECT p.product_id, s.purchase_date,
        CASE WHEN s.units IS NULL THEN 0 ELSE s.units END units
    FROM Prices p
    LEFT JOIN UnitsSold s ON s.product_id = p.product_id 
        AND s.purchase_date BETWEEN p.start_date AND p.end_date

)

SELECT p.product_id, 
        CASE WHEN SUM(u.units) =0 THEN 0
        ELSE ROUND(SUM(u.units * p.price)/SUM(u.units),2)
        END average_price
FROM Prices p
LEFT JOIN update_unitsold u ON u.product_id = p.product_id 
WHERE (u.purchase_date BETWEEN p.start_date AND p.end_date)
        OR u.units=0
GROUP BY p.product_id