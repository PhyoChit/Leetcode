-- Option 1 (Using Subquery)

SELECT 
    CASE WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat)
            THEN id 
         WHEN id % 2 = 0
            THEN id - 1
         ELSE id + 1
    END AS id,
    student
FROM Seat
ORDER BY id;

-- Option 2 (Using Cross Join)

WITH num_seat AS (
    SELECT COUNT(*) AS seat_count
    FROM Seat
)

SELECT 
    CASE WHEN id % 2 = 1 AND id = seat_count
            THEN id 
         WHEN id % 2 = 0
            THEN id - 1
         ELSE id + 1
    END AS id,
    student
FROM Seat
CROSS JOIN num_seat
ORDER BY id
