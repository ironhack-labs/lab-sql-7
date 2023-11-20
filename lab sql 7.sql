select * 
from sakila.actor;

select last_name
from sakila.actor
group by last_name
having count (last_name) = 1;

select first_name, last_name
from sakila.actor
group by last_name
having count(last_name) > 1;

select staff_id, count(staff_id) as rentals
from sakila.rental
group by staff_id
order by staff_id;

select release_year, count(*) as films
from sakila.film
group by release_year
order by films;

select rating, round(avg(length),2) as avg_length
from sakila.film
group by rating;

select rating, round(avg(length),2) as avg_length
from sakila.film
group by rating
having avg(length) > 120

