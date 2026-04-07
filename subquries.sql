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

INSERT INTO EmployeeProjects (EmpID, ProjectID, HoursWorked) VALUES
(1,1,120),
(3,1,100),
(6,1,80),
(2,2,90),
(5,4,60);

INSERT INTO Employees (Name, DepartmentID, Salary, ManagerID, HireDate) VALUES
('Ali', 1, 80000, NULL, '2020-01-10'),
('Sara', 2, 60000, NULL, '2019-03-15'),
('Ahmed', 1, 75000, 1, '2021-06-20'),
('Usman', 3, 90000, NULL, '2018-07-25'),
('Zara', 4, 65000, 2, '2022-02-10'),
('Hassan', 1, 72000, 1, '2023-01-05'),
('Ayesha', 2, 58000, 2, '2021-09-18'),
('Bilal', 3, 88000, 4, '2020-11-11');




select * from Departments
select * from EmployeeProjects
select * from Employees



-- 1. Find employees whose salary is greater than the average salary of all employees.

select * from Employees
where Salary >( select AVG(Salary) from Employees)

-- 2. Find employees who earn more than the average salary of their own department.
select * from Employees
inner join 
(select Departments.DepartmentName,Departments.DepartmentID
,avg(Employees.Salary) as avgSalary from Employees
inner join Departments
on Departments.DepartmentID = Employees.DepartmentID
group by Departments.DepartmentName,Departments.DepartmentID) as avgPerDept

on avgPerDept.DepartmentID = Employees.DepartmentID

where Employees.Salary > avgPerDept.avgSalary

-- 3. List employees who are working on at least one project.
select * from Employees
where EmpID in ( select EmpID from EmployeeProjects)

-- 4. List employees who are NOT assigned to any project.

select * from Employees
where EmpID not in ( select EmpID from EmployeeProjects)

-- 5. Find employees whose salary is greater than employees in HR department.

select * from Employees
where Salary > all
(select Employees.salary from Employees
inner join Departments on 
Employees.DepartmentID = Departments.DepartmentID
where Departments.DepartmentName = 'HR') 



-- 6. Find employees who work in the same department as 'Ali'.

select EmpID ,Name ,DepartmentID  from Employees as e
where DepartmentID =
( select DepartmentID from Employees
where Name ='Ali')


-- 7. Display each employee's name along with their department name.
select Name ,
(select DepartmentName from Departments as d where d.DepartmentID = e.DepartmentID)
from Employees as e

-- 8. Find the department(s) that have more than 2 employees.

-- 9. Find employees who are managers.

-- 10. Find the second highest salary in the Employees table.

-- 11. Find employees whose salary is equal to the maximum salary in their department.

-- 12. Find the employee(s) who worked the maximum number of hours on any project.

-- 13. Find departments that do NOT have any employees.

-- 14. Find employees hired after the most recently hired employee in HR department.

-- 15. Find employees who earn more than the average salary of employees who are working on at least one project.