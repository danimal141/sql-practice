SELECT
	DISTINCT orders.user_id,
FROM orders
JOIN products ON orders.order_product_id = products.product_id
WHERE is_canceled = 0
AND products.large_category = '食品'
AND orders.order_date = '2022-01-01'
GROUP BY user_id
