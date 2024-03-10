SELECT
	user_id,
	MAX(order_date) AS last_order_date,
	COUNT (DISTINCT order_date) AS freq,
	SUM(price) AS sum_price
FROM orders
INNER JOIN products ON orders.order_product_id = products.product_id
WHERE is_canceled = 0 AND user_id IS NOT NULL
GROUP BY user_id

