-- Basic Inner Join
use sakila;
SELECT c.first_name, 
       c.last_name, 
       a.address 
FROM customer c 
INNER JOIN address a 
ON c.address_id = a.address_id;