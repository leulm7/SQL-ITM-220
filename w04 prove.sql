-- Join with aggregate function
use sakila;
SELECT f.title, 
       COUNT(r.rental_id) AS total_rentals 
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY total_rentals DESC
LIMIT 10;
