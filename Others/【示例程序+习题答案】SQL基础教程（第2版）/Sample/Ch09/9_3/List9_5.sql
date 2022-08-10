/* List9-5 ����Product���SQL��� */
--�������ݿ�shop
CREATE DATABASE shop;

--ʹ��"\q"��ʱ��psql�ǳ�,�ٴ�ͨ��������ʾ���������ݿ�shop
C:\PostgreSQL\9.5\bin\psql.exe -U postgres -d shop

--����Product��
CREATE TABLE Product
(product_id CHAR(4) NOT NULL,
 product_name VARCHAR(100) NOT NULL,
 product_type VARCHAR(32) NOT NULL,
 sale_price INTEGER ,
 purchase_price INTEGER ,
 regist_date DATE ,
 PRIMARY KEY (product_id));

--������Ʒ����
BEGIN TRANSACTION;
INSERT INTO Product VALUES ('0001', 'T��', '�·�', 1000, 500, '2009-09-20');
INSERT INTO Product VALUES ('0002', '�����', '�칫��Ʒ', 500, 320, '2009-09-11');
INSERT INTO Product VALUES ('0003', '�˶�T��', '�·�', 4000, 2800, NULL);
INSERT INTO Product VALUES ('0004', '�˵�', '�����þ�', 3000, 2800, '2009-09-20');
INSERT INTO Product VALUES ('0005', '��ѹ��', '�����þ�', 6800, 5000, '2009-01-15');
INSERT INTO Product VALUES ('0006', '����', '�����þ�', 500, NULL, '2009-09-20');
INSERT INTO Product VALUES ('0007', '���˰�', '�����þ�', 880, 790, '2008-04-28');
INSERT INTO Product VALUES ('0008', 'Բ���', '�칫��Ʒ', 100, NULL, '2009-11-11');
COMMIT;