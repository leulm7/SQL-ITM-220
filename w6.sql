select f.title, f.rating, count(*) as actor_count
from film f

JOIN film_actor fa ON f.film_id = fa.film_id

JOIN actor a ON fa.actor_id = a.actor_id

WHERE f.rating IN ('G', 'PG', 'PG-13')
group by f.title, f.rating

HAVING actor_count>= 9 AND actor_count<12
ORDER BY f.title ASC;