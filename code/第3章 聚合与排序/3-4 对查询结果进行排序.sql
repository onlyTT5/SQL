SELECT product_id, product_name, product_type, sale_price, purchase_price
FROM Product;

SELECT product_id, product_name, product_type, sale_price, purchase_price
FROM Product
ORDER BY sale_price;

SELECT product_id, product_name, product_type, sale_price, purchase_price
FROM Product
ORDER BY sale_price DESC;

SELECT product_id, product_name, product_type, sale_price, purchase_price
FROM Product
ORDER BY sale_price, product_id;

SELECT product_id, product_name, product_type, sale_price, purchase_price
FROM Product
ORDER BY purchase_price;

SELECT product_id AS id, product_name, product_type, sale_price AS sp, purchase_price
FROM Product
ORDER BY sp, id;

SELECT product_name, sale_price, purchase_price
FROM Product
ORDER BY product_id;

SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type
ORDER BY COUNT(*);

SELECT product_id, product_name, sale_price, purchase_price
FROM Product
ORDER BY sale_price DESC, product_id;

SELECT product_id, product_name, product_type, sale_price, purchase_price
FROM Product
ORDER BY 3 DESC, 1;