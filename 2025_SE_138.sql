create database sales

use sales

CREATE TABLE SalesData (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50),
    product_name VARCHAR(50),
    quantity INT,
    price_per_product DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);


INSERT INTO SalesData VALUES
(1, 'Ali Khan', 'Pakistan', 'Laptop', 1, 1200, 1200),
(2, 'Ali Khan', 'Pakistan', 'Mouse', 2, 40, 80),
(3, 'John Smith', 'USA', 'Smartphone', 1, 700, 700),
(4, 'Maria Garcia', 'Spain', 'Headphones', 3, 150, 450),
(5, 'Ahmed Hassan', 'UAE', 'Laptop', 2, 1200, 2400),
(6, 'Sara Lee', 'UK', 'Keyboard', 1, 80, 80),
(7, 'John Smith', 'USA', 'Mouse', 5, 40, 200),
(8, 'Maria Garcia', 'Spain', 'Smartphone', 1, 700, 700),
(9, 'Ali Khan', 'Pakistan', 'Headphones', 2, 150, 300),
(10, 'Ahmed Hassan', 'UAE', 'Keyboard', 3, 80, 240);


select * from SalesData

select * from SalesData order  by price_per_product

select * from SalesData order  by price_per_product desc

select top 3 * from SalesData order by price_per_product desc

select top 5 * from SalesData order by quantity desc

select  country ,count(quantity) from SalesData group by country

select distinct product_name from SalesData order by product_name

select country , count(total_amount) from SalesData group by country order by count(total_amount) desc

select customer_name , count(customer_name) from SalesData group by customer_name order by count(customer_name) desc

select top 2 customer_name, sum(total_amount) from SalesData group by customer_name order by sum(total_amount)  desc

select product_name , sum(quantity * price_per_product) from SalesData group by product_name 

select country , count(quantity) from SalesData group by country having count(quantity) > 2

select customer_name , sum(quantity * price_per_product)  from SalesData group by customer_name having sum(quantity * price_per_product) > 1000


select  product_name , sum(quantity)  from SalesData group by product_name having sum(quantity) > 2