#Membership Operators
#Retrieve all films that belong to the "Action" or "Comedy" genre:
USE sakila;
SELECT title, category.name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name IN ('Action', 'Comedy');