SELECT purchase_price, COUNT(*)
  FROM Product
 WHERE product_type = '�·�'
 GROUP BY purchase_price;