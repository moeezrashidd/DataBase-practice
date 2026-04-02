CREATE DATABASE SQL_Practice_Queries;
USE SQL_Practice_Queries;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50),
    HireDate DATE,
    Age INT,
    Email VARCHAR(100)
);

INSERT INTO Employees (FirstName, LastName, Department, Salary, City, HireDate, Age, Email)
VALUES
('Ali', 'Khan', 'IT', 80000, 'Islamabad', '2020-05-10', 26, 'ali.khan@gmail.com'),
('Sara', 'Ahmed', 'HR', 60000, 'Lahore', '2019-03-15', 28, 'sara.ahmed@yahoo.com'),
('Usman', 'Raza', 'Finance', 90000, 'Karachi', '2021-07-20', 30, 'usman.raza@gmail.com'),
('Ayesha', 'Malik', 'IT', 75000, 'Islamabad', '2022-01-10', 25, 'ayesha.malik@hotmail.com'),
('Hamza', 'Ali', 'Marketing', 50000, 'Lahore', '2018-11-25', 32, 'hamza.ali@gmail.com'),
('Zain', 'Sheikh', 'IT', 95000, 'Karachi', '2020-09-05', 29, 'zain.sheikh@gmail.com'),
('Hina', 'Iqbal', 'HR', 65000, 'Islamabad', '2021-12-12', 27, 'hina.iqbal@yahoo.com'),
('Bilal', 'Tariq', 'Finance', 70000, 'Lahore', '2019-06-30', 31, 'bilal.tariq@gmail.com'),
('Mariam', 'Noor', 'Marketing', 55000, 'Karachi', '2023-02-14', 24, 'mariam.noor@gmail.com'),
('Omar', 'Farooq', 'IT', 88000, 'Islamabad', '2017-08-19', 35, 'omar.farooq@gmail.com');