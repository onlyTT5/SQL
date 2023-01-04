CREATE TABLE ProductIns
(
    product_id CHAR(4) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_type VARCHAR(32) NOT NULL,
    sale_price INTEGER DEFAULT 0,
    purchase_price INTEGER ,
    regist_date DATE,
    PRIMARY KEY (product_id)
);

INSERT INTO ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');

-- 通常的INSERT
INSERT INTO ProductIns VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO ProductIns VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO ProductIns VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');

-- 多行的INSERT
INSERT INTO ProductIns VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11'),
('0003', '运动T恤', '衣服', 4000, 2800, NULL),
('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');

INSERT INTO ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0007', '擦菜板', '厨房用具', DEFAULT, 790, '2009-04-28');

SELECT *
FROM ProductIns
WHERE product_id = '0007';

INSERT INTO ProductIns (product_id, product_name, product_type, purchase_price, regist_date) VALUES ('0007', '擦菜板', '厨房用具',  790, '2009-04-28');

CREATE TABLE ProductCopy
(
    product_id CHAR(4) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_type VARCHAR(32) NOT NULL,
    sale_price INTEGER ,
    purchase_price INTEGER ,
    regist_date DATE ,
    PRIMARY KEY (product_id)
);

-- 将商品表中的数据复制到商品复制表中
INSERT INTO ProductCopy (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
SELECT product_id, product_name, product_type, sale_price, purchase_price, regist_date
FROM Product;

-- 根据商品种类进行汇总的表;
CREATE TABLE ProductType
(
    product_type VARCHAR(32) NOT NULL,
    sum_sale_price INTEGER,
    sum_purchase_price INTEGER,
    PRIMARY KEY (product_type)
);

INSERT INTO ProductType (product_type, sum_sale_price, sum_purchase_price)
SELECT product_type, SUM(sale_price), SUM(purchase_price)
FROM Product
GROUP BY product_type;

SELECT * FROM ProductType;