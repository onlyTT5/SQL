SELECT product_name, sale_price, sale_price * 2 AS "sale_price_*2"
FROM Product;

SELECT product_name, product_type
FROM Product
WHERE sale_price = 500;

SELECT product_name, product_type
FROM Product
WHERE sale_price <> 500;

SELECT product_name, product_type, sale_price
FROM Product
WHERE sale_price >= 1000;

SELECT product_name, product_type, regist_date
FROM Product
WHERE regist_date <= '2009-09-27';

SELECT product_name, sale_price, purchase_price
FROM Product
WHERE sale_price - purchase_price >= 500;