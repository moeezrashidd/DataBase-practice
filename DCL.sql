


CREATE DATABASE DCL;
GO

USE DCL;
GO


CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Salary DECIMAL(10,2)
);
GO


INSERT INTO Employees
VALUES
(1, 'Ali', 50000),
(2, 'Ahmed', 60000),
(3, 'Sara', 55000);
GO

CREATE LOGIN AliLogin
WITH PASSWORD = 'Ali@123';

CREATE LOGIN AhmedLogin
WITH PASSWORD = 'Ahmed@123';

CREATE LOGIN SaraLogin
WITH PASSWORD = 'Sara@123';
GO


CREATE USER Ali FOR LOGIN AliLogin;
CREATE USER Ahmed FOR LOGIN AhmedLogin;
CREATE USER Sara FOR LOGIN SaraLogin;
GO



CREATE ROLE EmployeeManager;
GO




ALTER ROLE EmployeeManager
ADD MEMBER Ali;

ALTER ROLE EmployeeManager
ADD MEMBER Ahmed;
GO


GRANT SELECT ON Employees TO EmployeeManager;
GRANT INSERT ON Employees TO EmployeeManager;
GO



REVOKE INSERT ON Employees FROM EmployeeManager;
GO


DENY DELETE ON Employees TO Ahmed;
GO

