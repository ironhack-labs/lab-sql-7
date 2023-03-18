SELECT DISTINCT
              last_name
FROM sakila.actor;

SELECT 
     COUNT(*) as count_last_names
FROM (
  SELECT SUBSTRING_INDEX(last_name, ' ', -1) AS last_name
  FROM sakila.actor
  GROUP BY last_name
  HAVING COUNT(*) > 1
) as duplicated_last_names;

SELECT 
      staff_id,
      COUNT(*) AS number_of_rentals
FROM sakila.rental
GROUP BY staff_id;

SELECT 
     release_year,
     COUNT(*) AS film_released_year
FROM sakila.film
GROUP BY release_year;

SELECT
	  rating,
      COUNT(*) AS number_of_films
FROM sakila.film
GROUP BY rating;

SELECT
      rating,
	  ROUND(AVG(length), 2) AS mean_length
FROM sakila.film
GROUP BY rating;

SELECT 
      rating, 
      ROUND(AVG(length),2) AS mean_length
FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;
	  
