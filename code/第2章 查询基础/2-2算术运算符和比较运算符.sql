SELECT product_name, sale_price, sale_price * 2 AS "sale_price_*2"
FROM Product;

SELECT product_name, product_type
FROM Product
WHERE sale_price = 500;

SELECT product_name, product_type
FROM Product
WHERE sale_price <> 500;

SELECT product_name, product_type, sale_price
FROM Product
WHERE sale_price >= 1000;

SELECT product_name, product_type, regist_date
FROM Product
WHERE regist_date <= '2009-09-27';

SELECT product_name, sale_price, purchase_price
FROM Product
WHERE sale_price - purchase_price >= 500;

CREATE TABLE Chars
(
    chr CHAR(3) NOT NULL,
    PRIMARY KEY (chr)
);

BEGIN TRANSACTION;

INSERT INTO Chars VALUES ('1');
INSERT INTO Chars VALUES ('2');
INSERT INTO Chars VALUES ('3');
INSERT INTO Chars VALUES ('10');
INSERT INTO Chars VALUES ('11');
INSERT INTO Chars VALUES ('222');

COMMIT;

SELECT chr
FROM Chars
WHERE chr >= '2';

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price = 2800;

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price <> 2800;

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price = NULL;

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price IS NULL;

SELECT product_name, purchase_price
FROM Product
WHERE purchase_price IS NOT NULL;