SELECT 
    CASE 
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date) <= 0 THEN 'Đúng hạn/Sớm'
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date) BETWEEN 1 AND 2 THEN 'Trễ 1-2 ngày'
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date) BETWEEN 3 AND 4 THEN 'Trễ 3-4 ngày'
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date) BETWEEN 5 AND 6 THEN 'Trễ 5-6 ngày'
        ELSE 'Trễ từ 7 ngày'
    END AS delay_segment,
    COUNT(o.order_id) AS total_orders,
    ROUND(COUNT(o.order_id) * 100.0 / SUM(COUNT(o.order_id)) OVER(), 2) AS percentage,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered' 
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY delay_segment
ORDER BY delay_segment