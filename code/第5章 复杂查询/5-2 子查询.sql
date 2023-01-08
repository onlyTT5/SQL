-- 根据商品种类统计商品数量的视图
CREATE VIEW ProuductSum(product_type, cnt_product)
AS
SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type;

SELECT * FROM ProductSum;

SELECT product_type, cnt_product
FROM (SELECT product_type, COUNT(*) AS cnt_product
    FROM Product
    GROUP BY product_type) AS ProductSum;

SELECT product_type, cnt_product
FROM (SELECT * 
    FROM (SELECT product_type, COUNT(*) AS cnt_product
        FROM Product
        GROUP BY product_type) AS ProductSum
    WHERE cnt_product = 4) AS ProductSum2;

-- 在WHERE子句中不能使用聚合函数
SELECT product_id, product_name, sale_price
FROM Product
WHERE sale_price > AVG(sale_price);

SELECT AVG(sale_price) FROM Product;

SELECT product_id, product_name, sale_price
FROM Product
WHERE sale_price > (SELECT AVG(sale_price) FROM Product);

SELECT product_id, product_name, sale_price, (SELECT AVG(sale_price) FROM Product) AS avg_price
FROM Product;

SELECT product_type, AVG(sale_price)
FROM Product
GROUP BY product_type
HAVING AVG(sale_price) > (SELECT AVG(sale_price) FROM Product);

-- 由于不是标量子查询，因此不能在SELECT子句中使用
SELECT product_id, product_name, sale_price, (SELECT AVG(sale_price)
    FROM Product
    GROUP BY product_type) AS avg_price
FROM Product;