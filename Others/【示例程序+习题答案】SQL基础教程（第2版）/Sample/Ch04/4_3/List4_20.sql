-- ������С�������������б���ʽ
UPDATE Product
   SET (sale_price, purchase_price) = (sale_price * 10, purchase_price / 2)
 WHERE product_type = '�����þ�';

-- ȷ�ϸ�������
SELECT * FROM Product ORDER BY product_id;