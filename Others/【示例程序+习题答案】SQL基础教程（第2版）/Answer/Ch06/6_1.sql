/*
  �����������е�SELECT���
*/
-- ��
SELECT product_name, purchase_price
  FROM Product
 WHERE purchase_price NOT IN (500, 2800, 5000);

-- ��
SELECT product_name, purchase_price
  FROM Product
 WHERE purchase_price NOT IN (500, 2800, 5000, NULL);
