SELECT 
    w2.id
FROM Weather AS w1
JOIN Weather AS w2
ON w2.recordDate = w1.recordDate + INTERVAL '1 Day'
WHERE w2.temperature > w1.temperature
