-- Option 1

SELECT employee_id 
FROM Employees
WHERE salary < 30000
AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id

-- Option 2

SELECT 
    employee_id
FROM Employees AS e1
WHERE manager_id IS NOT NULL
AND salary < 30000
AND NOT EXISTS (
    SELECT 1
    FROM Employees AS e2
    WHERE e1.manager_id = e2.employee_id
)
ORDER BY employee_id
