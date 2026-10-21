#creating students table
CREATE TABLE Students (student_id INT PRIMARY KEY, 
student_name VARCHAR(50), 
department VARCHAR(30), marks INT );

#inserting records into students table
INSERT INTO Students (student_id, student_name, department, marks)
VALUES
(1, 'Ankitha', 'CSE', 85),
(2, 'Rahul', 'ECE', 72),
(3, 'Anjali', 'CSE', 91),
(4, 'Naveen', 'IT', 68),
(5, 'Priya', 'ECE', 88),
(6, 'Kiran', 'IT', 76),
(7, 'Sneha', 'CSE', 95),
(8, 'Arjun', 'EEE', 64),
(9, 'Divya', 'IT', 82),
(10, 'Vikram', 'ECE', 79),
(11, 'Meena', 'CSE', 73),
(12, 'Ravi', 'EEE', 86),
(13, 'Pooja', 'IT', 90),
(14, 'Sanjay', 'ECE', 67),
(15, 'Keerthi', 'CSE', 80);

#31. Find the average marks scored by students in each department.
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department;

#32. Find departments whose average marks are above 75.
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) > 75;

#33. Find the highest mark scored in each department.
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department;

#34. Find the total number of students in each department.
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department;

#35. Find departments having more than 5 students.
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*) > 5;

#36. Display departments sorted by average marks in descending order.
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC;

#37. Find the top 3 departments based on average marks.
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 3;

#38. Find departments whose average marks are between 70 and 90.
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;

#39. Find the total marks scored by students in each department.
SELECT department, SUM(marks) AS total_marks
FROM Students
GROUP BY department;

#40. Display departments sorted by the total number of students.
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
ORDER BY total_students DESC;

#41. Find the lowest mark scored in each department.
SELECT department, MIN(marks) AS lowest_marks
FROM Students
GROUP BY department;

#42. Find departments where the highest mark is greater than 90.
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
HAVING MAX(marks) > 90;

#43. Find the number of students scoring above 80 in each department.
SELECT department, COUNT(*) AS students_above_80
FROM Students
WHERE marks > 80
GROUP BY department;

#44. Find departments where more than 3 students scored above 75.
SELECT department, COUNT(*) AS students_above_75
FROM Students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;

#45. Display departments ordered by highest mark in descending order.
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
ORDER BY highest_marks DESC;