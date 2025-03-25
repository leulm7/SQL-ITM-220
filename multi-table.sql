-- Multi-Table Join
use sakila;
SELECT c.first_name, 
       c.last_name, 
       f.title, 
       r.rental_date 
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id;