CREATE VIEW ProductSumJim (product_type, cnt_product)
AS
SELECT product_type, cnt_product
  FROM ProductSum
 WHERE product_type = '�칫��Ʒ';

-- ȷ�ϴ����õ���ͼ
SELECT product_type, cnt_product
  FROM ProductSumJim;