--������Ʒ����ͳ����Ʒ��������ͼ
CREATE VIEW ProductSum (product_type, cnt_product)
AS
SELECT product_type, COUNT(*)
  FROM Product
 GROUP BY product_type;

--ȷ�ϴ��������ͼ
SELECT product_type, cnt_product
  FROM ProductSum;

--ɾ��ProductSum
DROP VIEW ProductSum;