--MySQL
-- MySQL��ʹ��IF����CASE���ʽ
SELECT  product_name,
        IF( IF( IF(product_type = '�·�',  CONCAT('A��', product_type), NULL)
            	    IS NULL AND product_type = '�칫��Ʒ', CONCAT('B��', product_type), 
            	IF(product_type = '�·�',  CONCAT('A��', product_type), NULL))
                    IS NULL AND product_type = '�����þ�', CONCAT('C��', product_type), 
                    IF( IF(product_type = '�·�',  CONCAT('A��', product_type), NULL)
            	    IS NULL AND product_type = '�칫��Ʒ', CONCAT('B��', product_type), 
            	IF(product_type = '�·�',  CONCAT('A��', product_type), NULL))) AS abc_product_type
  FROM Product;