-- Write your PostgreSQL query statement below
WITH weight_rank AS (
SELECT 
    turn,
    person_id,
    person_name, 
    weight AS weight,
    SUM(weight) OVER (ORDER BY turn) AS total_weight
FROM Queue
)

SELECT 
    person_name
FROM weight_rank
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1
