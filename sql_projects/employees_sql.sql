#creating Employee table
CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(30),
salary DECIMAL(10,2),
city VARCHAR(30),
joining_date DATE);

#inserting data into Employee table
insert into Employee(emp_id,emp_name,department,salary,city,joining_date) values(1,'Ankitha','IT',40000,'Hyderabad','2026-08-17'),
(2,'Rahul','HR',50000,'Mumbai','2025-03-05'),
(3,'Sushma','Finance',35000,'Hyderabad','2025-11-15'),
(4,'Tarun','HR',45000,'Chennai','2025-05-05'),
(5,'Prathyusha','IT',55000,'Mumbai','2024-02-11'),
(6,'Eshwar','Finance',50000,'Bangalore','2024-06-18'),
(7,'Varun','IT',70000,'Chennai','2024-04-15'),
(8,'Srinivas','IT',80000,'Chennai','2023-07-09'),
(9,'Uma','HR',45000,'Mumbai','2025-09-17'),
(10,'Pranith','Finance',55000,'Bangalore','2026-08-17'),
(11,'Amrutha','Finance',40000,'Hyderabad','2026-05-11'),
(12,'Jhansi','HR',45000,'Hyderabad','2026-01-15'),
(13,'Meera','HR',30000,'Bangalore','2026-04-25'),
(14,'Sathvik','HR',50000,'Hyderabad','2024-07-09'),
(15,'Vanitha','Finance',38000,'Chennai','2025-09-05');

#retrieving all records from Employee table
select *from Employee;

#1. Find the total number of employees in each department.
select department,count(emp_id) as avg_salary from Employee
group by department;

#2. Find the average salary of employees in each department.
select department,round(avg(salary),2) as avg_salary from Employee
group by department;

#3. Display departments having more than one employee.
select department,count(emp_id) as avg_salary from Employee
group by department
having count(emp_id)>1;

#4. Find the highest salary in each department.
select department,max(salary) as avg_salary from Employee
group by department;

#5. Find the lowest salary in each department.
select department,min(salary) as avg_salary from Employee
group by department;

#6. Find departments whose average salary is greater than 50,000.
select department,round(avg(salary),2) as avg_salary from Employee
group by department
having round(avg(salary),2)>50000;

#7. Calculate the total salary expenditure for each department.
select department,sum(salary) as sum_salary from Employee
group by department;

#8. Display all employees sorted by salary in descending order.
select *from Employee
order by salary desc;

#9. Display employees sorted first by department and then by salary in descending order.
select *from Employee
order by department asc,salary desc;

#10. Find cities that have more than one employee.
select city,count(emp_id) as count
from Employee group by city
having count(emp_id)>1;

#11. Find the total salary paid in each city.
select city,sum(salary) as sum_salary
from Employee group by city;

#12. Display departments ordered by total salary expenditure from highest to lowest.
select department,sum(salary) as sum_salary from Employee
group by department order by sum(salary) desc;

#13. Find the number of employees in each department whose salary is greater than 50,000.
select department,count(emp_id) as count 
from Employee where salary>50000 
group by department;

#14. Find the difference between the highest and lowest salary in each department.
select department,max(salary)-min(salary) as difference
from Employee group by department;

#15. Display the top 3 highest-paid employees.
select * from Employee
order by salary desc
limit 3;
