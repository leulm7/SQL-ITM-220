SELECT first_name, last_name
FROM actor
WHERE actor_id = (SELECT MAX(actor_id) FROM actor);

SELECT first_name, last_name, actor_id
FROM actor
WHERE (first_name, last_name) = (SELECT first_name, last_name FROM actor WHERE actor_id = 1);

 SELECT title
FROM film
WHERE film_id IN (SELECT film_id FROM film_category WHERE category_id = 1);


SELECT actor_id, film_id
FROM film_actor
WHERE (actor_id, film_id) IN (SELECT actor_id, film_id FROM film_actor WHERE film_id = 1);

SELECT first_name, last_name
FROM actor a
WHERE EXISTS (SELECT 1 FROM film_actor fa WHERE fa.actor_id = a.actor_id AND fa.film_id = 1);

