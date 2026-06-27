SELECT 
    SUM(CASE WHEN review_comment_message LIKE '%atraso%' 
               OR review_comment_message LIKE '%nao recebi%' 
               OR review_comment_message LIKE '%demorou%' THEN 1 ELSE 0 END) AS logistics_complaints,
    SUM(CASE WHEN review_comment_message LIKE '%pessimo produto%' 
               OR review_comment_message LIKE '%ruim%' 
               OR review_comment_message LIKE '%defeito%' THEN 1 ELSE 0 END) AS product_quality_complaints,
    COUNT(review_id) AS total_bad_reviews
FROM olist_order_reviews_dataset
WHERE review_score <= 2 
  AND review_comment_message IS NOT NULL;