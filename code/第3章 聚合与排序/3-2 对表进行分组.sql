SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type;

SELECT purchase_price, COUNT(*)
FROM Product
GROUP BY purchase_price;

SELECT purchase_price, COUNT(*)
FROM Product
WHERE product_type = '衣服'
GROUP BY purchase_price;

-- 使用GROUP BY子句时，SELECT子句中不能出现聚合键之外的列名
SELECT product_name, purchase_price, COUNT(*)
FROM Product
GROUP BY purchase_price;

-- 在GROUP BY子句中不能使用SELECT子句中定义的别名
SELECT product_type AS pt, COUNT(*)
FROM Product
GROUP BY pt;

SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type;

SELECT product_type, COUNT(*)
FROM Product
WHERE COUNT(*) = 2
GROUP BY product_type;

SELECT DISTINCT product_type
FROM Product;

SELECT product_type
FROM Product
GROUP BY product_type;