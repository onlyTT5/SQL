/*
  �����������SELECT���
*/
SELECT product_id, SUM(product_name)
-- ��SELECT����д���
  FROM Product
 GROUP BY product_type
 WHERE regist_date > '2009-09-01';
