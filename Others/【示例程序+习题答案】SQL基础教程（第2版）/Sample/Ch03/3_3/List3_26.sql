SELECT product_type, COUNT(*)
  FROM Product
WHERE product_type = '�·�'
 GROUP BY product_type;