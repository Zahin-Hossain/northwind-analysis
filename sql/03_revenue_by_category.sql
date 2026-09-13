-- Total revenue by product category, joining Order Details -> Products -> Categories
SELECT c.CategoryName, FORMAT(SUM((od.UnitPrice*od.Quantity)*(1-od.Discount)), 'N2') CategoryRevenue
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY CategoryRevenue DESC