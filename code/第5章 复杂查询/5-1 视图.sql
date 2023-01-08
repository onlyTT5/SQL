DELETE FROM Product;

BEGIN TRANSACTION;

INSERT INTO Product VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');

INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');

INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);

INSERT INTO Product VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');

INSERT INTO Product VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');

INSERT INTO Product VALUES ('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20');

INSERT INTO Product VALUES ('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28');

INSERT INTO Product VALUES ('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11');

COMMIT;

SELECT product_type, SUM(sale_price), SUM(purchase_price)
FROM Product
GROUP BY product_type;

CREATE VIEW ProductSum (product_type, cnt_product)
AS
SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type;

SELECT * FROM ProductSum;

CREATE VIEW ProductSumJim (product_type, cnt_product)
AS
SELECT product_type, cnt_product
FROM ProductSum
WHERE product_type = '办公用品';

SELECT * FROM ProductSumJim;

-- 不能像这样定义视图
CREATE VIEW ProductSum (product_type, cnt_product)
AS
SELECT product_type, COUNT(*)
FROM Product
GROUP BY product_type
ORDER BY product_type;

INSERT INTO ProductSum VALUES ('电器制品', 5);

CREATE VIEW ProductJim (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
AS
SELECT * FROM Product
WHERE product_type = '办公用品';    -- 既没有聚合也没有结合的语句

SELECT * FROM ProductJim;

INSERT INTO ProductJim VALUES ('0009', '印章', '办公用品', 95, 10, '2009-11-30');

SELECT * FROM Product;

DROP VIEW ProductSum;

DELETE FROM Product
WHERE product_id = '0009';

SELECT * FROM Product;