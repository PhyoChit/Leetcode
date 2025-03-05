WITH sequence AS (
SELECT 
    id,
    num,
    LEAD(num) OVER (ORDER BY id) AS lead,
    LAG(num) OVER (ORDER BY id) AS lag
FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM sequence
WHERE num = lead AND num = lag
