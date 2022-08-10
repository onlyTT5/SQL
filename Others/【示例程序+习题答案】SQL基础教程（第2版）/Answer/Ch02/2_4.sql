SELECT product_name, product_type,
       sale_price * 0.9 - purchase_price AS profit
  FROM Product
 WHERE sale_price * 0.9 - purchase_price > 100
   AND (   product_type = '�칫��Ʒ'
        OR product_type = '�����þ�');