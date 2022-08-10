SELECT product_name,
       CASE WHEN product_type = '�·�'    THEN 'A��' || product_type
            WHEN product_type = '�칫��Ʒ' THEN 'B��' || product_type
            WHEN product_type = '�����þ�' THEN 'C��' || product_type
            ELSE NULL
       END AS abc_product_type i
  FROM Product;