# Write your MySQL query statement below
SELECT sub.machine_id, round(AVG(sub.difference),3) processing_time
FROM
(SELECT a_e.machine_id, a_e.process_id , 
    round(MAX(CASE WHEN activity_type = 'end' THEN timestamp END) -
    MAX(CASE WHEN activity_type = 'start' THEN timestamp END),3) AS difference
FROM Activity a_e
GROUP BY a_e.machine_id, a_e.process_id) sub
GROUP BY sub.machine_id