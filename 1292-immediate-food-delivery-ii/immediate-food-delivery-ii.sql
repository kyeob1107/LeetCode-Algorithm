# Write your MySQL query statement below
WITH min_order AS(
    SELECT d_m.customer_id,
            min(order_date) first_order_date
    FROM Delivery d_m
    GROUP BY d_m.customer_id

)
SELECT ROUND(100*COUNT(d.customer_id)/
            (SELECT COUNT(DISTINCT d_s.customer_id) FROM Delivery d_s)
            ,2) immediate_percentage
FROM Delivery d
INNER JOIN min_order m ON d.customer_id = m.customer_id
WHERE m.first_order_date=d.customer_pref_delivery_date