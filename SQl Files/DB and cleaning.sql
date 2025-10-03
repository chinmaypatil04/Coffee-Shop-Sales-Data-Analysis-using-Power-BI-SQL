CREATE DATABASE coffee_shop_sales_db;

USE coffee_shop_sales_db;

SELECT * FROM  coffee_shop_sales;

DESCRIBE coffee_shop_sales;

UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date,"%d/%m/%Y");

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time,"%H:%i:%s");

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;

ALTER TABLE coffee_shop_sales
CHANGE COLUMN ï»¿transaction_id transaction_id INT PRIMARY KEY;

SELECT CONCAT((ROUND(SUM(unit_price * transaction_qty)))/1000,"K") AS Total_sales
FROM coffee_shop_sales
WHERE 
MONTH(transaction_date) = 5; -- MAY MONTH


SELECT 
    MONTH(transaction_date) AS month,   -- numbers of months
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,  -- total sales column
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1)  -- month sales diff
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1)  -- divide by pm sale
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage   -- percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for months of April(pm) and May(cm)
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);
