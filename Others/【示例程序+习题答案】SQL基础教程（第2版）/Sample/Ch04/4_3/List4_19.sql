-- ʹ�ö��Ŷ��н��зָ�����
UPDATE Product
   SET sale_price = sale_price * 10,
       purchase_price = purchase_price / 2
 WHERE product_type = '�����þ�';

-- ȷ�ϸ��½��
SELECT * FROM Product ORDER BY product_id;