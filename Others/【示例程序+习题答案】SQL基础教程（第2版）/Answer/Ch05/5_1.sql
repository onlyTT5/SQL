/*
  �����������е�SELECT���
*/
-- ȷ����ͼ����
SELECT * FROM ViewPractice5_1;


/*
  �����ǽ��ʾ��
*/
-- ������ͼ�����
CREATE VIEW ViewPractice5_1 AS
SELECT product_name, sale_price, regist_date
  FROM Product
 WHERE sale_price >= 1000
   AND regist_date = '2009-09-20';
