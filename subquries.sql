CREATE DATABASE Subquery_Practice;
USE Subquery_Practice;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    DepartmentID INT,
    Salary INT,
    ManagerID INT NULL,
    HireDate DATE
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(50)
);

CREATE TABLE EmployeeProjects (
    EmpID INT,
    ProjectID INT,
    HoursWorked INT,
    PRIMARY KEY (EmpID, ProjectID)
);

INSERT INTO Departments (DepartmentName) VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');

INSERT INTO Employees (Name, DepartmentID, Salary, ManagerID, HireDate) VALUES
('Ali', 1, 80000, NULL, '2020-01-10'),
('Sara', 2, 60000, NULL, '2019-03-15'),
('Ahmed', 1, 75000, 1, '2021-06-20'),
('Usman', 3, 90000, NULL, '2018-07-25'),
('Zara', 4, 65000, 2, '2022-02-10'),
('Hassan', 1, 72000, 1, '2023-01-05'),
('Ayesha', 2, 58000, 2, '2021-09-18'),
('Bilal', 3, 88000, 4, '2020-11-11');


INSERT INTO Projects (ProjectName, DepartmentID) VALUES
('Website', 1),
('Recruitment System', 2),
('Budget Analysis', 3),
('Ad Campaign', 4);

-- 1. Find employees whose salary is greater than the average salary of all employees.

-- 2. Find employees who earn more than the average salary of their own department.
-- (Correlated subquery)

-- 3. List employees who are working on at least one project.
-- (Use EXISTS)

-- 4. List employees who are NOT assigned to any project.
-- (Use NOT EXISTS)

-- 5. Find employees whose salary is greater than ALL employees in HR department.
-- (Use ALL)

-- 6. Find employees who work in the same department as 'Ali'.
-- (Use subquery)

-- 7. Display each employee's name along with their department name.
-- (Use subquery in SELECT instead of JOIN)

-- 8. Find the department(s) that have more than 2 employees.
-- (Use subquery with GROUP BY)

-- 9. Find employees who are managers (i.e., their EmpID appears as ManagerID for others).

-- 10. Find the second highest salary in the Employees table.
-- (Do NOT use TOP or LIMIT directly — use subquery)

-- 11. Find employees whose salary is equal to the maximum salary in their department.
-- (Correlated subquery)

-- 12. Find the employee(s) who worked the maximum number of hours on any project.

-- 13. Find departments that do NOT have any employees.
-- (Use NOT EXISTS)

-- 14. Find employees hired after the most recently hired employee in HR department.

-- 15. Find employees who earn more than the average salary of employees 
-- who are working on at least one project.
-- (Nested subquery + EXISTS)