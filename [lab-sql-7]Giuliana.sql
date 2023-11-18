-- Which last names appear more than once? 
select last_name, count(*) as name_count
from sakila.actor
group by last_name
having name_count > 1;

-- Using the rental table, find out how many rentals were processed by each employee.
select staff_id as employee, count(rental_id) as rentals_processed
from sakila.rental
group by staff_id;

-- Using the film table, find out how many films were released each year.
select release_year, count(film_id) as films_released 
from sakila.film
group by release_year;

-- Using the film table, find out for each rating how many films were there.
select rating, count(film_id) as amount_films
from sakila.film
group by rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select * from sakila.film;
select rating,  round(avg(length), 2) as avg_lenght
from sakila.film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
select * from sakila.film;
select rating,  round(avg(length), 2) as avg_lenght
from sakila.film
group by rating
having avg_lenght > 120;
