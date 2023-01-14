CREATE TABLE SampleLike
(
    strcol VARCHAR(6) NOT NULL,
    PRIMARY KEY (strcol)
);

BEGIN TRANSACTION;

INSERT INTO SampleLike (strcol) VALUES ('abcddd');
INSERT INTO SampleLike (strcol) VALUES ('dddabc');
INSERT INTO SampleLike (strcol) VALUES ('abdddc');
INSERT INTO SampleLike (strcol) VALUES ('abcdd');
INSERT INTO SampleLike (strcol) VALUES ('ddabc');
INSERT INTO SampleLike (strcol) VALUES ('abddc');

COMMIT;

SELECT * FROM SampleLike WHERE strcol LIKE 'ddd%';

SELECT * FROM SampleLike WHERE strcol LIKE '%ddd%';

SELECT * FROM SampleLike WHERE strcol LIKE '%ddd';

SELECT * FROM SampleLike WHERE strcol LIKE 'abc__';

SELECT * FROM SampleLike WHERE strcol LIKE 'abc___';

SELECT product_name, sale_price
FROM Product
WHERE sale_price BETWEEN 100 AND 1000;

SELECT product_name, sale_price
FROM Product
WHERE sale_price > 100 AND sale_price < 1000;

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price IS NULL;

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price IS NOT NULL;

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price IN (320, 500, 5000);

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price NOT IN (320, 500, 5000);

CREATE TABLE ShopProduct
(
    shop_id CHAR(4) NOT NULL,
    shop_name VARCHAR(200) NOT NULL,
    product_id CHAR(4) NOT NULL,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (shop_id, product_id)
);

BEGIN TRANSACTION;

INSERT INTO ShopProduct VALUES ('000A', '东京', '0001', 30);
INSERT INTO ShopProduct VALUES ('000A', '东京', '0002', 50);
INSERT INTO ShopProduct VALUES ('000A', '东京', '0003', 15);
INSERT INTO ShopProduct VALUES ('000B', '名古屋', '0002', 30);
INSERT INTO ShopProduct VALUES ('000B', '名古屋', '0003', 120);
INSERT INTO ShopProduct VALUES ('000B', '名古屋', '0004', 20);
INSERT INTO ShopProduct VALUES ('000B', '名古屋', '0006', 10);
INSERT INTO ShopProduct VALUES ('000B', '名古屋', '0007', 40);
INSERT INTO ShopProduct VALUES ('000C', '大阪', '0003', 20);
INSERT INTO ShopProduct VALUES ('000C', '大阪', '0004', 50);
INSERT INTO ShopProduct VALUES ('000C', '大阪', '0006', 90);
INSERT INTO ShopProduct VALUES ('000C', '大阪', '0007', 70);
INSERT INTO ShopProduct VALUES ('000D', '福冈', '0001', 100);

COMMIT;

SELECT * FROM ShopProduct;

SELECT shop_id
FROM ShopProduct
WHERE shop_id = '000C';

SELECT product_name, sale_price
FROM Product
WHERE product_id IN (SELECT product_id
    FROM ShopProduct
    WHERE shop_id = '000C');

SELECT product_name, sale_price
FROM Product
WHERE product_id NOT IN (SELECT product_id
    FROM ShopProduct
    WHERE shop_id = '000A');

SELECT product_name, sale_price
FROM Product AS P
WHERE EXISTS (SELECT *
    FROM ShopProduct AS SP
    WHERE SP.shop_id = '000C'
    AND SP.product_id = P.product_id);

SELECT product_name, sale_price
FROM Product AS P
WHERE EXISTS (SELECT 1
    FROM ShopProduct AS SP
    WHERE SP.shop_id = '000C'
    AND SP.product_id = P.product_id);

SELECT product_name, sale_price
FROM Product AS P
WHERE NOT EXISTS (SELECT *
    FROM ShopProduct AS SP
    WHERE SP.shop_id = '000A'
    AND SP.product_id = P.product_id);