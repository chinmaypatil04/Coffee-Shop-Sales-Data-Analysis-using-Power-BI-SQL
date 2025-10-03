SELECT
	product_category,
    ROUND(SUM(transaction_qty * unit_price),1) AS total_sales
FROM
	coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5
GROUP BY
	product_category
ORDER BY
	SUM(transaction_qty * unit_price) DESC;
    
    
-- TOP 10 PRODUCT TYPE

SELECT
	product_type,
	ROUND(SUM(transaction_qty * unit_price),1) AS total_sales
FROM
	coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5
GROUP BY
	product_type
ORDER BY
	SUM(unit_price * transaction_qty) DESC
LIMIT 10;
    
    
-- TOP 10 FOR COFFEE

SELECT
	product_type,
	ROUND(SUM(transaction_qty * unit_price),1) AS total_sales
FROM
	coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5 AND product_category = 'Coffee'
GROUP BY
	product_type
ORDER BY
	SUM(unit_price * transaction_qty) DESC
LIMIT 10;

