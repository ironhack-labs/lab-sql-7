#actors whose last names are not repeated
select concat(first_name," ",last_name) as actor_name
from (
    select first_name, last_name, count(last_name) over (partition by last_name) as count_last_name
    from sakila.actor
) as subquery1
where count_last_name = 1;

#actors whose last names appear more than once
select concat(first_name," ",last_name) as actor_name
from (
    select first_name, last_name, count(last_name) over (partition by last_name) as count_last_name
    from sakila.actor
) as subquery1
where count_last_name > 1;

select staff_id, count(distinct rental_id) as nr_rentals_by_employee from sakila.rental group by staff_id;
select release_year, count(distinct film_id) as nr_films_by_year from sakila.film group by release_year;
select rating, count(distinct film_id) as nr_films_by_rating from sakila.film group by rating;

select rating, round(avg(length),2) as avg_time_min, 
concat(round(avg(length),2) div 60," hour and ", round(avg(length)) mod 60, " minutes") as avg_time_hours
from sakila.film group by rating;

select rating, round(avg(length),2) as avg_lenght_by_rating from sakila.film group by rating 
having avg_lenght_by_rating > 120;
