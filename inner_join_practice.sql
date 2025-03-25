USE sakila;
-- SELECT r.rental_id, r.rental_date, c.first_name, c.last_name
-- FROM rental r
-- 	INNER JOIN customer c on r.custmomer_id = c.customer_id;
    
-- SELECT f.title, c.name AS catefory_name
-- FROM film f
-- 	inner join 
--     film_category fc on f.film_id = fc.film_id
--     inner join
--     category c on fc.category_id = c.category_id;

-- display all actors who appeared in each film
-- SELECT a.first_name, a.last_name, f.title
-- FROM actor a
-- 	inner join 
--     film_actor fa on a.actor_id = factor_id
--     inner join
--     film f on fa.film_id = f.film_id
-- ORDER BY f.title;


-- retrieve inventory details and their corresponding store locations
-- SELECT i.inventory_id, i.film_id, s.store_id
-- FROM inventory i
-- 	inner join 
--     store s on i.store_id = s.store_id;
    
-- show payment details along with the customer's full name

SELECT p.payment_id, p.amount, c.first_name, c.last_name
FROM payment p
	inner join
    customer c on p.customer_id = c.customer_id