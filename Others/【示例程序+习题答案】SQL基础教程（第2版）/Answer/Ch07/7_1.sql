/*
  �����������е�SELECT���
*/
-- ʹ�ñ�����ʹ�õ�Product��
SELECT *
  FROM Product
UNION
SELECT *
  FROM Product
INTERSECT
SELECT *
  FROM Product
ORDER BY product_id;