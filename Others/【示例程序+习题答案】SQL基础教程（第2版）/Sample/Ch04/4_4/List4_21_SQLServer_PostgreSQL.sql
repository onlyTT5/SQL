--SQL Server, PostgreSQL
BEGIN TRANSACTION;

    -- �˶�T�������۵����µ�1000��Ԫ
    UPDATE Product
       SET sale_price = sale_price - 1000
     WHERE product_name = '�˶�T��';

    -- T�������۵����ϸ�1000��Ԫ
    UPDATE Product
       SET sale_price = sale_price + 1000
     WHERE product_name = 'T��';

COMMIT;