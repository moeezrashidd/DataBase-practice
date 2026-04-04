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