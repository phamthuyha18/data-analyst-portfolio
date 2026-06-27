SELECT 
    CASE 
        WHEN DATEDIFF(i.shipping_limit_date, o.order_purchase_timestamp) <= 2 THEN '1. Chuẩn bị nhanh (<=2 ngày)'
        WHEN DATEDIFF(i.shipping_limit_date, o.order_purchase_timestamp) BETWEEN 3 AND 5 THEN '2. Chuẩn bị trung bình (3-5 ngày)'
        ELSE '3. Chuẩn bị rất chậm (>5 ngày)'
    END AS seller_processing_speed,
    COUNT(DISTINCT o.order_id) AS canceled_orders_count,
    ROUND(COUNT(DISTINCT o.order_id) * 100.0 / SUM(COUNT(DISTINCT o.order_id)) OVER(), 2) AS percentage
FROM olist_orders_dataset o
JOIN olist_order_items_dataset i ON o.order_id = i.order_id
WHERE o.order_status = 'canceled'
GROUP BY seller_processing_speed
ORDER BY seller_processing_speed