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
#SELECT first_name,last_name,address from 





 