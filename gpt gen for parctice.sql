-- =====================================================
-- COMPLETE SQL DATABASE TUTORIAL WITH PRACTICE QUESTIONS
-- =====================================================

-- =====================================================
-- PART 1: CREATE DATABASE
-- =====================================================

-- Create a new database (MySQL syntax)
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;

-- For PostgreSQL, use:
-- CREATE DATABASE SchoolDB;
-- \c SchoolDB;

-- For SQL Server:
-- CREATE DATABASE SchoolDB;
-- USE SchoolDB;


-- =====================================================
-- PART 2: CREATE TABLES
-- =====================================================

-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    date_of_birth DATE,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade_level INT CHECK (grade_level BETWEEN 9 AND 12)
);

-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) UNIQUE,
    credits INT DEFAULT 3,
    department VARCHAR(50)
);

-- Create Enrollments table (junction table for many-to-many relationship)
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);


-- =====================================================
-- PART 3: INSERT DATA (ROWS)
-- =====================================================

-- Insert data into Students table
INSERT INTO Students (first_name, last_name, email, date_of_birth, grade_level) VALUES
('John', 'Doe', 'john.doe@email.com', '2005-03-15', 10),
('Jane', 'Smith', 'jane.smith@email.com', '2006-07-22', 9),
('Michael', 'Johnson', 'michael.j@email.com', '2004-11-08', 11),
('Emily', 'Brown', 'emily.brown@email.com', '2005-01-30', 10),
('David', 'Wilson', 'david.wilson@email.com', '2004-09-17', 12),
('Sarah', 'Martinez', 'sarah.m@email.com', '2006-05-12', 9),
('James', 'Anderson', 'james.a@email.com', '2005-12-03', 10),
('Lisa', 'Taylor', 'lisa.taylor@email.com', '2004-10-25', 11);

-- Insert data into Courses table
INSERT INTO Courses (course_name, course_code, credits, department) VALUES
('Mathematics 101', 'MATH101', 4, 'Mathematics'),
('English Literature', 'ENG201', 3, 'English'),
('Computer Science 101', 'CS101', 4, 'Computer Science'),
('Physics 101', 'PHY101', 4, 'Physics'),
('History 101', 'HIST101', 3, 'History'),
('Chemistry 101', 'CHEM101', 4, 'Chemistry'),
('Spanish 101', 'SPAN101', 3, 'Languages'),
('Art Appreciation', 'ART101', 2, 'Arts');

-- Insert data into Enrollments table
INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2024-01-15', 'A'),
(1, 2, '2024-01-15', 'B+'),
(1, 3, '2024-01-16', 'A-'),
(2, 1, '2024-01-15', 'B'),
(2, 4, '2024-01-16', 'A'),
(3, 3, '2024-01-15', 'A+'),
(3, 5, '2024-01-16', 'B+'),
(4, 2, '2024-01-15', 'A-'),
(4, 6, '2024-01-16', 'B'),
(5, 1, '2024-01-15', 'C+'),
(5, 7, '2024-01-16', 'B-'),
(6, 4, '2024-01-15', 'A'),
(6, 8, '2024-01-16', 'A'),
(7, 3, '2024-01-15', 'B+'),
(7, 5, '2024-01-16', 'A-'),
(8, 2, '2024-01-15', 'B'),
(8, 6, '2024-01-16', 'A-');


-- =====================================================
-- PART 4: BASIC OPERATIONS (SELECT, UPDATE, DELETE)
-- =====================================================

-- 4.1 SELECT Operations
-- -----------------------------

-- Select all students
SELECT * FROM Students;

-- Select specific columns
SELECT first_name, last_name, email FROM Students;

-- Select with WHERE clause
SELECT * FROM Students WHERE grade_level = 10;

-- Select with ORDER BY
SELECT * FROM Students ORDER BY last_name ASC;

-- Select with LIMIT (MySQL) or TOP (SQL Server) or ROWNUM (Oracle)
SELECT * FROM Students LIMIT 5;

-- Select with pattern matching (LIKE)
SELECT * FROM Students WHERE first_name LIKE 'J%';

-- Select with IN operator
SELECT * FROM Students WHERE grade_level IN (9, 10);

-- Select with BETWEEN
SELECT * FROM Students WHERE date_of_birth BETWEEN '2005-01-01' AND '2005-12-31';

-- 4.2 JOIN Operations
-- -----------------------------

-- INNER JOIN: Students and their enrollments
SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- LEFT JOIN: All students even if not enrolled
SELECT s.first_name, s.last_name, COUNT(e.course_id) AS num_courses
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id;

-- 4.3 Aggregate Functions
-- -----------------------------

-- Count total students
SELECT COUNT(*) AS total_students FROM Students;

-- Average grade level
SELECT AVG(grade_level) AS avg_grade_level FROM Students;

-- Count students by grade level
SELECT grade_level, COUNT(*) AS student_count 
FROM Students 
GROUP BY grade_level;

-- 4.4 UPDATE Operations
-- -----------------------------

-- Update a single student's email
UPDATE Students 
SET email = 'john.doe.new@email.com' 
WHERE student_id = 1;

-- Update grade for an enrollment
UPDATE Enrollments 
SET grade = 'A' 
WHERE student_id = 2 AND course_id = 4;

-- Increment all credits by 1 for a department
UPDATE Courses 
SET credits = credits + 1 
WHERE department = 'Computer Science';

-- 4.5 DELETE Operations
-- -----------------------------

-- Delete a specific enrollment
DELETE FROM Enrollments 
WHERE student_id = 5 AND course_id = 7;

-- Delete a student (cascading delete will remove enrollments)
DELETE FROM Students 
WHERE student_id = 8;

-- 4.6 Advanced Queries
-- -----------------------------

-- Subquery: Students enrolled in more than 2 courses
SELECT first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id 
    FROM Enrollments 
    GROUP BY student_id 
    HAVING COUNT(*) > 2
);

-- Find courses with no enrollments
SELECT course_name
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

-- Students with their course count and average grade (simplified grade point calculation)
SELECT 
    s.first_name,
    s.last_name,
    COUNT(e.course_id) AS courses_taken,
    GROUP_CONCAT(e.grade) AS grades
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id;


-- =====================================================
-- PART 5: PRACTICE QUESTIONS (as comments)
-- =====================================================

/*
PRACTICE QUESTIONS - Try to solve these:

EASY LEVEL:
1. Write a query to find all students who are in grade 11.
   -- Solution: SELECT * FROM Students WHERE grade_level = 11;

2. How would you display only the first name and last name of students born after 2005-01-01?
   -- Solution: SELECT first_name, last_name FROM Students WHERE date_of_birth > '2005-01-01';

3. Write a query to count how many courses are in the Mathematics department.
   -- Solution: SELECT COUNT(*) FROM Courses WHERE department = 'Mathematics';

4. How would you update the grade level of student 'Jane Smith' to 10?
   -- Solution: UPDATE Students SET grade_level = 10 WHERE first_name = 'Jane' AND last_name = 'Smith';

INTERMEDIATE LEVEL:
5. Find the names of students who are enrolled in 'Computer Science 101' course.
   -- Hint: Use JOIN between Students, Enrollments, and Courses

6. Write a query to find which course has the highest number of enrollments.
   -- Hint: Use GROUP BY, COUNT, and ORDER BY with LIMIT

7. Display all students and the number of courses they are taking, including those with 0 courses.
   -- Hint: Use LEFT JOIN and COUNT with GROUP BY

8. Find students who are taking both 'Mathematics 101' and 'Physics 101'.
   -- Hint: Use self-join or subquery with multiple conditions

ADVANCED LEVEL:
9. Create a view called 'StudentCourseSummary' that shows student names and their course lists.
   -- Hint: Use GROUP_CONCAT or STRING_AGG depending on your database

10. Write a query to find pairs of students who are enrolled in at least one common course.
    -- Hint: Self-join on Enrollments table with different student IDs

11. Calculate the GPA for each student (assume: A=4.0, A-=3.7, B+=3.3, B=3.0, B-=2.7, C+=2.3, C=2.0).
    -- Hint: Use CASE statement inside SUM

12. Find the department that has the highest total credits offered.
    -- Hint: Use SUM of credits with GROUP BY department

BONUS CHALLENGES:
13. Write a stored procedure that enrolls a student in a course, checking that the student doesn't exceed 5 courses.
    -- Hint: Use COUNT check before INSERT

14. Create a trigger that automatically sets enrollment_date to current date if not provided.
    -- Hint: Use BEFORE INSERT trigger

15. Write a query to find the most popular course (by enrollment) in each department.
    -- Hint: Use window functions like RANK() or subquery with MAX
*/


-- =====================================================
-- PART 6: SAMPLE SOLUTIONS FOR SOME PRACTICE QUESTIONS
-- =====================================================

-- Solution 5: Students enrolled in Computer Science 101
SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Computer Science 101';

-- Solution 6: Course with highest enrollments
SELECT c.course_name, COUNT(e.enrollment_id) AS enrollment_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id
ORDER BY enrollment_count DESC
LIMIT 1;

-- Solution 7: Students with course count (including zero)
SELECT s.first_name, s.last_name, COUNT(e.course_id) AS courses_taken
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id;

-- Solution 11: Calculate GPA for each student
SELECT 
    s.first_name,
    s.last_name,
    AVG(CASE e.grade
        WHEN 'A+' THEN 4.0
        WHEN 'A' THEN 4.0
        WHEN 'A-' THEN 3.7
        WHEN 'B+' THEN 3.3
        WHEN 'B' THEN 3.0
        WHEN 'B-' THEN 2.7
        WHEN 'C+' THEN 2.3
        WHEN 'C' THEN 2.0
        ELSE 0
    END) AS GPA
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id;


-- =====================================================
-- PART 7: CLEAN UP (Optional - Uncomment to run)
-- =====================================================

-- Drop tables (in reverse order due to foreign keys)
-- DROP TABLE IF EXISTS Enrollments;
-- DROP TABLE IF EXISTS Students;
-- DROP TABLE IF EXISTS Courses;

-- Drop database
-- DROP DATABASE IF EXISTS SchoolDB;