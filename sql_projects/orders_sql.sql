CREATE TABLE Customers1 ( customer_id INT PRIMARY KEY,
customer_name VARCHAR(50), city VARCHAR(30) );

CREATE TABLE Orders ( order_id INT PRIMARY KEY, 
customer_id INT, 
amount DECIMAL(10,2), 
order_date DATE, 
FOREIGN KEY(customer_id) REFERENCES Customers1(customer_id) );

#inserting values into customers1
INSERT INTO Customers1(customer_id, customer_name, city)
VALUES
(1, 'Ankitha', 'Hyderabad'),
(2, 'Rahul', 'Chennai'),
(3, 'Anjali', 'Bangalore'),
(4, 'Naveen', 'Hyderabad'),
(5, 'Suresh', 'Mumbai'),
(6, 'Priya', 'Delhi'),
(7, 'Kiran', 'Chennai'),
(8, 'Sneha', 'Pune'),
(9, 'Arjun', 'Hyderabad'),
(10, 'Divya', 'Mumbai'),
(11, 'Vikram', 'Bangalore'),
(12, 'Meena', 'Delhi'),
(13, 'Ravi', 'Pune'),
(14, 'Pooja', 'Chennai'),
(15, 'Sanjay', 'Hyderabad');

#inserting values into orders
INSERT INTO Orders (order_id, customer_id, amount, order_date)
VALUES
(101, 1, 2500.00, '2026-01-05'),
(102, 2, 1800.50, '2026-01-10'),
(103, 3, 4500.00, '2026-01-15'),
(104, 1, 3200.00, '2026-02-01'),
(105, 4, 1500.00, '2026-02-05'),
(106, 5, 5200.75, '2026-02-12'),
(107, 6, 2800.00, '2026-02-18'),
(108, 7, 3600.00, '2026-03-02'),
(109, 8, 1200.00, '2026-03-08'),
(110, 9, 6000.00, '2026-03-12'),
(111, 10, 2100.50, '2026-03-20'),
(112, 11, 4800.00, '2026-04-01'),
(113, 12, 1750.00, '2026-04-05'),
(114, 13, 3900.00, '2026-04-10'),
(115, 15, 7200.00, '2026-04-15');

#16. Find the total order amount for each customer.
select c.customer_id,c.customer_name,sum(o.amount)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

#17. Find customers who have placed more than 3 orders.
select c.customer_id,c.customer_name,count(o.order_id)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name
having count(o.order_id)>3;

#18. Find the average order amount for each customer.
select c.customer_id,c.customer_name,round(avg(o.amount),2)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

#19. Find the highest order amount placed by each customer.
select c.customer_id,c.customer_name,max(o.amount)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

#20. Display customers sorted by their total purchase amount.
select c.customer_id,c.customer_name,sum(o.amount)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name
order by sum(o.amount) desc;

#21. Find customers whose total purchase amount exceeds 10,000.
select c.customer_id,c.customer_name,sum(o.amount)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name
having sum(o.amount)>10000;

#22. Display customer names along with the total number of orders placed.
select c.customer_id,c.customer_name,count(o.order_id)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

#23. Find the customer who spent the highest amount.
SELECT c.customer_id, c.customer_name, SUM(o.amount) AS total_spent
FROM Customers1 c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

#24. Find the customer who placed the maximum number of orders.
select c.customer_id,c.customer_name,count(o.order_id) as count
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name
order by count desc
limit 1;

#25. Find customers whose average order amount is greater than 2,000.
select c.customer_id,c.customer_name,round(avg(o.amount),2)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name
having round(avg(o.amount),2)>20000;

#26. Display the top 5 customers based on total purchase amount
select c.customer_id,c.customer_name,sum(amount) as count
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name
order by sum(amount) desc
limit 5;

#27. Find the minimum order amount for each customer.
select c.customer_id,c.customer_name,min(o.amount)
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

#28. Find customers who have placed orders worth more than 5,000 in total.
select c.customer_id,c.customer_name,sum(o.amount) as count
from Customers1 c
join  Orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name
having sum(o.amount)>5000;

#29. Display customer-wise total orders and total purchase amount.
SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_purchase_amount
FROM Customers1 c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

#30. Find customers who placed more than 2 orders and spent more than 8,000.
SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_purchase_amount
FROM Customers1 c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
having total_orders>2 and total_purchase_amount>8000;
