SELECT 
    id, movie, description, rating
FROM Cinema
WHERE id % 2 = 1
AND description != 'boring'
GROUP BY 1, 2, 3, 4
ORDER BY rating DESC
