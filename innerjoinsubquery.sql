-- Inner Join with Subquery
use sakila;
SELECT c.first_name, 
       c.last_name, 
       rental_count 
FROM customer c
INNER JOIN (
    SELECT customer_id, 
           COUNT(rental_id) AS rental_count 
    FROM rental 
    GROUP BY customer_id 
    ORDER BY rental_count DESC 
    LIMIT 5
) top_customers ON c.customer_id = top_customers.customer_id;
