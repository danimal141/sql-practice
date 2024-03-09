SELECT
    substr(order_date, 1, 7) AS month,
    SUM(price) AS monthly_sales,
    COUNT(*) AS monthly_order_count
FROM orders
INNER JOIN products ON orders.order_product_id = products.product_id
WHERE is_canceled = 0
GROUP BY month
