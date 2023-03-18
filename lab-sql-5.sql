use sakila;

-- 1

select last_name from actor
	group by 1
    having count(*) = 1;

-- 2

select last_name from actor
	group by 1
    having count(*) > 1;

-- 3

select staff_id, count(*) as processed_rentals from rental
	group by staff_id;
    
-- 4

select release_year, count(*) from film
	group by release_year;
    
-- 5

select rating, count(*) from film
	group by rating;
    
-- 6

select rating, round(avg(length), 2) from film
	group by rating;
    
-- 7

select rating, round(avg(length), 2) as avg_length from film
	group by rating
    having avg_length > 120;