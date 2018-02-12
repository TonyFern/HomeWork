use sakila

-- 1a. 
SELECT first_name, last_name from actor;

-- 1b.
SELECT CONCAT(UCASE(first_name), " ", UCASE(last_name)) 
AS "Actor Name"
FROM actor;

-- 2a. 
SELECT actor_id, first_name, last_name 
FROM actor
WHERE first_name = "Joe";

-- 2b.
SELECT * 
FROM actor
WHERE last_name LIKE '%gen%';

-- 2c.
Select * FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;

-- 2d. 
SELECT * 
FROM country
WHERE country in ('Afghanistan', 'Bangladesh', 'China');

-- 3a. 
ALTER TABLE actor
ADD COLUMN MiddleName VARCHAR(50) AFTER first_name;

-- 3b. 
ALTER TABLE actor 
MODIFY middle_name BLOB;

-- 3c.  
ALTER TABLE actor 
DROP middle_name;

-- 4a.
SELECT last_name, 
COUNT(last_name) AS 'Number of Actors' 
	FROM actor
		GROUP BY last_name;

-- 4b. 
SELECT last_name, COUNT(last_name) AS 'Number of Actors' 
	FROM actor
		GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- 4c.
UPDATE actor
		SET first_name = 'HARPO' 
		WHERE first_name = "GROUCHO" 
			AND last_name = "WILLIAMS";

-- 4d.
UPDATE actor
	SET first_name = 
		CASE 
			WHEN first_name = "HARPO"
			THEN "GROUCHO"
		ELSE "MUCHO GROUCHO"
	END WHERE actor_id = 172;
    

-- 5a.
SHOW COLUMNS 
from sakila.address;

-- 6a.
SELECT first_name, last_name, address 
FROM staff s
	INNER JOIN address a ON s.address_id = a.address_id;

-- 6b.
SELECT s.staff_id, first_name, last_name, SUM(amount) as "Total Amount"
FROM staff s
	INNER JOIN payment p ON s.staff_id = p.staff_id
		GROUP BY s.staff_id;

-- 6c.
SELECT f.title, COUNT(fa.actor_id) as "numOfActors"
FROM film f
	LEFT JOIN film_actor fa ON f.film_id = fa.film_id
		GROUP BY f.film_id;

-- 6d.
SELECT f.title, COUNT(i.inventory_id) as "Count of Inventory"
FROM film f
	INNER JOIN inventory i ON f.film_id = i.film_id
		GROUP BY f.film_id
		HAVING title = "Hunchback Impossible";

--6e. 

SELECT c.last_name, c.first_name,
SUM(p.amount) as "Total Paid"
FROM customer c
	INNER JOIN payment p ON c.customer_id = p.customer_id
		GROUP BY p.customer_id
		ORDER BY last_name, first_name;



