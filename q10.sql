
/*
ユーザごとの初回購入を出す
初回購入ごとに商品購入数を出す
商品購入数ごとに商品をソートする
*/

WITH first_order_products AS (
	SELECT
		DISTINCT o.user_id AS user_id,
		MIN(o.order_date) AS first_order_date,
		p.product_id AS first_order_product_id,
		p.medium_category AS m_category,
		p.small_category AS s_category
	FROM orders o
	JOIN products p ON o.order_product_id = p.product_id
	WHERE is_canceled = 0
	GROUP BY o.user_id
)

SELECT
	fp.m_category,
	fp.s_category,
	COUNT(fp.s_category) AS s_count
FROM first_order_products fp
GROUP BY fp.m_category
ORDER BY s_count DESC
