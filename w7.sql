SELECT c.customer_id, 
       COUNT(r.return_date) AS NonNull_Returns, 
       COUNT(*) AS Total_Rentals
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
LIMIT 10;
