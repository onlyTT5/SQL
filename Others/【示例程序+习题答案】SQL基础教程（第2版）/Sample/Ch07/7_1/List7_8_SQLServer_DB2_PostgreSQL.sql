--SQL Server, DB2, PostgreSQL
--��Product2�ļ�¼��ɾ��Product�ļ�¼
SELECT product_id, product_name
  FROM Product2
EXCEPT
SELECT product_id, product_name
  FROM Product
ORDER BY product_id;