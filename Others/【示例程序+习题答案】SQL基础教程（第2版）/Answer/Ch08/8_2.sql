-- ��regist_dateΪNULLʱ����ʾ��1��1��1�ա���
SELECT regist_date, product_name, sale_price,
       SUM (sale_price) OVER (ORDER BY COALESCE(regist_date, CAST('0001-01-01' AS DATE))) AS current_sum_price
  FROM Product;

-- ��regist_dateΪNULLʱ�����ü�¼������ǰ��ʾ��
SELECT regist_date, product_name, sale_price,
       SUM (sale_price) OVER (ORDER BY regist_date NULLS FIRST) AS current_sum_price
  FROM Product;