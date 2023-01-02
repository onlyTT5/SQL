SELECT COUNT(*)
FROM Product;

SELECT COUNT(purchase_price)
FROM Product;

CREATE TABLE NULLTbl
(
    col_1 CHAR
);

BEGIN TRANSACTION;

INSERT INTO NULLTbl VALUES (NULL);
INSERT INTO NULLTbl VALUES (NULL);
INSERT INTO NULLTbl VALUES (NULL);

COMMIT;

SELECT COUNT(*), COUNT(col_1)
FROM NULLTbl;

SELECT SUM(sale_price)
FROM Product;

SELECT SUM(sale_price), SUM(purchase_price)
FROM Product;

SELECT AVG(sale_price)
FROM Product;

SELECT AVG(sale_price), AVG(purchase_price)
FROM Product;

SELECT MAX(sale_price), MIN(purchase_price)
FROM Product;

SELECT MAX(regist_date), MIN(regist_date)
FROM Product;

SELECT COUNT(DISTINCT product_type)
FROM Product;

SELECT DISTINCT COUNT(product_type)
FROM Product;

SELECT SUM(sale_price), SUM(DISTINCT sale_price)
FROM Product;