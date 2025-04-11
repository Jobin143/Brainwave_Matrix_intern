create database online_store;
use online_store;

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2),
    Stock INT,
    Category VARCHAR(50)
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(20),
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod VARCHAR(30),
    AmountPaid DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
desc payments;

-- customer detail: 
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, Country)
VALUES 
('Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', '101 MG Road', 'Mumbai', 'India'),
('Priya', 'Verma', 'priya.verma@gmail.com', '9812345678', '22 Lajpat Nagar', 'Delhi', 'India'),
('Amit', 'Patel', 'amit.patel@gmail.com', '9988776655', '7 CG Road', 'Ahmedabad', 'India'),
('Sneha', 'Reddy', 'sneha.reddy@gmail.com', '9123456789', '45 Jubilee Hills', 'Hyderabad', 'India');

-- products :
INSERT INTO Products (ProductName, Description, Price, Stock, Category)
VALUES
('Smartphone', '5G-enabled Android smartphone', 17999.00, 30, 'Electronics'),
('Bluetooth Speaker', 'Portable speaker with deep bass', 2499.00, 20, 'Electronics'),
('Yoga Mat', 'Eco-friendly non-slip mat', 799.00, 50, 'Fitness'),
('Water Bottle', 'Stainless steel insulated bottle', 499.00, 100, 'Home & Kitchen'),
('Running Shoes', 'Lightweight running shoes', 2999.00, 25, 'Footwear');
select * from products;
-- orders status: 
INSERT INTO Orders (CustomerID, OrderDate, Status, TotalAmount)      
VALUES 
(1, '2025-04-10', 'Delivered', 20498.00),
(2, '2025-04-09', 'Shipped', 3298.00),
(3, '2025-04-08', 'Pending', 799.00);
-- --------------------------------------------------------------------
-- order details of the customers : 
-- Order 1: Rahul bought a smartphone + water bottle
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(1, 1, 1, 17999.00),
(1, 4, 1, 499.00);

-- Order 2: Priya bought running shoes + yoga mat
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(2, 5, 1, 2999.00),
(2, 3, 1, 799.00);

-- Order 3: Amit bought a yoga mat
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(3, 3, 1, 799.00);

-- ----------------------------------------------------
-- to find payments details:
INSERT INTO Payments (OrderID, PaymentDate, PaymentMethod, AmountPaid)
VALUES 
(1, '2025-04-10', 'UPI', 18498.00),
(2, '2025-04-09', 'Credit Card', 3298.00);
select * from payments;
-- ------------------------------------------------------------------------------------------------------------------------------------------


