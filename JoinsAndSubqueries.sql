--1. List all customers who live in Texas (use JOINs)

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id 
WHERE district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, amount 
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer.customer_id IN (
	SELECT customer_id 
	FROM payment
	WHERE amount > 175.00
);

--4. List all customers that live in Nepal (use the city table)

SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer 
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city 
ON address.city_id = city.city_id
FULL JOIN country 
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--5. Which staff member had the most transactions?

--SELECT staff_id, count(staff_id) AS count_staff_id
--FROM payment
--GROUP BY staff_id
--ORDER BY count(staff_id) desc

SELECT staff_id, first_name, last_name
FROM staff
WHERE staff.staff_id IN (
	SELECT staff_id
	FROM payment
	GROUP BY staff_id 
	ORDER BY count(staff_id) DESC
)


--6. How many movies of each rating are there?

SELECT rating, count(title) AS count_titles
FROM film
GROUP BY rating
ORDER BY count(title) desc

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
--SELECT customer_id, amount 
--FROM payment
--WHERE amount > 6.99

SELECT customer_id, first_name,last_name
FROM customer
WHERE customer.customer_id IN(
	SELECT customer_id 
	FROM payment 
	WHERE amount > 6.99
	GROUP BY customer_id 
)


--8. How many free rentals did our stores give away?
SELECT count(amount) AS count_free_rentals
FROM payment 
WHERE amount = 0.00



