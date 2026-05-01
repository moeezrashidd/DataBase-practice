-- SQL Server Views Practice (Questions Only)
-- Use SQL Server Management Studio (SSMS)

CREATE DATABASE ViewPracticeDB;
GO

USE ViewPracticeDB;
GO

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Salary DECIMAL(10,2),
    DepartmentID INT,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO Employees VALUES
(101, 'Ali Khan', 50000, 1, '2022-01-15'),
(102, 'Sara Ahmed', 70000, 2, '2021-03-10'),
(103, 'Usman Tariq', 65000, 2, '2020-07-21'),
(104, 'Hina Malik', 80000, 3, '2019-11-05');
GO

-- Question 1:
-- Create a view to show EmployeeID, FullName, Salary.

-- Question 2:
-- Select all data from the view created above.

-- Question 3:
-- Show employees with Salary > 60000 using the view.

-- Question 4:
-- Create a view using JOIN to show employee name with department name.

-- Question 5:
-- Show all employees working in IT department using the join view.

-- Question 6:
-- Count employees in each department using a view.

-- Question 7:
-- Create a view to show department wise average salary.

-- Question 8:
-- Show the department with highest average salary.

-- Question 9:
-- Alter a view to add HireDate column.

-- Question 10:
-- Create a view to show only HR employees.

-- Question 11:
-- Insert a new HR employee using the HR view.

-- Question 12:
-- Update salary of an employee using a view.

-- Question 13:
-- Delete an employee using a view.

-- Question 14:
-- Drop a view.

-- Question 15:
-- Create a view for employees hired after 2021.

-- Question 16:
-- Create a view for top 2 highest paid employees.

-- Question 17:
-- Create a view using WITH CHECK OPTION.

-- Question 18:
-- Create a schema-bound view.

-- Question 19:
-- What is the difference between table and view?

-- Question 20:
-- What are advantages of views in real projects?