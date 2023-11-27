-- 1. In the table actor, which are the actors whose last names are not repeated? 
SELECT
  last_name,
  COUNT(last_name) AS count_last
FROM
  sakila.actor
GROUP BY
  last_name
HAVING
  count_last = 1;

-- 2. Which last names appear more than once? 
SELECT
  last_name,
  COUNT(last_name) AS count_last
FROM
  sakila.actor
GROUP BY
  last_name
HAVING
  count_last > 1
ORDER BY
  2 DESC;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT
  COUNT(rental_id) AS n_rentals,
  staff_id AS employee
FROM
  sakila.rental
GROUP BY
  staff_id
ORDER BY
  2 DESC;

-- 4. Using the film table, find out how many films were released each year.
SELECT
  COUNT(film_id) AS n_films,
  release_year AS year
FROM
  sakila.film
GROUP BY
  release_year;

-- 5. Using the film table, find out for each rating how many films were there.
SELECT
  COUNT(film_id) AS n_films,
  rating
FROM
  sakila.film
GROUP BY
  rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT
  rating,
  ROUND(AVG(length), 2) AS avg_len
FROM
  sakila.film
GROUP BY
  rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT
  rating,
  ROUND(AVG(length), 2) AS avg_len
FROM
  sakila.film
GROUP BY
  rating
HAVING
  avg_len >= 120;
