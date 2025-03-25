-- SELECT DISTINCT f.title , a.first_name, a.last_name
-- FROM film f
-- INNER JOIN film_actor fa ON f.film_id = fa.film_id
-- INNER JOIN actor a ON fa.actor_id = a.actor_id
-- WHERE a.first_name = 'JOHN';

SELECT a1.address AS addr1, a2.address AS addr2, c.city
FROM address a1
INNER JOIN address a2 
	ON a1.city_id = a2.city_id 
INNER JOIN city c 
	ON a1.city_id = c.city_id
where a1.address_id != a2.address_id;



-- SELECT a.first_name, a.last_name, a.actor_id, fa.film_id, f.title, f.length
-- FROM actor a
-- 	join film_actor fa 
-- 		on fa.actor_id = a.actor_id
--     join film f 
-- 		on fa.film_id = f.film_id
-- WHERE a.first_name = 'Joe' AND a.last_name = 'Swank' AND (f.length BETWEEN 90 AND 120);
