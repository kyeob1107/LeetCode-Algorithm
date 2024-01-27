# Write your MySQL query statement below
SELECT p.product_name,  SUM(o.unit) unit
FROM Orders o
LEFT JOIN Products p ON o.product_id = p.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY o.product_id
HAVING unit >= 100