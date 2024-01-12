# Write your MySQL query statement below
SELECT t.tweet_id
FROM Tweets t
WHERE LENGTH(content)>15;