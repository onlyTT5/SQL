--Oracle
--��Product2�ļ�¼��ɾ��Product�ļ�¼
SELECT product_id, product_name
  FROM Product2
MINUS
SELECT product_id, product_name
  FROM Product
ORDER BY product_id;