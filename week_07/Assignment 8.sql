ALTER TABLE rental
add column status varchar(20);
update rental
set status = case
when rental_date > return_date then 'late'
when rental_date < return_date then 'early'
else 'on time'

select city, sum(payment.amount) as total_payment
from payment
join customer on payment.customer_id = customer.customer_id
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
where city.city in ('Kansas City', 'Saint Louis')
group by city.city

select category.name, count (film.film_id) as film_each
from category
join film_category on category.category_id = film_category.category_id
join film on film_category.film_id = film.film_id
group by category.name 

-- There are different tables for category and film_category 
-- because the category table has info about the each movie category and the 
-- film_category table joins the category and film tables, to prevent having the same
-- things multiple times.

select film.film_id, film.title, film.length
from rental
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
where rental.return_date BETWEEN '2005-05-15' and '2005-05-31'

select film_id, title, rental_rate
from film
where rental_rate < (SELECT AVG(rental_rate)from film)

select status, COUNT(*) as film_count
from rental
group by status

select film_id, title, film.length,
rank() over (order by film.length) as duration
from film

explain select film_id, title, film.length,
rank() over (order by film.length) as duration
from film

explain select category.name, count (film.film_id) as film_each
from category
join film_category on category.category_id = film_category.category_id
join film on film_category.film_id = film.film_id
group by category.name 

-- These two explain queries were very different, as the first one is all about sorting with
-- window function (specified in explain) and the second one is about joining tables by common
-- columns and groups by at the end.

-- A relationship that is wrong within the data model is the film and actor tables, as 
-- in reality, an actor may appear in multiple movies, so it's not a direct (1 to 1)
-- relationship.

-- SQL is set-based programming, while Python is procedural. 
-- Set-based allows for manipulation of entire data sets, while procedural programming
-- is about writing code executing in a step by step fashion.