SELECT * FROM Product;

SELECT * FROM ShopProduct;

SELECT SP.shop_id, SP.shop_name, P.product_id, P.product_name, P.sale_price
FROM ShopProduct AS SP INNER JOIN Product AS P -- 1
ON SP.product_id = P.product_id;

SELECT SP.shop_id, SP.shop_name, P.product_id, P.product_name, P.sale_price
FROM ShopProduct AS SP INNER JOIN Product AS P -- 1
ON SP.product_id = P.product_id
WHERE SP.shop_id = '000A';

CREATE VIEW ProductJoinShopProduct
AS
SELECT SP.shop_id, SP.shop_name, P.product_id, P.product_name, P.sale_price
FROM ShopProduct AS SP INNER JOIN Product AS P -- 1
ON SP.product_id = P.product_id;

SELECT * FROM ProductJoinShopProduct;

SELECT SP.shop_id, SP.shop_name, P.product_id, P.product_name, P.sale_price
FROM ShopProduct AS SP RIGHT OUTER JOIN Product AS P
ON SP.product_id = P.product_id;

SELECT SP.shop_id, SP.shop_name, P.product_id, P.product_name, P.sale_price
FROM ShopProduct AS SP LEFT OUTER JOIN Product AS P
ON SP.product_id = P.product_id;

CREATE TABLE InventoryProduct
(
    inventory_id CHAR(4) NOT NULL,
    product_id VARCHAR(4) NOT NULL,
    inventory_quantity INTEGER NOT NULL,
    PRIMARY KEY (inventory_id, product_id)
);

BEGIN TRANSACTION;

INSERT INTO InventoryProduct VALUES ('P001', '0001', 0);
INSERT INTO InventoryProduct VALUES ('P001', '0002', 120);
INSERT INTO InventoryProduct VALUES ('P001', '0003', 200);
INSERT INTO InventoryProduct VALUES ('P001', '0004', 3);
INSERT INTO InventoryProduct VALUES ('P001', '0005', 0);
INSERT INTO InventoryProduct VALUES ('P001', '0006', 99);
INSERT INTO InventoryProduct VALUES ('P001', '0007', 999);
INSERT INTO InventoryProduct VALUES ('P001', '0008', 200);
INSERT INTO InventoryProduct VALUES ('P002', '0001', 10);
INSERT INTO InventoryProduct VALUES ('P002', '0002', 25);
INSERT INTO InventoryProduct VALUES ('P002', '0003', 34);
INSERT INTO InventoryProduct VALUES ('P002', '0004', 19);
INSERT INTO InventoryProduct VALUES ('P002', '0005', 99);
INSERT INTO InventoryProduct VALUES ('P002', '0006', 0);
INSERT INTO InventoryProduct VALUES ('P002', '0007', 0);
INSERT INTO InventoryProduct VALUES ('P002', '0008', 18);

COMMIT;

SELECT * FROM InventoryProduct;

SELECT SP.shop_id, SP.shop_name, P.product_id, P.product_name, P.sale_price, IP.inventory_quantity
FROM ShopProduct AS SP INNER JOIN Product AS P -- 1
ON SP.product_id = P.product_id
INNER JOIN InventoryProduct AS IP -- 2
ON SP.product_id = IP.product_id
WHERE IP.inventory_id = 'P001';

SELECT SP.shop_id, SP.shop_name, P.product_id, P.product_name
FROM ShopProduct AS SP CROSS JOIN Product AS P; -- 1

SELECT SP.shop_id, SP.shop_name, SP.product_id, P.product_name, P.sale_price
FROM ShopProduct SP, Product P
WHERE SP.product_id = P.product_id
AND SP.shop_id = '000A';

CREATE TABLE Skills
(
    skill VARCHAR(32) ,
    PRIMARY KEY (skill)
);

CREATE TABLE EmpSkills
(
    emp VARCHAR(32),
    skill VARCHAR(32),
    PRIMARY KEY (emp, skill)
);

BEGIN TRANSACTION;

INSERT INTO Skills VALUES ('Oracle');
INSERT INTO Skills VALUES ('UNIX');
INSERT INTO Skills VALUES ('Java');

INSERT INTO EmpSkills VALUES ('相田', 'Oracle');
INSERT INTO EmpSkills VALUES ('相田', 'UNIX');
INSERT INTO EmpSkills VALUES ('相田', 'Java');
INSERT INTO EmpSkills VALUES ('相田', 'C#');
INSERT INTO EmpSkills VALUES ('神崎', 'Oracle');
INSERT INTO EmpSkills VALUES ('神崎', 'UNIX');
INSERT INTO EmpSkills VALUES ('神崎', 'Java');
INSERT INTO EmpSkills VALUES ('平井', 'UNIX');
INSERT INTO EmpSkills VALUES ('平井', 'Oracle');
INSERT INTO EmpSkills VALUES ('平井', 'PHP');
INSERT INTO EmpSkills VALUES ('平井', 'Perl');
INSERT INTO EmpSkills VALUES ('平井', 'C++');
INSERT INTO EmpSkills VALUES ('若田部', 'Perl');
INSERT INTO EmpSkills VALUES ('渡来', 'Oracle');

COMMIT;

SELECT DISTINCT Emp
FROM EmpSkills ES1
WHERE NOT EXISTS (SELECT skill
    FROM Skills
    EXCEPT
    SELECT skill
    FROM EmpSkills ES2
    WHERE ES1.emp = ES2.emp);