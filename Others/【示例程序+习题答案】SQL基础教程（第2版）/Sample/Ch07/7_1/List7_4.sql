SELECT product_id, product_name
  FROM Product
 WHERE product_type = '�����þ�'
UNION
SELECT product_id, product_name
  FROM Product2
 WHERE product_type = '�����þ�'
ORDER BY product_id;