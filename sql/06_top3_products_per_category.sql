-- Ranks products by revenue within each category using RANK() window function
-- Then filters to top 3 per category via a two-CTE structure
WITH ProductSales AS (
    SELECT ctg.CategoryName, p.ProductName, SUM((od.UnitPrice * od.Quantity) * (1 - od.Discount)) ProductRevenue
    FROM [Order Details] od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories ctg ON p.CategoryID = ctg.CategoryID
    GROUP BY ctg.CategoryName, p.ProductName
),
RankedProducts AS(
    SELECT *,
    RANK() OVER (PARTITION BY CategoryName ORDER BY ProductRevenue DESC) AS RevenueRank
    FROM ProductSales
)
SELECT *
FROM RankedProducts
WHERE RevenueRank <= 3
ORDER BY CategoryName, RevenueRank