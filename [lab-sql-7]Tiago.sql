-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

select actor.last_name, count(actor.last_name) as names_that_appear_once
from sakila.actor
group by actor.last_name
having count(actor.last_name) = 1 
;


 
-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this 
-- time we want to include the last names of the actors where the last name was present more than once
select actor.last_name, count(actor.last_name) as names_that_appear_more_than_once
from sakila.actor
group by actor.last_name
having count(actor.last_name) in (2,3) 
;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
select staff_id, count(*) as nr_processed_by_employee
from sakila.rental
group by staff_id
;



-- 4. Using the film table, find out how many films were released each year.
select  release_year ,count(film.release_year) 
from sakila.film
group by film.release_year
;

-- 5. Using the film table, find out for each rating how many films were there.
select  film.rating ,count(film.rating)  as Qty
from sakila.film
group by film.rating
;


-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select  film.rating ,round(avg(film.length),2) as average_length
from sakila.film
group by film.rating
;


-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
select  film.rating ,round(avg(film.length),2) as average_length
from sakila.film
group by film.rating
having average_length > 120
;

