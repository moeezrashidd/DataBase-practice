CREATE DATABASE SQL_SetFunction_Practice;
USE SQL_SetFunction_Practice;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary INT,
    HireDate DATE,
    City VARCHAR(50)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    Budget INT
);

CREATE TABLE EmployeeProjects (
    EmpID INT,
    ProjectID INT,
    HoursWorked INT,
    PRIMARY KEY (EmpID, ProjectID)
);

INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Employees VALUES
(1, 'Ali', 1, 80000, '2020-05-10', 'Lahore'),
(2, 'Sara', 2, 60000, '2019-03-15', 'Karachi'),
(3, 'Ahmed', 1, 90000, '2021-07-20', 'Islamabad'),
(4, 'Zara', 3, 75000, '2018-11-01', 'Lahore'),
(5, 'Usman', 4, 50000, '2022-01-12', 'Karachi'),
(6, 'Hina', 2, 62000, '2020-06-25', 'Lahore'),
(7, 'Bilal', 1, 80000, '2017-09-30', 'Islamabad'),
(8, 'Ayesha', 3, NULL, '2023-02-14', 'Karachi'),
(9, 'Hamza', 4, 55000, '2021-04-18', 'Lahore'),
(10, 'Fatima', 1, 95000, '2016-12-05', 'Islamabad');

INSERT INTO Projects VALUES
(101, 'Website', 200000),
(102, 'Mobile App', 150000),
(103, 'ERP System', 300000),
(104, 'Marketing Campaign', 100000);

INSERT INTO EmployeeProjects VALUES
(1, 101, 120),
(1, 102, 80),
(2, 104, 60),
(3, 101, 150),
(3, 103, 200),
(4, 103, 170),
(5, 104, 90),
(6, 104, 75),
(7, 101, 110),
(8, 102, 50),
(9, 104, 95),
(10, 103, 210);