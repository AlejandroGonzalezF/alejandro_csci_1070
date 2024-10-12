select first_name,
last_name
FROM customer
where last_name like 'T%'
order by first_name

select*
from rental
where return_date BETWEEN '2005-05-28' AND '2005-06-01'
order by return_date


select film.title,
count (rental.rental_id) as m_count --creating a column to show the numbers as well
from rental
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
group by film.title
order by m_count DESC --DESC to show in descending order
limit 10 --to show ONLY top 10


select first_name, last_name, 
sum(payment.amount) as customer_spent
from payment
join rental on payment.rental_id = rental.rental_id
join customer on rental.customer_id = customer.customer_id
group by first_name, last_name
order by customer_spent asc


select actor.first_name || ' ' || actor.last_name as actorname, count (film_actor.film_id) as most_movie
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where release_year = 2006
group by actorname
order by most_movie desc


EXPLAIN select first_name, last_name, 
sum(payment.amount) as customer_spent
from payment
join rental on payment.rental_id = rental.rental_id
join customer on rental.customer_id = customer.customer_id
group by first_name, last_name
order by customer_spent asc
--EXPLANATION: First, the query sorts by the payment table, which finds all the payments made
-- Then joins with the rental table and the customer table, and scans to find the customer with the
-- most payments made.


explain select actor.first_name || ' ' || actor.last_name as actorname, 
count (film_actor.film_id) as most_movie
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where release_year = 2006
group by actorname
order by most_movie desc
-- EXPLANATION: On select, the query combines actor first names and last names together,
-- then joins the actor and film tables together to get the release_year,
-- finally, it groups the actor names with the number of films they appeared in 2006.
-- It's ordered from least to most.


select category.name, avg(film.rental_rate) as ave_rental_ratefrom film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
group by category.name


select category.name, 
count(rental.rental_id) as rental_number, 
sum(payment.amount) as all_sales
from rental
join inventory on rental.inventory_id = inventory.inventory_id
join film_category on inventory.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
join payment on rental.rental_id = payment.rental_id
group by category.name
order by rental_number desc
limit 5