-- ʹ�ü�CASE���ʽ�����
SELECT product_name,
       CASE product_type
            WHEN '�·�'    THEN 'A��' || product_type
            WHEN '�칫��Ʒ' THEN 'B��' || product_type
            WHEN '�����þ�' THEN 'C��' || product_type
            ELSE NULL
        END AS abc_product_type
  FROM Product;



--List6-A
--ʹ�ò�ѯCASE���ʽ������������嵥6-41�ٿ���
SELECT product_name,
       CASE WHEN product_type = '�·�'    THEN 'A��' || product_type
            WHEN product_type = '�칫��Ʒ' THEN 'B��' || product_type
            WHEN product_type = '�����þ�' THEN 'C��' || product_type
            ELSE NULL
       END AS abc_product_type
  FROM Product;

