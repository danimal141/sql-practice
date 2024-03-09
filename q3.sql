SELECT
    order_date,
    SUM(price) AS daily_sales,
    COUNT(*) AS daily_order_count
FROM orders
INNER JOIN products ON orders.order_product_id = products.product_id
WHERE is_canceled = 0
GROUP BY order_date
