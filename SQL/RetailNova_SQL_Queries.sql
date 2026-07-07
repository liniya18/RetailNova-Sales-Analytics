-- ==========================================
-- RetailNova Sales Analytics SQL Queries
-- Author: Liniya Crishel Saldanha
-- ==========================================

-- 1. View all records
SELECT * FROM Sales_Data;

-- 2. Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM Sales_Data;

-- 3. Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM Sales_Data;

-- 4. Monthly Sales
SELECT MONTH(Order_Date) AS Month,
       SUM(Sales) AS Total_Sales
FROM Sales_Data
GROUP BY MONTH(Order_Date)
ORDER BY Month;

-- 5. Yearly Sales
SELECT YEAR(Order_Date) AS Year,
       SUM(Sales) AS Total_Sales
FROM Sales_Data
GROUP BY YEAR(Order_Date)
ORDER BY Year;

-- 6. Top 5 States by Sales
SELECT State,
       SUM(Sales) AS Total_Sales
FROM Sales_Data
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 5;

-- 7. Highest Profit Product
SELECT Product_Name,
       SUM(Profit) AS Total_Profit
FROM Sales_Data
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 1;

-- 8. Categories with Sales > 1000000
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM Sales_Data
GROUP BY Category
HAVING SUM(Sales) > 1000000;

-- 9. Orders Above Average Sales
SELECT *
FROM Sales_Data
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM Sales_Data
);

-- 10. Profit Margin
SELECT
    (SUM(Profit)/SUM(Sales))*100 AS Profit_Margin
FROM Sales_Data;
