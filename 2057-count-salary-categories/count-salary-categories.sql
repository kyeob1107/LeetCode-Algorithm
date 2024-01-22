# Write your MySQL query statement below
SELECT "High Salary" category,
    COUNT(*) accounts_count
FROM Accounts a_h 
WHERE a_h.income > 50000
UNION
SELECT "Average Salary" category,
    COUNT(*) accounts_count
FROM Accounts a_a 
WHERE a_a.income BETWEEN 20000 and 50000
UNION
SELECT "Low Salary" category,
    COUNT(*) accounts_count
FROM Accounts a_l 
WHERE a_l.income < 20000