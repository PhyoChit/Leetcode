WITH rank_status AS
(
    SELECT 
        delivery_id,
        customer_id,
        CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS status,
        ROW_NUMBER() OVER (PARTITION BY customer_id 
                      ORDER BY order_date) AS order_rank
    FROM Delivery
)

SELECT 
    ROUND(SUM(CASE WHEN status = 'immediate' THEN 1 ELSE 0 END)* 100.0 /COUNT(status), 2) AS immediate_percentage
FROM rank_status
WHERE order_rank = 1
