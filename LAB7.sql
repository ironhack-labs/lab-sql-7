use sakila;

# 1 - In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data 
#in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
#These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one 
#time with actor "Angelina Astaire", hence we would want this in our output list.

select LAST_NAME, count(*)
from ACTOR
group by LAST_NAME
HAVING COUNT(LAST_NAME) = 1
order by LAST_NAME asc;

# 2 - Which last names appear more than once? We would use the same logic as in the previous question but this time we want 
#to include the last names of the actors where the last name was present more than once

select LAST_NAME, count(*)
from ACTOR
group by LAST_NAME
HAVING COUNT(LAST_NAME) > 1
order by LAST_NAME asc;

# 3 - Using the rental table, find out how many rentals were processed by each employee.

select
    staff_id,
    count(*) as rentals
from RENTAL
group by staff_id
Order by rentals;


#4 - Using the film table, find out how many films were released each year.
select
    RELEASE_YEAR,
    count(*) as Number_of_films
from FILM
group by RELEASE_YEAR
Order by Number_of_films;

#5 - Using the film table, find out for each rating how many films were there.
select
    RATING,
    count(*) as Film_Rating
from FILM
group by RATING
Order by Film_rating;

#6 - What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select 
RATING,
round(avg(LENGTH),2) as avg_length
from FILM
group by RATING
order by RATING asc
;

#7 Which kind of movies (rating) have a mean duration of more than two hours?
select
RATING,
round(avg(LENGTH),2) as avg_length
from FILM
group by RATING
Having avg_length > 120
;
