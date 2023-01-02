SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type
HAVING COUNT(*) = 2;

SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type;

SELECT product_type, AVG(sale_price)
FROM Product
GROUP BY product_type;

SELECT product_type, AVG(sale_price)
FROM Product
GROUP BY product_type
HAVING AVG(sale_price) >= 2500;

-- HABING子句不正确使用方法
SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type
HAVING product_name = '圆珠笔';

SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type
HAVING product_type = '衣服';

SELECT product_type, COUNT(*)
FROM Product
WHERE product_type = '衣服'
GROUP BY product_type;