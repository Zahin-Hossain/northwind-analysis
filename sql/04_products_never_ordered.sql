-- Finds products with zero recorded orders using LEFT JOIN + NULL filter (anti-join pattern)
SELECT p.ProductName ProductsNeverOrdered
FROM Products p
LEFT JOIN [Order Details] od ON p.productID = od.ProductID
WHERE od.OrderID IS NULL
ORDER BY p.ProductName