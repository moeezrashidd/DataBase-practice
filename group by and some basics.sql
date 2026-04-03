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
INSERT INTO Employees (FirstName, LastName, Department, Salary, City, HireDate, Age, Email) VALUES
('Adnan', 'Rafiq', 'IT', 93000, 'Islamabad', '2021-02-11', 29, 'adnan.rafiq@gmail.com'),
('Sadia', 'Naeem', 'HR', 61000, 'Lahore', '2020-06-19', 27, 'sadia.naeem@yahoo.com'),
('Waqas', 'Mirza', 'Finance', 87000, 'Karachi', '2019-08-14', 34, 'waqas.mirza@gmail.com'),
('Komal', 'Arif', 'Marketing', 52000, 'Islamabad', '2022-03-22', 24, 'komal.arif@hotmail.com'),
('Rizwan', 'Latif', 'IT', 89000, 'Lahore', '2018-11-03', 33, 'rizwan.latif@gmail.com'),
('Farah', 'Jamil', 'HR', 66000, 'Karachi', '2021-05-17', 28, 'farah.jamil@yahoo.com'),
('Yasir', 'Butt', 'Finance', 91000, 'Islamabad', '2020-09-29', 31, 'yasir.butt@gmail.com'),
('Hafsa', 'Saleem', 'Marketing', 55000, 'Lahore', '2023-01-05', 23, 'hafsa.saleem@gmail.com'),
('Talha', 'Amin', 'IT', 97000, 'Karachi', '2017-07-12', 36, 'talha.amin@gmail.com'),
('Bushra', 'Khalil', 'HR', 64000, 'Islamabad', '2019-12-21', 30, 'bushra.khalil@yahoo.com'),

('Nabeel', 'Hashmi', 'Finance', 86000, 'Lahore', '2022-04-10', 27, 'nabeel.hashmi@gmail.com'),
('Areeba', 'Saeed', 'Marketing', 53000, 'Karachi', '2021-10-02', 25, 'areeba.saeed@hotmail.com'),
('Kamran', 'Yousuf', 'IT', 92000, 'Islamabad', '2020-03-28', 32, 'kamran.yousuf@gmail.com'),
('Tehmina', 'Qadir', 'HR', 60000, 'Lahore', '2018-09-13', 34, 'tehmina.qadir@yahoo.com'),
('Faisal', 'Rehman', 'Finance', 94000, 'Karachi', '2019-01-30', 35, 'faisal.rehman@gmail.com'),
('Laiba', 'Imtiaz', 'Marketing', 56000, 'Islamabad', '2023-02-08', 22, 'laiba.imtiaz@gmail.com'),
('Shahid', 'Raza', 'IT', 88000, 'Lahore', '2021-06-14', 30, 'shahid.raza@gmail.com'),
('Nida', 'Akhtar', 'HR', 67000, 'Karachi', '2020-11-19', 28, 'nida.akhtar@yahoo.com'),
('Junaid', 'Iqbal', 'Finance', 90000, 'Islamabad', '2017-05-25', 37, 'junaid.iqbal@gmail.com'),
('Amna', 'Latif', 'Marketing', 54000, 'Lahore', '2022-08-16', 24, 'amna.latif@hotmail.com'),

('Salman', 'Khan', 'IT', 96000, 'Karachi', '2018-02-07', 35, 'salman.khan@gmail.com'),
('Hira', 'Majeed', 'HR', 62000, 'Islamabad', '2021-09-09', 26, 'hira.majeed@yahoo.com'),
('Asad', 'Zubair', 'Finance', 85000, 'Lahore', '2020-07-01', 31, 'asad.zubair@gmail.com'),
('Iqbal', 'Shah', 'Marketing', 51000, 'Karachi', '2019-03-18', 33, 'iqbal.shah@hotmail.com'),
('Bilqees', 'Anwar', 'IT', 91000, 'Islamabad', '2022-05-27', 28, 'bilqees.anwar@gmail.com'),
('Zeeshan', 'Rashid', 'HR', 68000, 'Lahore', '2017-12-12', 38, 'zeeshan.rashid@yahoo.com'),
('Adeel', 'Sultan', 'Finance', 93000, 'Karachi', '2019-10-05', 34, 'adeel.sultan@gmail.com'),
('Maham', 'Fahad', 'Marketing', 57000, 'Islamabad', '2023-03-12', 23, 'maham.fahad@gmail.com'),
('Farhan', 'Ali', 'IT', 87000, 'Lahore', '2021-01-21', 29, 'farhan.ali@gmail.com'),
('Sumbal', 'Riaz', 'HR', 65000, 'Karachi', '2020-04-30', 27, 'sumbal.riaz@yahoo.com'),

('Usaid', 'Kareem', 'Finance', 92000, 'Islamabad', '2018-06-06', 36, 'usaid.kareem@gmail.com'),
('Alina', 'Noor', 'Marketing', 55000, 'Lahore', '2022-12-25', 24, 'alina.noor@hotmail.com'),
('Shayan', 'Tariq', 'IT', 98000, 'Karachi', '2017-03-15', 39, 'shayan.tariq@gmail.com'),
('Rimsha', 'Hassan', 'HR', 63000, 'Islamabad', '2021-07-07', 26, 'rimsha.hassan@yahoo.com'),
('Dawood', 'Aziz', 'Finance', 89000, 'Lahore', '2020-10-10', 32, 'dawood.aziz@gmail.com');


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