WITH low_income AS (
SELECT 'Low Salary' AS category, COUNT (*) AS accounts_count
FROM Accounts
WHERE income < '20000')

, high_income AS (
SELECT 'High Salary' AS category, COUNT (*) AS accounts_count
FROM Accounts
WHERE income >'50000'
)

, average_income AS (
SELECT 'Average Salary' AS category, COUNT (*) AS accounts_count
FROM Accounts
WHERE income >='20000' AND income <='50000')

SELECT *
FROM low_income
UNION
SELECT *
FROM average_income
UNION
SELECT *
FROM high_income
