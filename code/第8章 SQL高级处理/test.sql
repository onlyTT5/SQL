SELECT product_id, product_name, sale_price, MAX(sale_price) OVER (ORDER BY product_id) AS current_max_price
FROM Product;

SELECT regist_date, product_name, sale_price, SUM(sale_price) OVER (ORDER BY regist_date) AS current_sum_price
FROM Product
ORDER BY regist_date;