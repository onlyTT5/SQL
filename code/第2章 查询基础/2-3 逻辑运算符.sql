SELECT product_name, product_type, sale_price
FROM Product
WHERE sale_price >= 1000;

SELECT product_name, product_type, sale_price
FROM Product
WHERE NOT sale_price >= 1000;

SELECT product_name, product_type, sale_price
FROM Product
WHERE sale_price < 1000;

SELECT product_name, product_type, sale_price
FROM Product
WHERE product_type = '厨房用具' AND sale_price >= 3000;

SELECT product_name, product_type, regist_date
FROM Product
WHERE product_type = '办公用品' AND regist_date = '2009-9-11' OR regist_date = '2009-9-20';

SELECT product_name, product_type, regist_date
FROM Product
WHERE product_type = '办公用品' AND (regist_date = '2009-9-11' OR regist_date = '2009-9-20');