/* ע������1 */
--������һ��ʱ�ᷢ������
SELECT product_id, product_name
  FROM Product
UNION
SELECT product_id, product_name, sale_price
  FROM Product2;

/* ע������2 */
--�������Ͳ�һ��ʱ�ᷢ������
SELECT product_id, sale_price
  FROM Product
UNION
SELECT product_id, regist_date
  FROM Product2;
