/*
  �����������е�SELECT���
*/
-- ����ͼ�����1�м�¼
INSERT INTO ViewPractice5_1 VALUES ('��', 300, '2009-11-02');


-- ʵ���Ϻ������INSERT�����ͬ
INSERT INTO Product (product_id, product_name, product_type, sale_price, purchase_price, regist_date) 
            VALUES (NULL, '��', NULL, 300, NULL, '2009-11-02');



/*
  ʹ��PostgreSQLʱ����Ҫ��INSERT֮ǰ
  ִ��������佫��ͼ�趨Ϊ���Ը���
*/
CREATE OR REPLACE RULE insert_rule5_1
AS ON INSERT
TO ViewPractice5_1 DO INSTEAD
INSERT INTO Product (product_name, sale_price, regist_date)
VALUES (new.product_name, new.sale_price, new.regist_date);


/* 
  ���������趨֮���ٴ�ִ��INSERTʱ����������������NOT NULLԼ������������
postgres=# INSERT INTO ViewPractice5_1 VALUES ('��', 300, '2009-11-02');
ERROR:  null value in column ��product_id" violates not-null constraint
*/
