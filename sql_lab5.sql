
-- 1

select last_name, count(*) as count
from sakila.actor
group by last_name
having count = 1
order by last_name;

-- 2

select last_name, count(*) as count
from sakila.actor
group by last_name
having count > 1
order by count asc, last_name;

-- 3

select staff_id, count(*) as rental_by_emp
from sakila.rental
group by staff_id;

-- 4

select release_year, count(*) as release_year
from sakila.film
group by release_year;

-- 5

select rating, count(*) as film_count
from sakila.film
group by rating
order by film_count asc;

-- 6

select rating, round(avg(length), 2) as mean_length
FROM sakila.film
group by rating;

-- 7

select rating, avg(length) as avg_duration
from sakila.film
group by rating
having avg (length) > 120
