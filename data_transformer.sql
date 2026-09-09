-- ============================================================
--              PROJECT: Data Transformer
-- ============================================================

-- ------------------------------------------------------------
-- 1. DATABASE SCHEMA SETUP
-- ------------------------------------------------------------

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Populate Sample Data
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);


-- ------------------------------------------------------------
-- 2. ALL PROJECT QUERIES (1 - 17)
-- ------------------------------------------------------------

-- Task 1: INNER JOIN - Retrieve all orders and customer details where orders exist
SELECT 
    o.OrderID, 
    c.CustomerID, 
    c.FirstName, 
    c.LastName, 
    c.Email, 
    o.OrderDate, 
    o.TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;


-- Task 2: LEFT JOIN - Retrieve all customers and their corresponding orders (if any)
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.LastName, 
    o.OrderID, 
    o.OrderDate, 
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;


-- Task 3: RIGHT JOIN - Retrieve all orders and their corresponding customers (if any)
SELECT 
    o.OrderID, 
    o.OrderDate, 
    o.TotalAmount, 
    c.CustomerID, 
    c.FirstName, 
    c.LastName
FROM Orders o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID;


-- Task 4: FULL OUTER JOIN - Retrieve all customers and all orders, regardless of matching
SELECT 
    c.CustomerID, c.FirstName, c.LastName, 
    o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT 
    c.CustomerID, c.FirstName, c.LastName, 
    o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Task 5: Subquery - Find customers who have placed orders worth more than the average amount
SELECT DISTINCT 
    c.CustomerID, 
    c.FirstName, 
    c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);


-- Task 6: Subquery - Find employees with salaries above the average salary
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


-- Task 7: Extract Year and Month from OrderDate
SELECT 
    OrderID, 
    OrderDate,
    EXTRACT(YEAR FROM OrderDate) AS OrderYear,
    EXTRACT(MONTH FROM OrderDate) AS OrderMonth
FROM Orders;


-- Task 8: Calculate difference in days between order date and current date
SELECT 
    OrderID, 
    OrderDate,
    DATEDIFF(CURRENT_DATE, OrderDate) AS DaysSinceOrder
FROM Orders;


-- Task 9: Format OrderDate to a readable string (e.g., 'DD-MMM-YYYY')
SELECT 
    OrderID, 
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedOrderDate
FROM Orders;


-- Task 10: Concatenate FirstName and LastName to form full name
SELECT 
    CustomerID, 
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;


-- Task 11: Replace part of a string (e.g., replace 'John' with 'Jonathan')
SELECT 
    CustomerID, 
    REPLACE(FirstName, 'John', 'Jonathan') AS ModifiedFirstName
FROM Customers;


-- Task 12: Convert FirstName to uppercase and LastName to lowercase
SELECT 
    CustomerID, 
    UPPER(FirstName) AS UpperFirstName, 
    LOWER(LastName) AS LowerLastName
FROM Customers;


-- Task 13: Trim extra spaces from Email field
SELECT 
    CustomerID, 
    TRIM(Email) AS CleanedEmail
FROM Customers;


-- Task 14: Calculate running total of TotalAmount for each order
SELECT 
    OrderID, 
    OrderDate, 
    TotalAmount,
    SUM(TotalAmount) OVER (ORDER BY OrderDate, OrderID) AS RunningTotal
FROM Orders;


-- Task 15: Rank orders based on TotalAmount using RANK() function
SELECT 
    OrderID, 
    TotalAmount,
    RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
FROM Orders;


-- Task 16: Assign a discount based on TotalAmount in orders
SELECT 
    OrderID, 
    TotalAmount,
    CASE 
        WHEN TotalAmount > 1000 THEN '10% off'
        WHEN TotalAmount > 500 THEN '5% off'
        ELSE 'No Discount'
    END AS DiscountApplied
FROM Orders;


-- Task 17: Categorize employees' salaries as high, medium, or low
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    Salary,
    CASE 
        WHEN Salary >= 80000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;