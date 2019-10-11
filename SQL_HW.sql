USE sakila;
SELECT * FROM actor LIMIT 10;
# Displaying First and last names from actor table
SELECT first_name ,last_name FROM actor;
#Adding new column Actor_Name to stor acotrs full name 
ALTER TABLE actor
ADD COLUMN Actor_Name  VARCHAR(50);
DESCRIBE actor;
#Populating Actor_Name column data by concatinating first_name and last_name column values 
UPDATE actor SET Actor_Name = UCASE(CONCAT(first_name,' ', last_name)) ;
SELECT actor_id, first_name,last_name FROM actor
WHERE first_name="Joe" ;
SELECT last_name FROM acotr WHERE last_name like '%G%';
SELECT * 
	FROM actor 
   WHERE INSTR(last_name, 'GEN') > 0;
SELECT * 
	FROM actor 
   WHERE INSTR(last_name, 'LI') > 0;
SELECT * 
FROM actor 
ORDER BY last_name ASC,first_name ASC;
SELECT country_id,country FROM country
WHERE country IN ('Afghanistan','Bangladesh','China');
ALTER TABLE actor
ADD COLUMN description BLOB;
ALTER TABLE actor DROP COLUMN description;
SELECT last_name , count(*) as NUM FROM actor GROUP BY last_name;
SELECT last_name , count(*) as NUM FROM actor 
GROUP BY last_name
HAVING NUM >= 2;
UPDATE actor SET Actor_Name = 'HARPO WILLIAMS' 
WHERE Actor_Name='`GROUCHO WILLIAMS';
UPDATE actor SET first_name = 'HARPO' 
WHERE first_name='`GROUCHO';
SELECT * FROM staff LIMIT 10;
SELECT * FROM address LIMIT 10;
#5a)

#6a)==================
SELECT s.first_name AS FirstName,s.last_name AS LastName,a.address AS Address 
FROM staff AS s
JOIN address AS a
USING (address_id);
#6b)==================
SELECT concat(s.first_name,'',s.last_name) AS staff,SUM(p.amount) AS Total_Amount  
FROM payment AS p
JOIN staff as s
USING(staff_id)
WHERE payment_date LIKE '2005-08%'
GROUP BY p.staff_id; 
#6c)====================
SELECT f.title as Film,count(fa.actor_id) as Actors 
FROM film AS f
JOIN film_actor AS fa
USING(film_id)
GROUP BY f.title;
#6d)====================
SELECT f.title AS film_name,count(t.inventory_id) AS no_of_copies
FROM film AS f 
JOIN inventory AS t
USING(film_id)
WHERE f.title='Hunchback Impossible'
GROUP BY f.title;
#6e)====================
SELECT concat(c.first_name,' ',c.last_name) AS Name,SUM(P.amount) AS total_amount 
FROM payment AS p
JOIN customer AS c
USING(customer_id)
GROUP BY p.customer_id;
#7a)====================
#7b)=====================
SELECT Actor_Name
	FROM actor
	WHERE  actor_id IN 
	(SELECT actor_id FROM film_actor where film_id = 
	(SELECT film_id FROM film WHERE title = 'Alone Trip'));
#7c)=====================    
SELECT concat(c.first_name,' ',c.last_name) as customer_name ,c.email AS email,cn.country AS country
	FROM customer c
	JOIN address AS A 
		USING(address_id)
		JOIN city AS cy
			USING(city_id)
			JOIN country AS cn
				USING(country_id)
				WHERE country='Canada';
#7d)========================
SELECT f.title as 'Movie_name'
	FROM film as f
	JOIN film_category as fc USING(film_id)
	JOIN category as c USING(category_id)
	WHERE c.name = 'Family';
#7e)=============================
SELECT f.title,COUNT(r.rental_id) AS frequency FROM rental AS r
JOIN inventory AS i
USING(inventory_id)
JOIN film AS f
USING(film_id)
GROUP BY f.title
ORDER BY frequency DESC;
#7f)========================
SELECT SUM(p.amount) AS total,s.store_id AS store 
FROM payment AS p
JOIN rental 
USING(rental_id)
JOIN inventory
USING(stroe_id)











 
