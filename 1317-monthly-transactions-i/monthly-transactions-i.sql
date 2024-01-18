# Write your MySQL query statement below
WITH approved AS(
    SELECT 
        DATE_FORMAT(t_s.trans_date,'%Y-%m') month,
        t_s.trans_date,
        t_s.country , 
        count(t_s.id) approved_count,
        sum(t_s.amount) approved_total_amount
    FROM Transactions t_s
    WHERE t_s.state='approved'
    GROUP BY DATE_FORMAT(t_s.trans_date,'%Y-%m'),t_s.country
)
SELECT DATE_FORMAT(t.trans_date,'%Y-%m') month,
        t.country , 
        count(t.id) trans_count,
        CASE WHEN MAX(a.approved_count) IS NULL THEN 0
        ELSE MAX(a.approved_count) END approved_count,
        sum(t.amount) trans_total_amount,
        CASE WHEN MAX(a.approved_total_amount) IS NULL THEN 0
        ELSE MAX(a.approved_total_amount) END approved_total_amount
FROM Transactions t
LEFT JOIN approved a 
    ON t.trans_date = a.trans_date
    AND (t.country = a.country OR a.country IS NULL)
GROUP BY DATE_FORMAT(t.trans_date,'%Y-%m'),t.country