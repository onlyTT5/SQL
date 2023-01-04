SELECT * FROM Product;

UPDATE Product
SET regist_date = '2009-10-10';

SELECT * FROM Product ORDER BY product_id;

UPDATE Product
SET sale_price *= 10
WHERE product_type = '厨房用具';

UPDATE Product
SET regist_date = NULL
WHERE product_id = '0008';

UPDATE Product
SET sale_price *= 10, purchase_price /= 10
WHERE product_type = '厨房用具';