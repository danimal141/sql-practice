WITH target_users AS (
	SELECT
		DISTINCT orders.user_id AS user_id
	FROM orders
	JOIN products ON orders.order_product_id = products.product_id
	WHERE is_canceled = 0
	AND products.medium_category = '美容'
	GROUP BY orders.user_id
)

SELECT
	p.medium_category,
	COUNT(DISTINCT user_id) as uid
FROM orders o
JOIN products p ON o.order_product_id = p.product_id
WHERE o.user_id IN (SELECT user_id from target_users)
AND p.medium_category <> '美容'
GROUP BY p.medium_category
ORDER BY uid DESC;
