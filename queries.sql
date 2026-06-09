--Обзор таблицы
SELECT * FROM SalesData LIMIT 10;

--Общая выручка и прибыль
SELECT 
    SUM(Sales) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM SalesData;

--Выручка по категориям товаров (от большего к меньшему)
SELECT 
    Category,
    SUM(Sales) AS Total_Sales
FROM SalesData
GROUP BY Category
ORDER BY Total_Sales DESC;

--Топ-10 самых продаваемых подкатегорий
SELECT 
    Sub_Category,
    SUM(Sales) AS Total_Sales
FROM SalesData
GROUP BY Sub_Category
ORDER BY Total_Sales DESC
LIMIT 10;

--Прибыль по месяцам
SELECT 
    strftime('%Y-%m', Order_Date) AS Month,
    SUM(Profit) AS Monthly_Profit
FROM SalesData
GROUP BY Month
ORDER BY Month;

--Анализ скидок: средняя прибыль при разных уровнях скидки
SELECT 
    Discount,
    AVG(Profit) AS Avg_Profit
FROM SalesData
GROUP BY Discount
ORDER BY Discount;