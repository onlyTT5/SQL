SELECT product_name,
    CASE WHEN product_type = '衣服'
        THEN 'A:' + product_type
        WHEN product_type = '办公用品'
        THEN 'B:' + product_type
        WHEN product_type = '厨房用具'
        THEN 'C:' + product_type
        ELSE NULL
    END AS abc_product_type
FROM Product;

SELECT product_type, SUM(sale_price) AS sum_price
FROM Product
GROUP BY product_type;

SELECT SUM(CASE WHEN product_type = '衣服'
    THEN sale_price ELSE 0 END) AS sum_price_clothes,
    SUM(CASE WHEN product_type = '办公用品'
    THEN sale_price ELSE 0 END) AS sum_price_kitchen,
    SUM(CASE WHEN product_type = '厨房用具'
    THEN sale_price ELSE 0 END) AS sum_price_office
FROM Product;

-- 使用搜索CASE表达式的情况
SELECT product_name,
    CASE WHEN product_type = '衣服'
        THEN 'A:' + product_type
        WHEN product_type = '办公用品'
        THEN 'B:' + product_type
        WHEN product_type = '厨房用具'
        THEN 'C:' + product_type
        ELSE NULL
    END AS abc_product_type
FROM Product;

-- 使用简单CASE表达式的情况
SELECT product_name,
    CASE product_type
        WHEN '衣服' THEN 'A:' + product_type
        WHEN '办公用品' THEN 'B:' + product_type
        WHEN '厨房用具' THEN 'C:' + product_type
        ELSE NULL
    END AS abc_product_type
FROM Product;