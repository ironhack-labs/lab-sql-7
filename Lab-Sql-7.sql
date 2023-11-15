-- 1) Which are the actors whose last names are not repeated?
select min(first_name) as first_name, last_name
from sakila.actor
group by last_name
having count(*) = 1;

-- 2) Which last names appear more than once?
select last_name
from sakila.actor
group by last_name
having count(*) > 1;

-- 3) Finding out how many rentals were processed by each employee
select staff_id, count(*) as rentals_processed
from sakila.rental
group by staff_id;

-- 4) Finding out how many films were released each year
select release_year, count(*) as number_of_released_films
from sakila.film
group by release_year;

-- 5) Finding out for each rating how many films were there
select rating, count(*) as number_of_films
from sakila.film
group by rating;

-- 6) What is the mean length of the film for each rating type?
select rating, avg(length) as average_length
from sakila.film
group by rating;

-- 7) Which kind of movies (rating) have a mean duration of more than two hours?
select rating
from sakila.film
group by rating
having avg(length) > 120;