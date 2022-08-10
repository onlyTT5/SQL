/*
 ɾ��Product�������ݵ�DELETE���
 ���ָ���ʹ��CREATE TABLE����ʱ����Ϊ�յ�״̬��
*/
DELETE FROM Product;


/*
  �����������SELECT���
*/
-- A����ִ�У�SQL Server��PostgreSQL�������
BEGIN TRANSACTION;
    INSERT INTO Product VALUES ('0001', 'T��', '�·�', 1000, 500, '2009-09-20');
    INSERT INTO Product VALUES ('0002', '�����', '�칫��Ʒ', 500, 320, '2009-09-11');
    INSERT INTO Product VALUES ('0003', '�˶�T��', '�·�', 4000, 2800, NULL);

-- A����ִ�У�MySQL�������
START TRANSACTION;
    INSERT INTO Product VALUES ('0001', 'T��', '�·�', 1000, 500, '2009-09-20');
    INSERT INTO Product VALUES ('0002', '�����', '�칫��Ʒ', 500, 320, '2009-09-11');
    INSERT INTO Product VALUES ('0003', '�˶�T��', '�·�', 4000, 2800, NULL);

-- A����ִ�У�Oracle��DB2�������
INSERT INTO Product VALUES ('0001', 'T��', '�·�', 1000, 500, '2009-09-20');
INSERT INTO Product VALUES ('0002', '�����', '�칫��Ʒ', 500, 320, '2009-09-11');
INSERT INTO Product VALUES ('0003', '�˶�T��', '�·�', 4000, 2800, NULL);

-- B����ִ��
SELECT * FROM Product;
