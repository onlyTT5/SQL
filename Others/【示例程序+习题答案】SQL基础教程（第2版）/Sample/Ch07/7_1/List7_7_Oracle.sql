--Oracle�в�ʹ��EXCEPT��ʹ��MINUS
SELECT product_id, product_name
  FROM Product
MINUS
SELECT product_id, product_name
  FROM Product2
ORDER BY product_id;