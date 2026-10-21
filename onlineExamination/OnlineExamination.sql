CREATE DATABASE online_exam_db;
USE online_exam_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_name VARCHAR(100),
    duration INT
);

CREATE TABLE questions (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_id INT,
    question_text VARCHAR(500),
    option_a VARCHAR(200),
    option_b VARCHAR(200),
    option_c VARCHAR(200),
    option_d VARCHAR(200),
    correct_answer VARCHAR(200),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

CREATE TABLE results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    exam_id INT,
    score INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

INSERT INTO students (name, email, password)
VALUES ('navya', 'navya@gmail.com', '1234');

INSERT INTO exams (exam_name, duration)
VALUES ('java basics', 30);


INSERT INTO questions
(exam_id, question_text, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(
    1,
    'what is java',
    'programming language',
    'database',
    'operating system',
    'browser',
    'A'
);

SELECT * FROM students;

SELECT * FROM exams;

SELECT * FROM questions;

SELECT * FROM results;


UPDATE exams
SET duration = 40
WHERE exam_name = 'java basics';


INSERT INTO students (name, email, password)
VALUES ('Temporary Student', 'temp@gmail.com', '1234');

DELETE FROM students
WHERE email = 'temp@gmail.com';


SELECT COUNT(*) AS total_students
FROM students;


SELECT
    s.name AS student_name,
    e.exam_name,
    r.score
FROM results r
JOIN students s
    ON r.student_id = s.student_id
JOIN exams e
    ON r.exam_id = e.exam_id;