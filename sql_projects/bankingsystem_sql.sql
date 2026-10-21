use assignments;

#creating customers table
CREATE TABLE customers ( customer_id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), city VARCHAR(50) );

#creating ccounts table
CREATE TABLE accounts ( account_id INT PRIMARY KEY AUTO_INCREMENT, customer_id INT, account_type VARCHAR(20), balance DECIMAL(10,2), FOREIGN KEY (customer_id) REFERENCES customers(customer_id) );

#inserting data into customers
insert into customers(name,city) values('ankitha','hyderabad'),
('harish','mumbai'),('komali','chennai'),('harsha','bangalore'),('jabili','chennai'),('varshini','vizag'),
('sindhu','chennai'),('girish','coimbatore'),('manish','mumbai'),('varsha','hyderabad'),('karthik','madhurai'),
('jithesh','selam'),('grishma','coimbatore'),('tejashwini','selam'),('meenakshi','madhurai'),('apoorva','chennai'),
('chandhana','selam'),('srija','bangalore'),('parimala','coimbatore'),('jathin','hyderabad'),('jhansi','vizag'),
('preethi','mysore'),('priyanka','mumbai'),('deekshitha','mumbai'),('pranathi','mysore'),('lokesh','bangalore'),
('vishal','madhurai');

#inserting data into accounts
insert into accounts(customer_id,account_type,balance) values(1,'savings',30000),
(1,'current',25000),(2,'savings',10000),(3,'current',16000),(4,'current',40000),(4,'savings',35000),
(5,'savings',50000),(6,'savings',20000),(6,'current',23000),(7,'savings',7000),(8,'current',60000),
(9,'savings',40000),(10,'current',55000),(11,'savings',45000),(12,'current',50000),(13,'savings',70000),
(14,'current',40000),(15,'savings',45000),(16,'savings',65000),(17,'current',30000),(17,'savings',40000),
(18,'current',35000),(18,'savings',40000),(19,'savings',60000),(20,'current',20000),(21,'current',15000),
(22,'current',18000),(23,'savings',25000),(24,'current',22000),(25,'savings',30000),(25,'current',33000),
(26,'current',40000),(27,'savings',50000);

#basic+where+operators
#1. Retrieve all accounts with balance greater than 20,000.
select *from accounts where balance>20000;

#2. Find customers who live in Chennai.
select *from customers where city='chennai';

#3. Display accounts with balance between 20,000 and 50,000.
select *from accounts where balance between 20000 and 50000;

#4. Find customers whose names start with 'J'.
select *from customers where name like 'j%';

#5. Retrieve accounts of type 'Savings' or 'Current'.
select *from accounts where account_type in('savings','current');

#6. Display accounts that are not 'Savings'.
select *from accounts where not account_type='savings';

#7. Find customers whose names contain the letter 'a'.
select *from customers where name like '%a%';

#8. Retrieve accounts with balance less than or equal to 30,000.
select *from accounts where balance<=30000;

#9. Find customers who are not from Madurai.
select *from customers where city='madhurai';

#10. Display accounts where balance is not between 10,000 and 40,000.
select *from accounts where balance between 10000 and 40000;

#11. Retrieve customers whose names end with 'i'.
select *from customers where name like '%i';

#12. Find accounts with balance equal to 50,000.
select *from accounts where balance=50000;

#13. Display customers whose city is either Chennai or Salem.
select *from customers where city in('chennai','selam');

#14. Find accounts with balance greater than 10,000 and less than 40,000.
select *from accounts where balance between 10000 and 40000;

#15. Retrieve accounts where account type is not in ('Current').
select * from accounts where not account_type='current';

#order by

#16. Display all accounts sorted by balance in descending order.
select *from accounts order by balance desc;

#17. List customers sorted alphabetically by name.
select name from customers order by name;

#18. Display accounts sorted by account type and then by balance (descending).
select *from accounts order by account_type asc,balance desc;

#aggregate functions

#19. Find the total balance of all accounts.
select sum(balance) as total_balance from accounts;
 
#20. Calculate the average balance of accounts.
select round(avg(balance),2) as average_balance from accounts;

#21. Find the maximum account balance.
select max(balance) as maximum_balance from accounts;

#22. Find the minimum account balance.
select min(balance) as minimum_balance from accounts;

#23. Count the total number of customers.
select count(customer_id) as customers_count from customers;

#group by+having

#24. Find total balance grouped by account type.
select account_type,sum(balance) as balance_sum 
from accounts group by account_type;

#25. Find average balance for each account type.
select account_type,round(avg(balance),2) as average_balance
from accounts group by account_type;

#26. Display account types having average balance greater than 20,000.
select account_type,round(avg(balance),2) as average_balance
from accounts group by account_type
having round(avg(balance),2)>20000;

#27. Count number of accounts for each customer.
select customer_id,count(customer_id) as count
from accounts
group by customer_id;

#28. Display customers having more than one account.
select customer_id,count(customer_id) as count
from accounts
group by customer_id
having count(customer_id)>1
order by customer_id;

#JOINS

#29. Retrieve customer names along with their account balances.
select c.customer_id,c.name,sum(a.balance) as total_balance
from customers c
join accounts a
on c.customer_id=a.customer_id
group by c.customer_id,c.name;
 
#30. Display all customers and their accounts (including customers without accounts).
select c.customer_id,c.name,a.account_type,a.balance,c.city
from customers c join accounts a
on c.customer_id=a.customer_id;

#31. Display all accounts and corresponding customer details.
select c.name,a.account_type
from customers c join accounts a
on c.customer_id=a.customer_id;

#32. Retrieve customer names and account types where balance is greater than 20,000.
select c.name,a.account_type
from customers c
join accounts a
on c.customer_id=a.customer_id
where a.balance>20000;

#33. List customers with their total balance using JOIN.
select c.customer_id,c.name,a.balance
from customers c
join accounts a
on c.customer_id=a.customer_id;

#34. Display customer names and balances sorted by balance.
select c.customer_id,c.name,a.balance
from customers c
join accounts a
on c.customer_id=a.customer_id
order by a.balance desc;

#35. Count number of accounts for each city using JOIN.
select c.city,count(a.account_id) as count
from customers c
join accounts a
on c.customer_id=a.customer_id
group by c.city;

#SUBQUERIES

#36. Find accounts with balance greater than average balance.
select *from accounts where balance>(select avg(balance) from accounts);

#37. Retrieve customers who have accounts.
SELECT DISTINCT c.name
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id;

#38. Find customers who do not have any accounts.
SELECT c.name
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id
where a.account_id is null;

#39. Display account(s) with the maximum balance.
select *from accounts
where balance=(select max(balance) from accounts);

#40. Find customers whose total balance is greater than 40,000.
select c.customer_id,c.name,sum(a.balance) as total_balance
from customers c
join accounts a
on c.customer_id=a.customer_id
group by c.customer_id,c.name
having sum(a.balance)>40000;



#creating trains table
