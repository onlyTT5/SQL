/* 
  ��PostgreSQL��ִ�д����嵥5-6��INSERT���֮ǰ
  ����Ҫִ�����´��뽫��ͼ����Ϊ���Ը��¡�
*/
CREATE OR REPLACE RULE insert_rule
AS ON INSERT
TO  ProductJim DO INSTEAD
INSERT INTO Product VALUES (
           new.product_id, 
           new.product_name, 
           new.product_type, 
           new.sale_price, 
           new.purchase_price, 
           new.regist_date);