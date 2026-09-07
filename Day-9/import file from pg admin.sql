CREATE DATABASE Sanyma_analysis;

-- create movies table
DROP TABLE if exists movies;
CREATE TABLE movies(
movie_id int primary key,
title	varchar(120) not null ,
genre varchar(120) not null,
duration_min int,
language varchar(120) not null
);

-- create threater table
CREATE TABLE theatre(
theatre_id int primary key,
name varchar(120) not null,
location varchar(50) not null
);

-- create  table
DROP TABLE IF EXISTs screens;
CREATE TABLE screens(
screen_id int primary key,
theatre_id int not null,
capacity int not null
);


-- create shows table
CREATE TABLE shows(
show_id int primary key,
movie_id int,
screen_id int,
show_date date,
show_time  time
);

-- create customer table
CREATE TABLE customer(
customer_id int primary key,
name varchar(120),
email varchar(120),
phone VARCHAR(20)
);

-- create booking table
CREATE TABLE bookings(
booking int primary key,
customer_id int,
show_id int,
seats_booked int,
amount int,
booking_date date
);

-- call movies table
SELECT * FROM movies;
-- call theatres table
SELECT * FROM theatre;
-- call screen table
SELECT * FROM screens;
-- call  show table
SELECT * FROM shows;
-- calL customer table
SELECT * FROM customer;
-- call  booking table
SELECT * FROM bookings;
-- BASIC QUERIES

--  sab action genre ki moves dikhao
SELECT title, genre FROM movies
WHERE genre = 'Action';

-- duration 150 minutes se zyada wali movies
SELECT title, duration_min FROM movies
WHERE duration_min > 150;

-- karachi mein located theatres dikhao
SELECT name,location FROM theatre
WHERE location = 'Karachi';

-- customers jinke naaam mein "Butt" ho
SELECT name FROM customer where name  LIKE  '%Butt%';

-- sab booking jo rs 3000 se zyada ki hain, amount ke hisaab se descending sort
SELECT booking, amount FROM bookings
WHERE amount > 3000 
ORDER BY amount DESC;
-- JOIN QUERIES
-- har booking ke saath customer ka naam or movies ka title dakho 
SELECT b.booking as booking_id ,
		c.name as customer_name,
		m.title as move_title
FROM bookings b
inner join customer c
on c.customer_id= b.customer_id
inner join shows s
on s.show_id = b.show_id
inner join movies m
on m.movie_id = s.movie_id;

-- har show ka date, time, movie name or theatre location ek saath
SELECT s.show_date ,s.show_time,m.title as move_name,t.location as threatre_location
FROM shows s
inner join movies m
on s.movie_id = m.movie_id
inner join screens
on screens.screen_id = s.screen_id
inner join theatre t
on screens.theatre_id = t.theatre_id;

-- un customers ki list jin hone kabhi booking nahi ki
SELECT c.customer_id, c.name
FROM customer c
LEFT JOIN bookings b
    ON c.customer_id = b.customer_id
WHERE b.customer_id IS NULL;
-- AGGREGATION
--har movie ki total revenue
SELECT m.title as move_name,
		sum(b.amount) as total_revenue
FROM bookings b
inner join shows s
on b.show_id = s.show_id
inner join movies m
on m.movie_id = s.movie_id
group by m.title;
-- har theatre ka total revenue
SELECT t.name, t.location, SUM(b.amount) AS total_revenue
FROM bookings b
INNER JOIN shows s
    ON s.show_id = b.show_id
INNER JOIN screens
    ON screens.screen_id = s.screen_id
INNER JOIN theatre t
    ON t.theatre_id = screens.theatre_id
GROUP BY t.name, t.location;
-- sabse zyada seats book karne wale top 5 customers
SELECT c.name,
       SUM(b.seats_booked) AS total_booked_seats
FROM bookings b
INNER JOIN customer c
    ON b.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_booked_seats DESC
LIMIT 5;
-- genre _wise total movies count
SELECT genre,count(title) as total_movies
FROM movies
group by genre;

-- har din ki total sale
SELECT s.show_date , sum(b.amount) as total_sales
FROM bookings b
inner join shows s
on s.show_id = b.show_id
group by s.show_date;
-- sirf un movies ko dikhao jin ki revenue 5000 se zyada hai
SELECT m.title,sum(b.amount) as total_revenue
FROM bookings b
inner join shows s 
on s.show_id = b.show_id
inner join movies m
on m.movie_id = s.movie_id
group by m.title
HAVING sum(b.amount) > 5000;
-- average seats per booking
SELECT  AVG(seats_booked) as average_booked_seat
FROM bookings;
-- har movie ka average seats per booking
SELECT m.title, AVG(b.seats_booked) AS avg_seats
FROM bookings b
INNER JOIN shows s ON b.show_id = s.show_id
INNER JOIN movies m ON m.movie_id = s.movie_id
GROUP BY m.title;

-- SUBQUERIES
-- sabse zyada revenue wali movie ka naam
SELECT title FROM movies
WHERE movie_id = (
    SELECT s.movie_id
    FROM bookings b
    inner JOIN shows s ON b.show_id = s.show_id
    GROUP BY s.movie_id
    ORDER BY SUM(b.amount) DESC
    LIMIT 1
);
-- average customer spending se zyada spend karne wale customers
SELECT c.name,
       SUM(b.amount) AS total_spent
FROM bookings b
INNER JOIN customer c
    ON c.customer_id = b.customer_id
GROUP BY c.name
HAVING SUM(b.amount) > (
    SELECT AVG(total_spent)
    FROM (
        SELECT SUM(amount) AS total_spent
        FROM bookings
        GROUP BY customer_id
    ) x
);
-- sabse mehngi single booking kis customer ne ki
SELECT c.name, b.amount
FROM bookings b
INNER JOIN customer c
    ON c.customer_id = b.customer_id
ORDER BY b.amount DESC
LIMIT 1;
-- ADVANCED(VIEW,WINDOW FUNCTION)
-- make a view move name plus revenue
CREATE VIEW move_name AS
SELECT m.title,sum(b.amount) AS revenue
FROM bookings b
	inner join shows s
		ON s.show_id = b.show_id
	INNER JOIN movies m
		ON m.movie_id = s.movie_id
	GROUP by m.title;
SELECT * FROM move_name;

-- rank() window function har movie ko revenue ke hisaab se rank do
SELECT  m.title,sum(b.amount)AS total_revenue,
	RANK()  OVER(
		order by sum(b.amount) DESC
	) AS rank
FROM bookings b
	inner join shows s
		ON s.show_id = b.show_id
	INNER JOIN movies m
		ON m.movie_id = s.movie_id;
-- runnin total date wise cumulaative revenue(sum(,over))
SELECT booking_date,
	sum(daily_revenue) OVER(
		ORDER BY booking_date ) AS running_total
	FROM (
		SELECT booking_date,
		SUM(amount) AS daily_revenue
	FROM bookings
	GROUP BY booking_date

-- har theatre mein top 3 highest revenue wali movies 
SELECT theatre_name,total_revenue FROM
	( 
	SELECT t.name AS theatre_name, sum(b.amount) AS total_revenue,
	RANK() OVER (
            PARTITION BY t.name
            ORDER BY SUM(b.amount) DESC
        ) AS revenue_rank
FROM booking b
	inner join 
	shows s
		on s.show_id = b.show_id
	INNER JOIN
	screen sc
		on sc.screen_id = s.screen_id
	inner join
	theatres t
		on t.theatre_id = sc.theatre_id
GROUP BY
        t.name
) AS highest_revenue 
	
WHERE revenue_rank <= 3;
