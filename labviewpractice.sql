use ViewPracticeDB;

CREATE TABLE ecommerce_customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(50),
city VARCHAR(50),
total_purchase INT
);
INSERT INTO ecommerce_customers VALUES
(1, 'Ali Khan', 'ali@gmail.com', 'Lahore', 65000),
(2, 'Sara Ahmed', 'sara@gmail.com', 'Karachi', 40000),
(3, 'Bilal Shah', 'bilal@gmail.com', 'Islamabad', 90000);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
amount INT,
FOREIGN KEY (customer_id) REFERENCES ecommerce_customers(customer_id)
);
INSERT INTO orders VALUES
(101, 1, 5000),
(102, 2, 9000),
(103, 1, 20000);

--Create a view that hides the email column.
 go

CREATE VIEW public_customers as
select customer_id , name , city , total_purchase 
from ecommerce_customers

go

select * from public_customers

--Create a joined view showing customer name, city, and total order amount.
go
create view joined_customers as
select c.name , c.city,o.amount from ecommerce_customers as c
join orders as o
on c.customer_id= o.customer_id
go

select * from joined_customers

--Alter an existing view to change the filter condition.
go
alter view public_customers as
select name , city , total_purchase 
from ecommerce_customers
where city = 'Lahore'

go
--Use a view in a subquery to filter orders.
go
create view subView as
select * from
(select * from orders
where amount>10000) as highOrders
go
select * from subView
--Create a view to show customers with total_purchase > 50000.
go 
create view custTotalPurchase as
select e.name ,e.total_purchase ,e.customer_id
from ecommerce_customers as e
where e.total_purchase > 50000
go
select * from custTotalPurchase

--Use a view in a JOIN with another table.
select c.name , c.total_purchase , c.customer_id ,o.amount, o.order_id
from custTotalPurchase as c
join orders as o
on c.customer_id = o.customer_id

--Drop any views you created.
drop view public_customers