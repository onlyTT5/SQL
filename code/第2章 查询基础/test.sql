SELECT product_name, regist_date
FROM Product
WHERE regist_date >= '2009-4-28';

SELECT product_name, sale_price, purchase_price
FROM Product
WHERE sale_price - purchase_price > 500;

SELECT product_name, sale_price, purchase_price
FROM Product
WHERE sale_price > purchase_price + 500;

SELECT product_name, product_type, sale_price * 0.9 - purchase_price AS profit
FROM Product
WHERE sale_price * 0.9 - purchase_price > 100 AND (product_type = '办公用品' OR product_type = '厨房用具');