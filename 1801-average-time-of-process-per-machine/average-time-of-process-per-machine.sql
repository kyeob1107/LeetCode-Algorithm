WITH end_val AS(
    SELECT a_e.machine_id, a_e.process_id , a_e.timestamp end_time
    FROM Activity a_e
    WHERE a_e.activity_type='end'
    GROUP BY a_e.machine_id, a_e.process_id
),
    start_val AS(
    SELECT a_s.machine_id, a_s.process_id , a_s.timestamp start_time
    FROM Activity a_s
    WHERE a_s.activity_type='start'
    GROUP BY a_s.machine_id, a_s.process_id
    )
SELECT e.machine_id, 
    ROUND(SUM(e.end_time - s.start_time)/count(e.process_id),3) processing_time
FROM end_val e INNER JOIN start_val s ON e.machine_id = s.machine_id and e.process_id = s.process_id
GROUP BY e.machine_id;