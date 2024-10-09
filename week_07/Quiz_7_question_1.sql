--question 1
select *
from payment 
where amount >= 9.99

--question 2
select max(amount) 
from payment

select *
from film
where replacement_cost = 11.99

--question 3
select first_name, last_name, email, staff.address_id, city, country
from staff
join address on staff.address_id = address.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id

--question 4
-- I think I'd like to work in a cybersecurity company in the near future

--question 5
-- The crows foot notation is a way of express what two tables in a database have in common.
-- the country table contains information from the city table, according to this notation.


