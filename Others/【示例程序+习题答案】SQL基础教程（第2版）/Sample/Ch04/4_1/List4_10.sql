-- ����Ʒ���е����ݸ��Ƶ�������Ʒ����
INSERT INTO ProductCopy (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
SELECT product_id, product_name, product_type, sale_price, purchase_price, regist_date
  FROM Product;

-- ȷ�ϸ�����
SELECT * FROM ProductCopy;