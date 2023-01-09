CREATE VIEW ViewPractice5_1 (product_name, sale_price, regist_date)
AS
SELECT product_name, sale_price, regist_date
FROM Product
WHERE sale_price >= 1000 AND regist_date = '2009-09-20';

SELECT * FROM ViewPractice5_1;

-- Product有NOT NULL约束
INSERT INTO ViewPractice5_1 VALUES ('刀子', 300, '2009-11-02');

SELECT product_id, product_name, product_type, sale_price, (SELECT AVG(sale_price) FROM Product) AS sale_price_all
FROM Product;

CREATE VIEW AvgPriceByType (product_id, product_name, product_type, sale_price, avg_sale_pirce)
AS
SELECT product_id, product_name, product_type, sale_price, (SELECT AVG(sale_price)
    FROM Product AS P2 
    WHERE P1.product_type = P2.product_type
    GROUP BY product_type)
FROM Product AS P1;

SELECT * FROM AvgPriceByType;