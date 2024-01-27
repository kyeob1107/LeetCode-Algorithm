# Write your MySQL query statement below
SELECT *
FROM Users u
WHERE u.mail LIKE '%@leetcode.com'
    AND 
        SUBSTRING_INDEX(u.mail,'@leetcode.com',1) REGEXP '^[a-zA-Z]'
    AND 
        SUBSTRING_INDEX(u.mail,'@leetcode.com',1) 
                                        NOT REGEXP '[^a-zA-Z0-9_.-]'
