DELETE FROM Product;

BEGIN TRANSACTION;

INSERT INTO Product VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2008-09-20');
INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2008-09-11');
INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);

-- 缺少结束语句

BEGIN TRANSACTION;

INSERT INTO Product VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2008-09-20');
INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2008-09-11');
INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);

COMMIT;

SELECT * FROM Product;

INSERT INTO Product
SELECT *
FROM Product;

-- 主键冲突

CREATE TABLE ProductMargin
(
    product_id CHAR(4) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    sale_price INTEGER ,
    purchase_price INTEGER ,
    margin INTEGER ,
    PRIMARY KEY (product_id)
);

BEGIN TRANSACTION;

INSERT INTO ProductMargin (product_id, product_name, sale_price, purchase_price, margin)
SELECT product_id, product_name, sale_price, purchase_price, sale_price - purchase_price
FROM Product;

COMMIT;

SELECT * FROM ProductMargin;

-- 这里涉及到多个操作，需要用到事务
BEGIN TRANSACTION;

UPDATE ProductMargin
SET sale_price = 3000
WHERE product_name = '运动T恤';

UPDATE ProductMargin
SET margin = sale_price - purchase_price
WHERE product_name = '运动T恤';

COMMIT;