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


--Get all employees from Islamabad

select * from Employees
where City = 'Islamabad'

--Find employees with salary greater than 70,000

select * from Employees
where Salary > 70000

--Show employees whose age is less than 30

select * from Employees
where Age < 30


-- Display all employees sorted by salary in ascending order  

select * from Employees
order by Salary asc

-- Sort employees by age in descending order  

select * from Employees
order by Age desc

-- Sort employees first by department and then by salary  

select * from Employees
order by Department , Salary   -- in this groups will become first sort by department and make group of departement and then it will sort these groups according to salary


-- Get the top 3 highest paid employees  

select top 3 * from Employees
order by Salary desc

-- Get the top 5 youngest employees  
select top 5 * from Employees
order by Age asc

-- Get the top 2 employees from IT department  
select top 2 * from Employees
where Department = 'IT'
order by Salary desc

-- Find employees whose first name starts with 'A'  

select * from Employees
where FirstName like 'A%'

-- Find employees whose email contains 'gmail'  

select * from Employees
where Email like '%gmail%'

-- Find employees whose last name ends with 'n'  

select * from Employees
where LastName like '%n'

-- Get employees from Islamabad and Lahore  

select * from Employees
where City in ('Islamabad' , 'Lahore')

-- Get employees working in IT and HR  

select * from Employees
where Department in ('IT','HR')

-- Find employees whose age is 25, 28, or 30  

select * from Employees
where Age in (25,28,30)

-- Count number of employees in each department  

select Department , count(Department) as noOFemp from Employees
group by Department

-- Find average salary per department  
select Department , AVG(Salary) as avgsalary from Employees
group by Department


-- Find maximum salary in each city  

select City , max(Salary) as maxsalaryCity from Employees
group by City

-- Get departments where average salary is greater than 70,000  

select Department , avg(Salary) as avgsalary from Employees
group by Department
having avg(salary) > 70000

-- Show top 3 highest salaries grouped by department  
select top 3   Department, max(Salary) as highestSalary from Employees
group by Department
order by highestSalary desc

-- Find cities having more than 2 employees  

select City , count(city) as noOFemp from Employees
group by City
having count(city) > 2

-- Employees whose name starts with A and salary is greater than 70,000  

select * from Employees
where FirstName like 'A%' and Salary > 70000

-- Employees from Lahore with salary between 50,000 and 80,000  
select * from Employees
where City = 'Lahore' 
and Salary between 50000 and 80000

-- Employees not working in IT department  

select * from Employees
where Department not in ('IT')