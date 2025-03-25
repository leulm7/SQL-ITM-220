#Wildcards for Pattern Matching
#Retrieve all customers whose first name starts with "J" (case insensitive) and ends with "n":
USE sakila;
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'J%n';