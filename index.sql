CREATE TABLE Employees
(
    EmpID   INT,
    EmpName VARCHAR(100),
    Salary  INT
);

INSERT INTO Employees VALUES (10, 'Ali',   50000);
INSERT INTO Employees VALUES (1,  'Ahmed', 60000);
INSERT INTO Employees VALUES (7,  'Sara',  70000);


--1
CREATE CLUSTERED INDEX idx_empid
ON Employees(EmpID);

INSERT INTO Employees VALUES (4, 'Zara', 80000);


SELECT * FROM Employees WHERE EmpID = 7;
--2

CREATE NONCLUSTERED INDEX idx_empname
ON Employees(EmpName);



SELECT * FROM Employees WHERE EmpName = 'Ali';

--3

CREATE UNIQUE INDEX idx_unique_name
ON Employees(EmpName);


INSERT INTO Employees VALUES (11, 'Bilal', 45000);





DROP INDEX idx_unique_name ON Employees;

INSERT INTO Employees VALUES (3, 'Ali', 40000);

--4
CREATE INDEX idx_name_salary
ON Employees(EmpName, Salary);


SELECT * FROM Employees
WHERE EmpName = 'Ali' AND Salary = 50000;



CREATE TABLE BigEmployees
(
    EmpID   INT,
    EmpName VARCHAR(100),
    Salary  INT
);

SELECT * FROM BigEmployees WHERE EmpName = 'Ali';

--5
CREATE NONCLUSTERED INDEX idx_big_empname
ON BigEmployees(EmpName);

SELECT * FROM BigEmployees WHERE EmpName = 'Ali';
SELECT * FROM sys.indexes
WHERE object_id = OBJECT_ID('Employees');

SELECT * FROM sys.dm_db_index_usage_stats
WHERE object_id = OBJECT_ID('Employees');




DROP INDEX idx_empname ON Employees;
DROP INDEX idx_name_salary ON Employees;
DROP INDEX idx_big_empname ON BigEmployees;