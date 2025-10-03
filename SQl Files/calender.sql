SELECT * FROM coffee_shop_sales;

SELECT 
	CONCAT(ROUND(SUM(transaction_qty * unit_price)/1000,1), 'K') AS total_sales,
    CONCAT(ROUND(SUM(transaction_qty)/1000,1),'K') AS total_quantity_sold,
    CONCAT(ROUND(COUNT(transaction_id)/1000,1),'K') AS total_orrders
FROM
	coffee_shop_sales
WHERE
	transaction_date = "2023-03-27";
    
-- weekends and weekdays 1 - SUN .... 7-SAT


SELECT
	CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekend'
	ELSE 'Weekdays'
    END AS day_type,
    CONCAT(ROUND(SUM(unit_price * transaction_qty)/1000,1),'K') AS total_sales
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date) = 2
GROUP BY
	CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekend'
	ELSE 'Weekdays'
    END;
	
	-- STORE LOCATION
    
SELECT store_location,
		CONCAT(ROUND(SUM(unit_price * transaction_qty)/1000,1),'K') AS total_sales
FROM
		coffee_shop_sales
WHERE
	MONTH(transaction_date) = 5
GROUP BY
	store_location
ORDER BY
	SUM(unit_price * transaction_qty) DESC;
	
    
    