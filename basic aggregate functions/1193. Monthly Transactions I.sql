SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 ELSE NULL END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    COALESCE(SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END), 0) AS approved_total_amount
FROM 
    Transactions
GROUP BY 
    month, country;
