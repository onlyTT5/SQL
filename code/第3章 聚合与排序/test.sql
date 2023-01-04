SELECT product_id, product_type, SUM(sale_price)
FROM Product
WHERE regist_date > '2009-09-01'
GROUP BY product_type, product_id;

SELECT product_type, SUM(sale_price), SUM(purchase_price)
FROM Product
GROUP BY product_type
HAVING SUM(sale_price) > SUM(purchase_price) * 1.5;

SELECT product_id, product_name, product_type, sale_price, purchase_price, regist_date
FROM Product
ORDER BY regist_date DESC, sale_price;