SELECT product_type, AVG(sale_price)
  FROM Product
 GROUP BY product_type
HAVING AVG(sale_price) > (SELECT AVG(sale_price)
                              FROM Product);


/* �����䲻�Ǳ����Ӳ�ѯ�����Բ���д��SELECT�Ӿ�֮�У��ᷢ������*/
SELECT product_id, 
       product_name, 
       sale_price,
       (SELECT AVG(sale_price)
          FROM Product
         GROUP BY product_type) AS avg_price
  FROM Product;