DELETE FROM Product;

BEGIN TRANSACTION;

INSERT INTO Product VALUES ('0001', '体恤衫', '衣服', 1000, 500, '2008-09-20');
INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2008-09-11');
INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
-- 代码中有开始事务语句BEGIN TRANSACTION但是缺少事务结束的语句，原表内容不会发生改变

SELECT * FROM Product;

BEGIN TRANSACTION;

INSERT INTO Product VALUES ('0001', '体恤衫', '衣服', 1000, 500, '2008-09-20');
INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2008-09-11');
INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);

COMMIT;

INSERT INTO Product
SELECT * FROM Product;
-- 会出现报错，主键重复导致的报错

-- 商品利润表
CREATE TABLE ProductMargin
(
    product_id CHAR(4) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    sale_price INTEGER ,
    purchase_price INTEGER ,
    margin INTEGER ,
    PRIMARY KEY(product_id)
);

INSERT INTO ProductMargin
SELECT product_id, product_name, sale_price, purchase_price, sale_price - purchase_price
FROM Product;

SELECT * FROM ProductMargin;

BEGIN TRANSACTION;

UPDATE ProductMargin
SET sale_price = 3000
WHERE product_name = '运动T恤';

UPDATE ProductMargin
SET margin = sale_price - purchase_price;

COMMIT;