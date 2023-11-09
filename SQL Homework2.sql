--Question 1 List all customers who live in Texas
select customer.first_name, customer.last_name,district
from customer 
full join address 
on customer.address_id = address.address_id 
where district = 'Texas'
--Answer Jennifer Davis, Kim Cruz, Richard Mccrary, Brian Hardison and Ian Still

--Question 2 Get all payments above 6.99 with the customers full name
select first_name, last_name
from customer 
where customer_id in(
	select customer_id
	from payment 
	group by customer_id
	having sum(amount) > 6.99
	order by sum(amount) desc 
	)
GROUP by first_name, last_name;
--Answer is Peter Menard and Mary Smith

--Question 3 Show all customers names who have made payments over 175
select *
from customer 
where customer_id in(
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) >175
	order by sum(amount) desc );
--Answer is Peter Menard and Mary Smith

--Question 4 List all customers that live in Nepal
select customer.first_name, customer.last_name,address 
from customer 
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
where city = 'Nepal'
--Answer is there are no customers that live in Nepal

--Question 5 Which staff member has the most transactions
select *
from staff   
where staff_id in(
	select staff_id 
	from rental 
	group by staff_id 
	having count(customer_id) > 0
	order by count(staff_id) desc );
--Answer is Mike Hillyer

--Question 6 How many movies of each rating are there?
select distinct rating, COUNT(rating)
from film
group by rating
--Answer is G=178,PG=194,PG-13=224,R=196,NC-17=209

--Question 7 Show all the customers who have made a single payment above 6.99
select store_id, first_name, last_name
from customer 
where customer_id in(
	select customer_id
	from payment 
	group by customer_id
	having sum(amount) > 6.99
	order by sum(amount) desc 
	)
GROUP BY store_id, first_name, last_name;
--Answer is Mary Smith and Peter Menard

--Question 8 How many free rentals did our stores give away?
select * from film 
where rental_rate in (
	select rental_id 
	from payment 
	where amount = 0.00
	);
--Answer is zero free rentals. I am probably not looking in the correct table.















