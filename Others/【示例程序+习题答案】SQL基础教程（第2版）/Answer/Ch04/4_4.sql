-- 1.�µ����۵���
UPDATE ProductMargin
   SET sale_price = 3000
 WHERE product_id = '0003';

-- 2.�����ټ���
UPDATE ProductMargin
   SET margin = sale_price - purchase_price
 WHERE product_id = '0003';

-- ȷ�����ݸ���
SELECT * FROM ProductMargin;
