
create database cbblock
CREATE TABLE Employee11223 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    date_of_birth DATE,
    joining_date DATE
);




INSERT INTO Employee11223 VALUES
(1, 'Ali', 'IT', 70000, '2000-05-10', '2021-01-15'),
(2, 'Ahmed', 'HR', 50000, '1998-08-20', '2020-03-01'),
(3, 'Sara', 'Finance', 80000, '1995-12-12', '2018-07-10'),
(4, 'Ayesha', 'IT', 65000, '1999-04-18', '2022-06-05');




CREATE FUNCTION dbo.CalculateDiscount11223
(
    @price DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @price - (@price * 0.10)
END;


SELECT 
    emp_name,
    salary,
    dbo.CalculateDiscount11223(salary) AS salary_after_discount
FROM Employee1122;



CREATE FUNCTION dbo.EmployeeAge11223
(
    @dob DATE
)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @dob, GETDATE())
END;


SELECT 
    emp_name,
    dbo.EmployeeAge11223(date_of_birth) AS age
FROM Employee1122;




CREATE FUNCTION dbo.EmployeesByDepartment11223
(
    @dept VARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT emp_id, emp_name, department, salary
    FROM Employee1122
    WHERE department = @dept
);


SELECT * 
FROM EmployeesByDepartment11223('IT');



CREATE PROCEDURE dbo.UpdateEmployeeSalary1122
(
    @id INT,
    @newsalary DECIMAL(10,2)
)
AS
BEGIN
    UPDATE Employee1122
    SET salary = @newsalary
    WHERE emp_id = @id
END;


EXEC UpdateEmployeeSalary1122 1, 90000;



CREATE PROCEDURE dbo.DeleteEmployee1122
(
    @id INT
)
AS
BEGIN
    DELETE FROM Employee1122
    WHERE emp_id = @id
END;


EXEC DeleteEmployee1122 4;



CREATE PROCEDURE dbo.EmployeeCount1122
(
    @dept VARCHAR(50),
    @total INT OUTPUT
)
AS
BEGIN
    SELECT @total = COUNT(*)
    FROM Employee1122
    WHERE department = @dept
END;


DECLARE @count INT;

EXEC EmployeeCount1122
    @dept = 'IT',
    @total = @count OUTPUT;

SELECT @count AS total_employees;



CREATE PROCEDURE dbo.EmployeeTenure1122
(
    @id INT,
    @years INT OUTPUT
)
AS
BEGIN
    SELECT @years = DATEDIFF(YEAR, joining_date, GETDATE())
    FROM Employee1122
    WHERE emp_id = @id
END;


DECLARE @tenure INT;

EXEC EmployeeTenure1122
    @id = 1,
    @years = @tenure OUTPUT;

SELECT @tenure AS employee_tenure;