-- Full sales report: one row per order line, joining 5 tables (Orders, Customers, Employees, Order Details, Products, Categories)
-- This is the dataset exported to Python for visualization
SELECT o.OrderDate, cx.CompanyName, e.FirstName+' '+e.LastName SalesRep, p.ProductName, ctg.CategoryName, od.Quantity, od.UnitPrice, od.Discount, (od.UnitPrice * od.Quantity) * (1 - od.Discount) LineRevenue
FROM Orders o
JOIN Customers cx ON o.CustomerID = cx.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories ctg ON p.CategoryID = ctg.CategoryID
ORDER BY o.OrderDate