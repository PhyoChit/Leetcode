SELECT 
    s.machine_id,
    ROUND(AVG(e.timestamp - s.timestamp)::DECIMAL ,3) AS processing_time
FROM Activity AS s
JOIN Activity AS e
ON s.machine_id = e.machine_id
AND s.process_id = e.process_id
AND s.activity_type = 'start'
AND e.activity_type = 'end'
GROUP BY s.machine_id
