WITH user_freq AS (
	SELECT
		users.user_id,
		COUNT (DISTINCT order_date) AS freq
	FROM orders
	LEFT JOIN users ON  orders.user_id = users.user_id
	WHERE orders.is_canceled = 0
	AND users.is_deleted = 0
	AND orders.order_date BETWEEN '2022-01-01' AND '2022-12-31'
	GROUP BY users.user_id
)

SELECT
	freq,
	COUNT(user_id) AS user_count
FROM user_freq
GROUP BY freq
ORDER BY freq;
