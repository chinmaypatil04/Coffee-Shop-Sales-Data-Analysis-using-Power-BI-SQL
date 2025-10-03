SELECT COUNT(transaction_id) as total_orders
FROM coffee_shop_sales
WHERE 
MONTH(transaction_date) = 5; -- March MONTH


SELECT 
MONTH(transaction_date) AS month,
ROUND(COUNT(transaction_id)) as total_orders,
(COUNT(transaction_id) - LAG(COUNT(transaction_id),1)
OVER (ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id),1)
OVER(ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) IN (4,5) -- FOR APRIL TO MAY
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date)