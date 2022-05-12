-- Lab/ SQL Join (Part II)

-- Instructions

-- 1 Write a query to display for each store its store ID, city, and country.

USE sakila;
SELECT * FROM sakila.store;
SELECT * FROM sakila.city;
SELECT * FROM sakila.country;
SELECT * FROM sakila.address;

select s.store_id, c.city, co.country
from address as a
join store as s
on a.address_id=s.address_id
join city as c
on a.city_id=c.city_id
join country as co
on c.country_id = co.country_id;

-- 2 Write a query to display how much business, in dollars, each store brought in.
SELECT * FROM sakila.store;
SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;


select s.store_id, sum(amount) as Business_in_dollar
from staff as s
join store as sto
on s.store_id=sto.store_id
left join payment as p
on s.staff_id=p.staff_id
group by s.store_id;
-- ho do I shot it in dollar?

-- 3 Which film categories are longest?
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.film;

select c.category_id, c.name,count(f.film_id) as Film_for_categories
from category as c
join film_category as f_c
on c.category_id= f_c.category_id
join film as f
on f_c.film_id = f.film_id
group by c.category_id, c.name
ORDER BY Film_for_categories DESC
LIMIT 10;

-- 4 Display the most frequently rented movies in descending order.

SELECT * FROM sakila.film;
SELECT * FROM sakila.inventory;
SELECT * FROM sakila.rental;


SELECT title, COUNT(r.rental_id) AS 'Count_of_Rented_Movies'
FROM  film as f
JOIN inventory as i 
ON f.film_id= i.film_id
JOIN rental as r 
ON i.inventory_id=r.inventory_id
GROUP BY title 
ORDER BY Count_of_Rented_Movies DESC;


-- 5 List the top five genres in gross revenue in descending order. -which are the geners that get more revenue
SELECT * FROM sakila.payment;
SELECT * FROM sakila.rental;
SELECT * FROM sakila.inventory;
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.category;


select c.category_id, c.name, SUM(p.amount) as gross_revenue
from payment as p
join rental as r
on p.rental_id = r.rental_id
join inventory as i
on r.inventory_id = i.inventory_id
join film_category as f_c
on i.film_id = f_c.film_id 
join category as c 
on f_c.category_id = c.category_id
GROUP BY c.category_id, c.name
ORDER BY gross_revenue DESC;



-- 6 Is "Academy Dinosaur" available for rent from Store 1?
SELECT * FROM sakila.film;
SELECT * FROM sakila.inventory;


select i.store_id, f.title
from film as f
join inventory as i
on f.film_id= i.film_id
WHERE f.title LIKE "Academy Dinosaur" AND i.store_id = 1;




-- 7 Get all pairs of actors that worked together. check out from each movies which actors are in avery movies. See which pair of actors worked together in the same film
-- 8 Get all pairs of customers that have rented the same film more than 3 times.
-- 9 For each film, list actor that has acted in more films. in how many movies appears each actors, then for each film check actors appears in film and  

