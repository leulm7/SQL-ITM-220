CREATE INDEX idx_rental_date
ON rental (rental_date);

SELECT * FROM rental 
WHERE rental_date BETWEEN '2005-05-01' AND '2005-05-31';

CREATE INDEX idx_customer_name
ON customer (last_name, first_name);
SELECT * FROM customer
WHERE last_name = 'SMITH' AND first_name = 'JOHN';

ALTER TABLE rental
ADD CONSTRAINT chk_return_date 
CHECK (return_date >= rental_date);

DROP INDEX idx_unique_email
ON customer;

SHOW INDEX FROM customer;


