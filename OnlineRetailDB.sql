--Create database--
CREATE DATABASE OnlineRetailDB;
GO
	
--สร้างตารางข้อมูล--
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Email NVARCHAR(100),
	Phone NVARCHAR(50),
	Address NVARCHAR(255),
	City NVARCHAR(50),
	State NVARCHAR(50),
	ZipCode NVARCHAR(50),
	Country NVARCHAR(50),
	CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Products (
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(100),
	CategoryID INT,
	Price DECIMAL(10,2),
	Stock INT,
	CreatedAt DATETIME DEFAULT GETDATE()
);
CREATE TABLE Orders (
	OrderId INT PRIMARY KEY IDENTITY(1,1),
	CustomerId INT,
	OrderDate DATETIME DEFAULT GETDATE(),
	TotalAmount DECIMAL(10,2),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

);

-- Alter / เปลี่ยนชื่อคอลัมน์ในตาราง
EXEC sp_rename 'OnlineRetailDB.dbo.Orders.CustomerId', 'CustomerID', 'COLUMN'; 

CREATE TABLE OrderItems (
	OrderItemID INT PRIMARY KEY IDENTITY(1,1),
	OrderID INT,
	ProductID INT,
	Quantity INT,
	Price DECIMAL(10,2),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	FOREIGN KEY (OrderId) REFERENCES Orders(OrderID)
);

INSERT INTO Categories (CategoryName, Description) 
VALUES 
('Electronics', 'Devices and Gadgets'),
('Clothing', 'Apparel and Accessories'),
('Books', 'Printed and Electronic Books');

INSERT INTO Products(ProductName, CategoryID, Price, Stock)
VALUES 
('Smartphone', 1, 699.99, 50),
('Laptop', 1, 999.99, 30),
('T-shirt', 2, 19.99, 100),
('Jeans', 2, 49.99, 60),
('Fiction Novel', 3, 14.99, 200),
('Science Journal', 3, 29.99, 150);

INSERT INTO Customers(FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country)
VALUES 
('Sameer', 'Khanna', 'sameer.khanna@example.com', '123-456-7890', '123 Elm St.', 'Springfield', 
'IL', '62701', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak St.', 'Madison', 
'WI', '53703', 'USA'),
('harshad', 'patel', 'harshad.patel@example.com', '345-678-9012', '789 Dalal St.', 'Mumbai', 
'Maharashtra', '41520', 'INDIA');

INSERT INTO Orders(CustomerId, OrderDate, TotalAmount)
VALUES 
(1, GETDATE(), 719.98),
(2, GETDATE(), 49.99),
(3, GETDATE(), 44.98);

INSERT INTO OrderItems(OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 1, 699.99),
(1, 3, 1, 19.99),
(2, 4, 1,  49.99),
(3, 5, 1, 14.99),
(3, 6, 1, 29.99);

--Query 1: ดึงรายการคำสั่งซื้อ (orders) ทั้งหมดของลูกค้าคนใดคนหนึ่ง
SELECT o.OrderID, o.OrderDate, o.TotalAmount, oi.ProductID, p.ProductName, oi.Quantity, oi.Price
FROM Orders as o
JOIN OrderItems as oi ON o.OrderId = oi.OrderID
JOIN Products as p ON oi.ProductID = p.ProductID
WHERE o.CustomerID = 1;

--Query 2: หายอดขายรวม (total sales) ของสินค้าแต่ละรายการ
SELECT p.ProductID, p.ProductName, SUM(oi.Quantity * oi.Price) AS TotalSales
FROM OrderItems as oi
JOIN Products as p 
ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSales DESC;

--Query 3: หาค่าเฉลี่ยของมูลค่าคำสั่งซื้อทั้งหมด
SELECT AVG(TotalAmount) AS AverageOrderValue 
FROM Orders;

--Query 4: หาลูกค้าที่มียอดใช้จ่ายรวมสูงสุด Top 5 จากยอดสั่งซื้อรวมทั้งหมด
SELECT CustomerID, FirstName, LastName, TotalSpent, rn
FROM (SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) as TotalSpent,
ROW_NUMBER() OVER (ORDER BY SUM(o.TotalAmount) DESC) as rn
FROM Customersas as c
JOIN Orders as o
ON c.CustomerID = o.CustomerId
GROUP BY c.CustomerID, c.FirstName, c.LastName)
sub WHERE rn <= 5;

--Query 5: แสดงหมวดหมู่สินค้าที่ขายดีที่สุด
SELECT CategoryID, CategoryName, TotalQuantitySold, rn
FROM (
SELECT c.CategoryID, c.CategoryName, SUM(oi.Quantity) as TotalQuantitySold,
ROW_NUMBER() OVER (ORDER BY SUM(oi.Quantity) DESC) as rn
FROM OrderItems as oi
JOIN Products as p 
ON oi.ProductID = p.ProductID
JOIN Categories as c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName) sub
WHERE rn = 1;

--insert สินค้าใหม่ที่มีสต็อกเป็นศูนย์
INSERT INTO Products(ProductName, CategoryID, Price, Stock)
VALUES ('Keyboard', 1, 39.99, 0);

--Query 6: แสดงสินค้าทั้งหมดที่ของหมดสต็อก (stock = 0)
SELECT * 
FROM Products WHERE Stock = 0;
-- ให้แสดง category name ด้วย
SELECT p.ProductID, p.ProductName, c.CategoryName, p.Stock 
FROM Products as p 
JOIN Categories as c
ON p.CategoryID = c.CategoryID
WHERE Stock = 0;

--Query 7: แสดงลูกค้าที่มีการสั่งซื้อภายใน 30 วันที่ผ่านมา
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers as c 
JOIN Orders as o
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(DAY, -30, GETDATE());

--Query 8: คำนวณจำนวนคำสั่งซื้อทั้งหมดในแต่ละเดือน
SELECT YEAR(OrderDate) as OrderYear,
MONTH(OrderDate) as OrderMonth,
COUNT(OrderID) as TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;

--Query 9: แสดงรายละเอียดของคำสั่งซื้อล่าสุด (ข้อมูลที่ใหม่สุดล่าสุด)
SELECT TOP 1 o.OrderID, o.OrderDate, o.TotalAmount, c.FirstName, c.LastName
FROM Orders as o 
JOIN Customers as c
ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC;

--Query 10: หาค่าเฉลี่ยราคาสินค้าในแต่ละหมวดหมู่
SELECT c.CategoryID, c.CategoryName, AVG(p.Price) as AveragePrice 
FROM Categories as c 
JOIN Products as p
ON c.CategoryID = p.ProductID
GROUP BY c.CategoryID, c.CategoryName;

--Query 11: แสดงรายชื่อลูกค้าที่ไม่เคยสั่งซื้อเลย
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone, O.OrderID, o.TotalAmount
FROM Customers as c 
LEFT OUTER JOIN Orders as o
ON c.CustomerID = o.CustomerID
WHERE o.OrderId IS NULL;

--Query 12: แสดงสินค้าแต่ละตัวขายไปทั้งหมดกี่ชิ้น
SELECT p.ProductID, p.ProductName, SUM(oi.Quantity) as TotalQuantitySold
FROM OrderItems as oi 
JOIN Products as p
ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY  p.ProductName;

--Query 13: คำนวณหารายได้รวมของสินค้าในแต่ละหมวดหมู่
SELECT c.CategoryID, c.CategoryName, SUM(oi.Quantity * oi.Price) as TotalRevenue
FROM OrderItems as oi 
JOIN Products as p
ON oi.ProductID = p.ProductID
JOIN Categories as c
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY TotalRevenue DESC;

--Query 14: แสดงสินค้าที่มีราคาแพงที่สุดในแต่ละหมวดหมู่
SELECT c.CategoryID, c.CategoryName, p1.ProductID, p1.ProductName, p1.Price
FROM Categories as c 
JOIN Products as p1
ON c.CategoryID = p1.CategoryID
WHERE p1.Price = (SELECT Max(Price) FROM Products p2 WHERE p2.CategoryID = p1.CategoryID)
ORDER BY p1.Price DESC;

--Query 15: แสดงรายการออเดอร์ที่มียอดรวมมากกว่าค่าที่กำหนด (>= 49.99)
SELECT o.OrderID, c.CustomerID, c.FirstName, c.LastName, o.TotalAmount
FROM Orders as o 
JOIN Customers as c
ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount >= 49.99
ORDER BY o.TotalAmount DESC;

--Query 16: แสดงรายการสินค้า พร้อมจำนวนออเดอร์ที่สินค้านั้นถูกสั่ง (นับจำนวนออเดอร์ที่มีสินค้านั้น)
SELECT p.ProductID, p.ProductName, COUNT(oi.OrderID) as OrderCount
FROM Products as p 
JOIN OrderItems as oi
ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY OrderCount DESC;

--Query 17: แสดงสินค้า 3 อันดับแรกที่ถูกสั่งบ่อยที่สุด
SELECT TOP 3 p.ProductID, p.ProductName, COUNT(oi.OrderID) as OrderCount
FROM OrderItems as oi 
JOIN  Products as p
ON oi.ProductID = p.ProductID
GROUP BY  p.ProductID, p.ProductName
ORDER BY OrderCount DESC;

--Query 18: คำนวณจำนวนลูกค้าทั้งหมดในแต่ละประเทศ
SELECT Country, COUNT(CustomerID) as TotalCustomers
FROM Customers 
GROUP BY Country 
ORDER BY TotalCustomers DESC;

--Query 19: แสดงรายชื่อลูกค้า และยอดใช้จ่ายรวมของแต่ละคน
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) as TotalSpending
FROM Customers as c 
JOIN Orders as o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;


--Query 20: แสดงออเดอร์ที่มีจำนวนสินค้ามากกว่าค่าที่กำหนด (>= 1)
SELECT o.OrderID, c.CustomerID, c.FirstName, c.LastName, COUNT(oi.OrderItemID) as NumberOfItems
FROM Orders as o 
JOIN OrderItems as oi
ON o.OrderID = oi.OrderID
JOIN Customers as c 
ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(oi.OrderItemID) >= 1
ORDER BY NumberOfItems;







