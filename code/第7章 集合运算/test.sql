SELECT * FROM Product
UNION
SELECT * FROM Product
INTERSECT
SELECT * FROM Product
ORDER BY product_id;

SELECT COALESCE(SP.shop_id, '不确定') AS shop_id, COALESCE(SP.shop_name, '不确定') AS shop_name, P.product_id, P.product_name, P.sale_price
FROM ShopProduct AS SP RIGHT OUTER JOIN Product AS P
ON SP.product_id = P.product_id;