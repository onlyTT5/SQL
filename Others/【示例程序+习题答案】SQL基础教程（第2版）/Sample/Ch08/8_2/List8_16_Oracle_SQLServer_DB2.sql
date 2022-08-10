--Oracle, SQL Server, DB2
SELECT CASE WHEN GROUPING(product_type) = 1 
            THEN '��Ʒ���� �ϼ�' 
            ELSE product_type END AS product_type,
       CASE WHEN GROUPING(regist_date) = 1 
            THEN '�Ǽ����� �ϼ�' 
            ELSE CAST(regist_date AS VARCHAR(16)) END AS regist_date,
       SUM(sale_price) AS sum_price
  FROM Product
 GROUP BY ROLLUP(product_type, regist_date);