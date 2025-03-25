#NULL Handling
#Retrieve all films where the release_year is unknown (NULL value):
USE sakila;
SELECT title, release_year
FROM film
WHERE release_year IS NULL;