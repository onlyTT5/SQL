SELECT product_id, product_name, purchase_price
FROM Product;

SELECT * FROM Product;

SELECT
product_id AS id,
product_name AS name,
purchase_price AS price
FROM Product;

SELECT
product_id AS "商品编号",
product_name AS "商品名称",
purchase_price AS "进货单价"
FROM Product;

SELECT '商品' AS string, 38 AS number, '2009-02-24' AS date, product_id, product_name
FROM Product;

SELECT DISTINCT product_type
FROM Product;

SELECT DISTINCT purchase_price
FROM Product;

SELECT DISTINCT product_type, regist_date
FROM Product;

SELECT product_name, product_type
FROM Product
WHERE product_type = '衣服';

SELECT product_name
FROM Product
WHERE product_type = '衣服';

-- 本SELECT语句会从结果中删除重复行
SELECT DISTINCT product_id, purchase_price
FROM Product;

/* 本SELECT语句，
会从结果中删除重复行*/
SELECT DISTINCT product_id, purchase_price
FROM Product;
