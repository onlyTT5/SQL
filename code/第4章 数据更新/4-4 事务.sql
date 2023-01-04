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

BEGIN TRANSACTION;

-- 将运动T恤的销售单价降低1000日元
UPDATE Product
SET sale_price -= 1000
WHERE product_name = '运动T恤';

-- 将T恤衫的销售单价上浮1000日元
UPDATE Product
SET sale_price += 1000
WHERE product_name = 'T恤衫';

COMMIT;

SELECT * FROM Product;

BEGIN TRANSACTION;

-- 将运动T恤的销售单价降低1000日元
UPDATE Product
SET sale_price -= 1000
WHERE product_name = '运动T恤';

-- 将T恤衫的销售单价上浮1000日元
UPDATE Product
SET sale_price += 1000
WHERE product_name = 'T恤衫';

ROLLBACK;