-- 1
SELECT product_name, purchase_price
FROM Product
WHERE purchase_price NOT IN (500, 2800, 5000);

-- 2
SELECT product_name, purchase_price
FROM Product
WHERE purchase_price NOT IN (500, 2800, 5000, NULL);
-- NOT IN的参数中不能包含NULL

SELECT COUNT(CASE WHEN sale_price <= 1000
        THEN product_name ELSE NULL END) AS low_price,
        COUNT(CASE WHEN sale_price > 1000 AND sale_price <= 3000
        THEN product_name ELSE NULL END) AS mid_price,
        COUNT(CASE WHEN sale_price > 3000
        THEN product_name ELSE NULL END) AS high_price
FROM Product;