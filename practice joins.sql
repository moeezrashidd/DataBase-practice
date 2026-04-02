CREATE DATABASE PracticeDB;
USE PracticeDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    DateOfBirth DATE,
    City VARCHAR(50),
    Country VARCHAR(50) DEFAULT 'Pakistan',
    RegistrationDate DATETIME DEFAULT GETDATE()
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE NOT NULL,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT CHECK (Quantity > 0),
    Price DECIMAL(10,2),
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Customers (FirstName, LastName, Email, Phone, Gender, DateOfBirth, City)
VALUES
('Ali', 'Khan', 'ali.khan@email.com', '03001234567', 'Male', '1998-05-10', 'Islamabad'),
('Sara', 'Ahmed', 'sara.ahmed@email.com', '03111234567', 'Female', '2000-08-22', 'Lahore'),
('Usman', 'Raza', 'usman.raza@email.com', '03221234567', 'Male', '1995-02-14', 'Karachi'),
('Ayesha', 'Malik', 'ayesha.malik@email.com', '03331234567', 'Female', '1999-12-01', 'Faisalabad');


INSERT INTO Orders (CustomerID, OrderDate, ProductName, Category, Quantity, Price, TotalAmount, Status)
VALUES
(1, '2025-01-10', 'Laptop', 'Electronics', 1, 120000, 120000, 'Delivered'),
(1, '2025-02-15', 'Mouse', 'Electronics', 2, 1500, 3000, 'Shipped'),
(2, '2025-03-01', 'Dress', 'Clothing', 3, 2500, 7500, 'Pending'),
(3, '2025-01-20', 'Phone', 'Electronics', 1, 80000, 80000, 'Delivered'),
(4, '2025-02-25', 'Shoes', 'Footwear', 2, 5000, 10000, 'Cancelled'),
(2, '2025-03-10', 'Bag', 'Accessories', 1, 4000, 4000, 'Delivered');

select * from Customers