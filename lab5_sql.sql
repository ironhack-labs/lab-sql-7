-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT first_name,last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) = 1
ORDER BY COUNT(last_name) ASC;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT last_name, Count(last_name)
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY COUNT(last_name) ASC;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, count(rental_id)
FROM sakila.rental
GROUP BY stafF_id;

-- Using the film table, find out how many films were released each year.
SELECT count(film_id), release_year
FROM sakila.film
GROUP BY release_year;

-- Using the film table, find out for each rating how many films were there.
SELECT rating, count(film_id) as count_film_ratings
FROM sakila.film
GROUP BY rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, avg(length) as mean_length
FROM sakila.film
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, avg(length) as mean_length
FROM sakila.film
GROUP BY rating
HAVING avg(length) > 120
ORDER BY 2 ASC;


