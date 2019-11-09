/*Show all cars that were rented with all date about the booking and customer */
SELECT * FROM `car`,`booking`,`customer` 
WHERE car.car_id = booking.fk_car_id 
AND booking.fk_customer_id = customer.customer_id;



/*Show all date about the booking that happened on the specific date */
SELECT * FROM `car`,`booking`,`customer` 
WHERE car.car_id = booking.fk_car_id 
AND booking.fk_customer_id = customer.customer_id 
AND booking.booking_date = '2019-10-23';



/*Show all date about the booking that happened on the specific date and by the specific first name of the customer */
SELECT * FROM `car`,`booking`,`customer` 
WHERE car.car_id = booking.fk_car_id 
AND booking.fk_customer_id = customer.customer_id 
AND booking.booking_date = '2019-10-23' 
AND customer.first_name = 'Jane';




/*Show all date about the booking that happened on the specific date and by the specific first name 
and last name of the customer */
SELECT * FROM `car`,`booking`,`customer` 
WHERE car.car_id = booking.fk_car_id 
AND booking.fk_customer_id = customer.customer_id 
AND booking.booking_date = '2019-10-23' 
AND customer.first_name = 'Jane'
AND customer.last_name = 'Doe';


/* INNER JOIN - RETURNS RECORDS THAT HAVE MATCHING VALUES IN BOTH TABLES */
SELECT * FROM booking 
INNER JOIN car ON booking.fk_car_id=car.car_id;


/* LEFT JOIN - Returns all records from the left table, and the matched records from the right table */
SELECT * FROM booking 
LEFT JOIN car ON booking.fk_car_id=car.car_id;


/* TWO LEFT JOINs in one query  */
SELECT * FROM booking 
LEFT JOIN car ON booking.fk_car_id=car.car_id 
LEFT JOIN customer ON booking.fk_customer_id=customer.customer_id;


/* RIGHT JOIN - Returns all records from the right table, and the matched records from the left table */
SELECT * FROM booking 
RIGHT JOIN car ON booking.fk_car_id=car.car_id;






