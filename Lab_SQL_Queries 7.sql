-- In the table actor, which are the actors whose last names are not repeated?
-- 66 ACTOR got a last name count only 1 time
select *
from sakila.actor
WHERE last_name IN (
    SELECT last_name
    FROM sakila.actor
    GROUP BY last_name
    HAVING COUNT(*) = 1
);

select count(*) as Actor_count
from sakila.actor
WHERE last_name IN (
    SELECT last_name
    FROM sakila.actor
    GROUP BY last_name
    HAVING COUNT(*) = 1
);

-- Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to include the last names of the actors 
-- where the last name was present more than once
-- 134 actor got there family name existing more than 2 time in the Data Frame
select *
from sakila.actor
WHERE last_name IN (
    SELECT last_name
    FROM sakila.actor
    GROUP BY last_name
    HAVING COUNT(*) >= 2
);

-- Now lets count it

select count(*)
from sakila.actor
WHERE last_name IN (
    SELECT last_name
    FROM sakila.actor
    GROUP BY last_name
    HAVING COUNT(*) >= 2
);


-- Using the rental table, find out how many rentals were processed by each employee.

select *
from sakila.rental, staff;

-- first will grooupby jpoin by staff ID the both table 

select *
from sakila.staff, rental ;

SELECT s.staff_id, s.username
FROM sakila.staff s
LEFT JOIN sakila.rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.username;

-- Then we count the number of Row in rental_id 
SELECT s.staff_id, s.username, COUNT(r.rental_id) AS rental_count
FROM sakila.staff s
LEFT JOIN sakila.rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.username;

-- Using the film table, find out how many films were released each year.
-- select film table first 

select * 
from sakila.film;

-- We will count the number of different title after grouping by release year
-- There is 1000 film release in year 2006

SELECT f.release_year, COUNT(f.title) AS film_count
FROM sakila.film f
GROUP BY f.release_year;

-- Using the film table, find out for each rating how many films were there.
-- will group by rating , and count number of movies 
-- result
-- PG 194
-- G	178
-- NC-17	210
-- PG	194
-- PG-13	223
-- R	195


SELECT f.rating, COUNT(f.title) AS film_count
FROM sakila.film f
GROUP BY f.rating;


-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT f.rating, round(avg(f.length),2) AS film_Len
FROM sakila.film f
GROUP BY f.rating;

-- result
-- PG	112.01
-- G	111.05
-- NC-17	113.23
-- PG-13	120.44
-- R	118.66

-- Which kind of movies (rating) have a mean duration of more than two hours?
-- the only rating with a mean duration of more than 2 hours is PG 13
SELECT f.rating, round(avg(f.length),2) AS film_Len
FROM sakila.film f
GROUP BY f.rating
having round(avg(f.length),2) >= 120
;


