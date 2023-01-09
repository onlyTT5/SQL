-- 按照商品种类计算平均价格
SELECT AVG(sale_price)
FROM Product
GROUP BY product_type;

-- 发生错误的子查询
SELECT product_id, product_name, sale_price
FROM Product
WHERE sale_price > (SELECT AVG(sale_price)
FROM Product
GROUP BY product_type);

SELECT product_type, product_name, sale_price
FROM Product AS P1
WHERE sale_price > (SELECT AVG(sale_price)
FROM Product AS P2
WHERE P1.product_type = P2.product_type
GROUP BY product_type);

-- 错误的关联子查询
SELECT product_type, product_name, sale_price
FROM Product AS P1
WHERE P1.product_type = P2.product_type
AND sale_price > (SELECT AVG(sale_price)
    FROM Product AS P2
    GROUP BY product_type);

SELECT product_type, product_name, sale_price
FROM Product AS P1
WHERE sale_price > (SELECT AVG(sale_price)
    FROM Product AS P2
    WHERE P1.product_type = P2.product_type
    GROUP BY product_type);