SELECT
    m.name
FROM Employee AS e
JOIN Employee AS m
ON m.id = e.managerID
GROUP BY m.name, m.id
HAVING COUNT(*) >= 5
