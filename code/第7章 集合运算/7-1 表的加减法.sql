CREATE TABLE Product2
(
    product_id CHAR(4) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_type VARCHAR(32) NOT NULL,
    sale_price INTEGER ,
    purchase_price INTEGER ,
    regist_date DATE ,
    PRIMARY KEY (product_id)
);

BEGIN TRANSACTION;

INSERT INTO Product2 VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');
INSERT INTO Product2 VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO Product2 VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO Product2 VALUES ('0009', '手套', '衣服', 800, 500, NULL);
INSERT INTO Product2 VALUES ('0010', '水壶', '厨房用具', 2000, 1700, '2009-09-20');

COMMIT;

SELECT product_id, product_name
FROM Product
UNION
SELECT product_id, product_name
FROM Product2;

-- 列数不一致会发生错误
SELECT product_id, product_name
FROM Product
UNION
SELECT product_id, product_name, sale_price
FROM Product2;

-- 数据类型不一致会发生错误
SELECT product_id, sale_price
FROM Product
UNION
SELECT product_id, regist_date
FROM Product2;

SELECT product_id, product_name
FROM Product
WHERE product_type = '厨房用具'
UNION
SELECT product_id, product_name
FROM Product2
WHERE product_type = '厨房用具'
ORDER BY product_id;

SELECT product_id, product_name
FROM Product
UNION ALL
SELECT product_id, product_name
FROM Product2;

SELECT product_id, product_name
FROM Product
INTERSECT
SELECT product_id, product_name
FROM Product2
ORDER BY product_id;

SELECT product_id, product_name
FROM Product
EXCEPT
SELECT product_id, product_name
FROM Product2
ORDER BY product_id;

SELECT product_id, product_name
FROM Product2
EXCEPT
SELECT product_id, product_name
FROM Product
ORDER BY product_id;