--Oracle
--Oracle��ʹ��DECODE����CASE���ʽ
SELECT  product_name,
        DECODE(product_type, '�·�',     'A��' || product_type,
                              '�칫��Ʒ', 'B��' || product_type,
                              '�����þ�', 'C��' || product_type,
               NULL) AS abc_product_type
  FROM Product;