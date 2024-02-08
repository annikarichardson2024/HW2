USE sakila;

#PART 1
SELECT first_name, last_name
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE film.title = 'ACADEMY DINOSAUR';

#PART 2
SELECT COUNT(category_id), name
FROM category
GROUP BY category_id;

# PART 3
SELECT rating, AVG(rental_duration)
FROM film
GROUP BY rating;

#PART 4
SELECT customer.first_name, customer.last_name, COUNT(customer.customer_id)
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id;

#PART 5
SELECT store.store_id, COUNT(rental_id)
FROM store
INNER JOIN customer
ON store.store_id = customer.store_id
INNER JOIN rental
ON customer.customer_id = rental.customer_id
GROUP BY store.store_id;

#PART 6
SELECT category.name, COUNT(rental.rental_id)
FROM category
INNER JOIN film_category
ON category.category_id = film_category.category_id
INNER JOIN rental
ON rental.last_update = film_category.last_update
GROUP BY category.name;

#PART 7
SELECT category.name, AVG(payment.amount)
FROM category
INNER JOIN payment
ON category.last_update = payment.last_update
GROUP BY category.name;

#PART 8
SELECT film.title, rental.rental_date
FROM film
INNER JOIN inventory
ON film.last_update = inventory.last_update
INNER JOIN rental
ON inventory.last_update = rental.last_update
WHERE rental.rental_date < '2005-05-27 12:01:01';

#PART 9
SELECT customer.first_name, customer.last_name, SUM(payment.amount)
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY payment.customer_id;

#PART 10
SELECT film.language_id, AVG(length)
FROM film
INNER JOIN language
ON language.language_id = film.language_id
GROUP BY film.language_id;



