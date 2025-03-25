-- Self join
use sakila;
SELECT c1.first_name AS customer_1, 
       c1.last_name AS last_name_1, 
       c2.first_name AS customer_2, 
       c2.last_name AS last_name_2, 
       ci.city 
FROM customer c1
INNER JOIN address a1 ON c1.address_id = a1.address_id
INNER JOIN city ci ON a1.city_id = ci.city_id
INNER JOIN address a2 ON ci.city_id = a2.city_id
INNER JOIN customer c2 ON a2.address_id = c2.address_id
WHERE c1.customer_id < c2.customer_id;
