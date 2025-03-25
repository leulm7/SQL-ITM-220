#Equality and Inequality Comparisons
#Retrieve all the films that have been rented by a customer (i.e., the rental count is greater than 0):
USE sakila;
SELECT title, rental_rate
FROM film
WHERE rental_rate = 4.99;
