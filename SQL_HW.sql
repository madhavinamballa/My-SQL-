USE sakila;
#1a)===================
SELECT first_name ,last_name FROM actor;
#1b)===============
SELECT UCASE(CONCAT(first_name,' ', last_name)) AS ActorName FROM actor;
#2a)=================== 
SELECT actor_id, first_name,last_name FROM actor
WHERE first_name="Joe" ;
#2b)=========================
SELECT * FROM actor WHERE last_name like '%GEN%';
#2c)==========================
SELECT * FROM actor WHERE last_name like '%LI%'
ORDER BY last_name;
#2d)=====================
SELECT country_id,country FROM country
WHERE country IN ('Afghanistan','Bangladesh','China');
#3a)=====================
ALTER TABLE actor
ADD COLUMN description BLOB;
#3b)==========================
ALTER TABLE actor DROP COLUMN description;
#4a)====================
SELECT last_name , count(*) as NUM 
FROM actor 
GROUP BY last_name;
#4b)==========================
SELECT last_name , count(*) as NUM 
FROM actor 
GROUP BY last_name
HAVING NUM >= 2;
#4c)=================
UPDATE actor SET first_name = 'HARPO'
WHERE first_name='GROUCHO' AND last_name='WILLIAMS';
#4d)================= 
UPDATE actor SET first_name = 'HARPO' 
WHERE first_name='`GROUCHO';
#5a)=============================
DESCRIBE sakila.address;
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
SELECT title FROM film 
WHERE title LIKE 'K%' OR title LIKE 'Q%'
AND language_id=1;
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
JOIN staff AS s
USING(staff_id)
JOIN store st
USING(store_id)
GROUP BY st.store_id;
#7g)===========================
SELECT s.store_id AS store_id,ct.city AS city ,c.country AS country
FROM store AS s
JOIN address as a
USING(address_id)
JOIN city AS ct
USING(city_id)
JOIN country AS c
USING(country_id);
#7h)============================
SELECT c.name as genere,SUM(p.amount) AS gross_revenue
FROM category AS c
JOIN film_category AS fc
USING(category_id)
JOIN inventory AS i
USING(film_id)
JOIN rental as r
USING(inventory_id)
JOIN payment AS p
USING(rental_id)
GROUP BY c.name  ORDER BY gross_revenue DESC LIMIT 5;
#8a)======================================
CREATE VIEW top_five_genres AS 
SELECT c.name as genere,SUM(p.amount) AS gross_revenue
FROM category AS c
JOIN film_category AS fc
USING(category_id)
JOIN inventory AS i
USING(film_id)
JOIN rental as r
USING(inventory_id)
JOIN payment AS p
USING(rental_id)
GROUP BY c.name  ORDER BY gross_revenue DESC LIMIT 5;
#8b)=================================
SELECT * FROM top_five_genres;
#8c)================================
 DROP VIEW top_five_genres;






 
