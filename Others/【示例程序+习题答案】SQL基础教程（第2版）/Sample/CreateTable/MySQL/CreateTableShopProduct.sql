-- DDL��������
CREATE TABLE ShopProduct
(shop_id    CHAR(4)       NOT NULL,
 shop_name  VARCHAR(200)  NOT NULL,
 product_id CHAR(4)       NOT NULL,
 quantity   INTEGER       NOT NULL,
 PRIMARY KEY (shop_id, product_id));

-- DML����������

INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'����',		'0001',	30);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'����',		'0002',	50);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'����',		'0003',	15);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0002',	30);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0003',	120);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0004',	20);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0006',	10);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0007',	40);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'����',		'0003',	20);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'����',		'0004',	50);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'����',		'0006',	90);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'����',		'0007',	70);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000D',	'����',		'0001',	100);

COMMIT;