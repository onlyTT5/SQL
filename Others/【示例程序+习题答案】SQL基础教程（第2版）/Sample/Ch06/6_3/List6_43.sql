--�԰�����Ʒ����õ������۵��ۺϼ�ֵ��������ת��
SELECT SUM(CASE WHEN product_type = '�·�'    THEN sale_price ELSE 0 END) AS sum_price_clothes,
       SUM(CASE WHEN product_type = '�����þ�' THEN sale_price ELSE 0 END) AS sum_price_kitchen,
       SUM(CASE WHEN product_type = '�칫��Ʒ' THEN sale_price ELSE 0 END) AS sum_price_office
  FROM Product;