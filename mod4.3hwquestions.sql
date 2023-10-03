-- CT Module 4 SQL day 3 HW
/* 1. List all customers who live in Texas (use
JOINs) */
select customer.first_name, customer.last_name, city
from customer
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
where city = 'Texas';


/* 2. Get all payments above $6.99 with the Customer's Full
Name*/

select customer.first_name, customer.last_name, amount
from customer
full join payment  
on customer.customer_id = payment.customer_id
where amount > 6.99;

/* 3. Show all customers names who have made payments over $175(use
subqueries) */

select * 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	where amount > 175
	group by customer_id 
	);

/* 4. List all customers that live in Nepal (use the city
table) */
select customer.first_name, customer.last_name, city
from customer
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
where city = 'Nepal';

/* 5. Which staff member had the most
transactions? */ *

select payment.staff_id, count(payment.amount)
from payment
full join staff  
on staff.staff_id  = payment.staff_id
group by payment.staff_id;
-- Jon had the most

/* 6. How many movies of each rating are
there?*/

select count(film.title), film.rating 
from film 
group by film.rating;


/*7.Show all customers who have made a single payment
above $6.99 (Use Subqueries)*/ 
select *
from customer 
where customer_id in (
	select customer_id amount
	from payment 
	where amount >= 6.99
	group by customer_id 
);


--/* How many free rentals did our stores give away*/ *
select * 
from payment 
where amount in (
	select customer_id  
	from customer 
	group by customer_id 
	having amount <= 0
);