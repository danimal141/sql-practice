WITH user_freq AS (
	SELECT
		users.user_id,
		COUNT (DISTINCT order_date) AS freq
	FROM users
	LEFT JOIN orders ON  users.user_id = orders.user_id
	WHERE orders.is_canceled = 0 OR orders.is_canceled IS NULL
	AND users.is_deleted = 0
	GROUP BY users.user_id
)

SELECT
	freq,
	COUNT(user_id) AS user_count
FROM user_freq
GROUP BY freq
ORDER BY freq;
