#Range Comparisons
#Retrieve all actors who have acted in films with a rental rate between 3.00 and 5.00:
USE sakila;
SELECT first_name, last_name, title, rental_rate
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE rental_rate BETWEEN 3.00 AND 5.00;
