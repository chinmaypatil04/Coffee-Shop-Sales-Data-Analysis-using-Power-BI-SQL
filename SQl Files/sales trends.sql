SELECT 
	CONCAT(ROUND(AVG(total_sales)/1000,1),'K') AS avg_sales
FROM
	(
    SELECT SUM(unit_price * transaction_qty)AS total_sales
    FROM 
		coffee_shop_sales
    WHERE
		MONTH(transaction_date) = 4
    GROUP BY
		transaction_date
        ) AS internal_query;
        
 
 -- sales by days of months  per day 
SELECT 
    DAY(transaction_date) AS day_of_month,
    ROUND(SUM(unit_price * transaction_qty),1) AS total_sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5  -- Filter for May
GROUP BY 
    DAY(transaction_date)
ORDER BY
	DAY(transaction_date);


-- sales by days of months  status     
SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        DAY(transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffee_shop_sales
    WHERE 
        MONTH(transaction_date) = 5  -- Filter for May
    GROUP BY 
        DAY(transaction_date)
) AS sales_data
ORDER BY 
    day_of_month;




