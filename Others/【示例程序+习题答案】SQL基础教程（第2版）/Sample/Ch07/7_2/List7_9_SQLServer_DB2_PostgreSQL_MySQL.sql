--SQL Server, DB2, PostgreSQL, MySQL
SELECT SP.shop_id, SP.shop_name, SP.product_id, P.product_name, P.sale_price
  FROM ShopProduct AS SP INNER JOIN Product AS P
    ON SP.product_id = P.product_id;