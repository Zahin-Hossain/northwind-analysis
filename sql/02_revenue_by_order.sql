-- Calculates total revenue per order by joining Orders to Order Details
SELECT o.OrderID, FORMAT(SUM((od.UnitPrice * od.Quantity)*(1-od.Discount)), 'N2') OrderTotal
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY o.OrderID