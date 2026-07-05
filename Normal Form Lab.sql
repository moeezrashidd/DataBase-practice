Table: StudentData

Attributes:
(student_id, student_name, department,
 course1, course2,
 teacher1, teacher2,
 hobby1, hobby2)

Functional Dependencies:

student_id → student_name
student_id → department
course1 → teacher1
course2 → teacher2

Problems:
- Repeating groups
- Multiple values in columns
- Not atomic




Table: Student_1NF1122

Attributes:
(student_id, student_name, department,
 course_name, teacher_name, hobby)

Primary Key:
(student_id, course_name)

Functional Dependencies:

student_id → student_name
student_id → department
course_name → teacher_name

Candidate Key:
(student_id, course_name)

Problem:
student_name and department depend only on student_id
NOT on full composite key

This is called:
PARTIAL DEPENDENCY

That is why table is not in 2NF





Table 1:
Students_2NF1122
(student_id, student_name, department)

Functional Dependencies:

student_id → student_name
student_id → department



Table 2:
StudentCourses_2NF1122
(student_id, course_name, teacher_name)

Functional Dependencies:

course_name → teacher_name

Problem:
teacher_name depends on course_name
NOT directly on student_id

This is:
TRANSITIVE DEPENDENCY

That is why not in 3NF



-- =========================================================
-- 3NF
-- =========================================================

Table:
Courses_3NF1122
(course_name, teacher_name)

Functional Dependency:

course_name → teacher_name



Table:
StudentCourse_3NF1122
(student_id, course_name)

Functional Dependency:

(student_id, course_name)
is candidate key

Now:
- No partial dependency
- No transitive dependency

Table is in 3NF



