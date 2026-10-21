#creating trains table
CREATE TABLE trains (train_id INT PRIMARY KEY AUTO_INCREMENT,
train_name VARCHAR(50), 
source VARCHAR(50), 
destination VARCHAR(50));

#creating bookings table
CREATE TABLE bookings ( booking_id INT PRIMARY KEY AUTO_INCREMENT, 
train_id INT, passenger_name VARCHAR(50), 
fare DECIMAL(10,2), status VARCHAR(20), 
FOREIGN KEY (train_id) REFERENCES trains(train_id) );

#inserting data into trains table
INSERT INTO trains (train_name, source, destination) VALUES ('Express1','Chennai','Madurai'), 
('Express2','Coimbatore','Salem'), 
('Express3','Madurai','Chennai'),
('Express4','Bangalore','Mysore'),
('Express5','Hyderabad','Nizamabad');

#inserting data into bookings table
INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES (1,'Janani',500,'Confirmed'), 
(1,'Ankitha',500,'Waiting'), 
(2,'Priya',300,'Confirmed'), 
(3,'Karthik',450,'Cancelled'), 
(2,'Meena',300,'Confirmed'),
(4,'Krishna',600,'Confirmed'),
(4,'Vinesh',600,'Confirmed'),
(5,'Tarun',550,'Waiting'),
(5,'Harika',550,'Confirmed'),
(5,'Vyshali',550,'Cancelled'),
(3,'naveen',450,'Confirmed');

#Basic+where+Operators

#retrieving data all records from trains table
select *from trains;

#retrieving data all records from trains table
select *from bookings;

#Basic + WHERE + Operators

#41. Retrieve all bookings with fare greater than 400.
select *from bookings
where fare>400;

#42. Find bookings where status is not 'Confirmed'.
select *from bookings 
where not status='Confirmed';

#43. Display trains starting from Chennai.
select *from trains
where source='Chennai';

#44. Retrieve bookings with fare between 300 and 500.
select *from bookings
where fare between 300 and 500;

#45. Find passengers whose names start with 'A'.
select passenger_name
from bookings where passenger_name like 'A%';

#Joins+group by+order by

#46. Retrieve train names along with passenger names.
select t.train_name,t.source,t.destination,
b.passenger_name,b.fare
from trains t
join bookings b 
on t.train_id=b.train_id;

#47. Count number of bookings for each train.
select t.train_id,t.train_name,count(b.booking_id) as booking_count
from trains t
join bookings b
on t.train_id=b.train_id
group by t.train_id,t.train_name;

#48. Display train names and total fare collected for each train.
select t.train_id,t.train_name,sum(b.fare) as total_fare
from trains t
join bookings b
on t.train_id=b.train_id
group by t.train_id,t.train_name;

#subqueries

#49. Find bookings with fare equal to the highest fare.
select *from bookings
where fare=(select max(fare) from bookings);

#50. Retrieve trains that have more than one booking.
select t.train_id,t.train_name,count(b.booking_id)
from trains t
join bookings b
on t.train_id=b.train_id
group by t.train_id,t.train_name
having count(b.booking_id)>1;
