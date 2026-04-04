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
(2, '2025-03-01', 'Dress', 'Clothing', 3, 2500, 7500, 'Pending'),
(3, '2025-01-20', 'Phone', 'Electronics', 1, 80000, 80000, 'Delivered'),
(4, '2025-02-25', 'Shoes', 'Footwear', 2, 5000, 10000, 'Cancelled'),
(2, '2025-03-10', 'Bag', 'Accessories', 1, 4000, 4000, 'Delivered');


select * from Customers

-- 1. Get all customers with their orders (show customer full name, product name, and order status)
    
    select Customers.FirstName +'' +Customers.LastName as fullName ,
    Orders.ProductName,  Orders.Status
    from Customers
    inner join  Orders 
    on Customers.CustomerID = Orders.CustomerID

-- 2. Show customers who have never placed an order
select * from Customers
left join Orders
on Customers.CustomerID = Orders.CustomerID
where Orders.CustomerID is Null


-- 3. List all orders with customer full name and city


    select Customers.FirstName +'' +Customers.LastName as fullName ,
    Customers.City
    from Orders
    left join  Customers 
    on Orders.CustomerID = Customers.CustomerID

-- 4. Find all customers from Lahore who have placed orders

select Customers.FirstName +'' +Customers.LastName as fullName ,
    Customers.City,Orders.ProductName,  Orders.Status  from Customers
left join Orders
on Customers.CustomerID = Orders.CustomerID
where Customers.City= 'Lahore' and Orders.CustomerID is not NUll

-- 5. Show all orders where product name contains the letter 'o'

select Orders.ProductName , Orders.Price ,Customers.City 
,Customers.FirstName +'' +Customers.LastName as fullName 
from Orders 
left Join Customers
on Orders.CustomerID = Customers.CustomerID
where Orders.ProductName like '%o%' and Customers.CustomerID is not null

-- 6. Get total number of orders per customer

select Customers.FirstName , count(Orders.CustomerID) as noOFOrders
from Orders 
inner join Customers
on Orders.CustomerID = Customers.CustomerID
group by Customers.FirstName

 

-- 7. Show customers who have placed more than 1 order

select Customers.FirstName , Count(Orders.CustomerID) as noOfOrders 
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
group by Customers.FirstName
having Count(Orders.CustomerID) >1

-- 8. Calculate total spending (SUM of TotalAmount) for each customer

select Customers.FirstName , sum(Orders.TotalAmount) as Total_amount 
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
group by Customers.FirstName


-- 9. Show the highest spending customer
select top 1 Customers.FirstName , sum(Orders.TotalAmount) as total_spend
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
group by Customers.FirstName
order by total_spend desc

-- 10. Find total sales per category

select Orders.Category , sum(Orders.TotalAmount) as total_spend
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
group by Orders.Category


-- 11. Show all orders that are not delivered

select Customers.FirstName +''+Customers.LastName as fullName ,
Orders.ProductName ,Orders.Status 
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
where Orders.Status != 'Delivered'

-- 12. Find customers who placed orders in March 2025
select Customers.FirstName ,Orders.ProductName ,Orders.OrderDate
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
where Orders.OrderDate like '2025-03-%'

-- 13. Find customers whose total spending is greater than average spending
select Customers.FirstName,Customers.CustomerID , 
sum(Orders.Price * Orders.Quantity) as total_spending
from Orders 
inner join Customers
on Customers.CustomerID = Orders.CustomerID
group by Customers.FirstName ,Customers.CustomerID
having sum(Orders.Price * Orders.Quantity) > avg(Orders.Price * Orders.Quantity)


-- 14. Get the most ordered product (by total quantity)
select Orders.ProductName ,Orders.Price ,sum(Orders.Quantity) as noOfOrders
from Orders
inner join Customers
on Orders.CustomerID = Customers.CustomerID
group by Orders.ProductName ,Orders.Price

-- 15. Show each customer with:
--     total number of orders,
--     total spending,
--     average order value

select Customers.FirstName ,count(Orders.CustomerID) as noOFOrders, 
sum(Orders.Quantity * Orders.Price) as TotoalSpending,
avg(Orders.Price) as averageValue
from 
Orders inner join
Customers on Customers.CustomerID = Orders.CustomerID
group by Customers.FirstName

-- 16. Find customers who only placed Delivered orders (no Pending or Cancelled orders)

select Customers.FirstName , Orders.Status
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
where Orders.Status = 'Delivered'

-- 17. Get the second highest order amount

select Orders.ProductName , Orders.Quantity * Orders.Price as order_amount
from Orders inner join 
Customers  on Customers.CustomerID = Orders.CustomerID
order by order_amount desc
offset 1 rows
fetch next 1 row only



-- 18. Find customers who ordered from more than 1 category
select Customers.FirstName , count(Orders.Category) as categoryOrders
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
group by Customers.FirstName
having count(Orders.Category) >1

-- 19.show orders sort by date latest
select   Customers.FirstName ,Orders.ProductName ,max(Orders.OrderDate) as Latest
from Orders 
inner join Customers
on Customers.CustomerID=  Orders.CustomerID
group by Customers.FirstName , Orders.ProductName
order by Latest desc


-- 20. Rank customers based on total spending (use RANK() if supported)
select Customers.FirstName , sum(Orders.Price * Orders.Quantity) as Total_spending,
Rank() over ( order by sum(Orders.Price * Orders.Quantity) desc) as Rank_Orders
from Orders
inner join Customers
on Customers.CustomerID = Orders.CustomerID
group by Customers.FirstName