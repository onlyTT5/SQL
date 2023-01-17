SELECT product_type, SUM(sale_price)
FROM Product
GROUP BY product_type;

SELECT '合计' AS product_type, SUM(sale_price)
FROM Product
UNION ALL
SELECT product_type, SUM(sale_price)
FROM Product
GROUP BY product_type;

SELECT product_type, SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type);

SELECT product_type, regist_date, SUM(sale_price) AS sum_price
FROM Product
GROUP BY product_type, regist_date;

SELECT product_type, regist_date, SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type, regist_date);

SELECT GROUPING(product_type) AS product_type, GROUPING(regist_date) AS regist_date, SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type, regist_date);

SELECT CASE WHEN GROUPING(product_type) = 1
    THEN '商品种类 合计'
    ELSE product_type END AS product_type,
    CASE WHEN GROUPING(regist_date) = 1
    THEN '登记日期 合计'
    ELSE CAST(regist_date AS VARCHAR) END AS regist_date,
    SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type, regist_date);

SELECT CASE WHEN GROUPING(product_type) = 1
    THEN '商品种类 合计'
    ELSE product_type END AS product_type,
    CASE WHEN GROUPING(regist_date) = 1
    THEN '登记日期 合计'
    ELSE CAST(regist_date AS VARCHAR) END AS regist_date,
    SUM(sale_price) AS sum_price
FROM Product
GROUP BY CUBE(product_type, regist_date);

SELECT CASE WHEN GROUPING(product_type) = 1
    THEN '商品种类 合计'
    ELSE product_type END AS product_type,
    CASE WHEN GROUPING(regist_date) = 1
    THEN '登记日期 合计'
    ELSE CAST(regist_date AS VARCHAR) END AS regist_date,
    SUM(sale_price) AS sum_price
FROM Product
GROUP BY GROUPING SETS (product_type, regist_date);

