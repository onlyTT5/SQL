SELECT product_name, sale_price
  FROM Product P
 WHERE EXISTS (SELECT 1 -- ���������дǡ���ĳ���
                 FROM ShopProduct SP
                WHERE SP.shop_id = '000C'
                  AND SP.product_id = P.product_id);