-- EASY way to import data from csv file 
DROP TABLE IF EXISTS bookings;
-- import data from pgadmin
CREATE TABLE bookings (
	-- booking int,
    customer_id INT,
    show_id INT,
    seats_booked INT,
    amount INT,
    booking_date DATE
);

SELECT * FROM bookings;
