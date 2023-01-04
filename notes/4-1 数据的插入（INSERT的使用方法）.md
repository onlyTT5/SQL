# 4-1 数据的插入（INSERT的使用方法）

[TOC]

## 什么是INSERT

> 用来装入数据的SQL就是INSERT（插入）

## INSERT语句的基本用法

**语法4-1 INSERT语句**

```sql
INSERT INTO <表名> (列1, 列2, 列3, ......) VALUES (值1, 值2, 值3, ......);
```

> 原则上，执行一次INSERT语句会插入一行数据

## 多行INSERT

```SQL
-- 通常的INSERT
INSERT INTO ProductIns VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO ProductIns VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO ProductIns VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');

-- 多行的INSERT
INSERT INTO ProductIns VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11'),
('0003', '运动T恤', '衣服', 4000, 2800, NULL),
('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');
```

## 列清单省略

> 对全表进行全列INSERT时，可以省略表后的列清单。这是VALUES子句的值会默认按照从左到右的顺序赋给每一列

## 插入NULL

> INSERT语句中想给某一列赋予NULL值时，可以直接在VALUES子句的值清单中写入NULL。想要插入NULL的列一定不能设置NOT NULL约束

## 插入默认值

```sql
CREATE TABLE ProductIns
(
	product_id CHAR(4) NOT NULL,
    sale_price INTEGER DEFAULT 0, -- 销售单价的默认值设定为0
    PRIMARY KEY (product_id)
);
```

### 通过显式方法插入默认值

在VALUES子句中指定==DEFAULT关键字==

```SQL
INSERT INTO ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0007', '擦菜板', '厨房用具', DEFAULT, 790, '2009-04-28');
```

### 通过隐式方法插入默认值

```sql
INSERT INTO ProductIns (product_id, product_name, product_type, purchase_price, regist_date) VALUES ('0007', '擦菜板', '厨房用具',  790, '2009-04-28');
```

> 省略INSERT语句中的列名，就会自动设定为该列的默认值（没有默认值会设定为NULL）

## 从其他表中复制数据

```sql
INSERT INTO ProductCopy (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
SELECT product_id, product_name, product_type, sale_price, purchase_price, regist_date
FROM Product;
```

### 多种多样的SELECT语句

```sql
INSERT INTO ProductType (product_type, sum_sale_price, sum_purchase_price)
SELECT product_type, SUM(sale_price), SUM(purchase_price)
FROM Product
GROUP BY product_type;
```

> INSRET语句的SELECT语句中，可以使用WHERE子句或者GROUP BY子句等任何SQL语法（但使用ORDER BY子句并不会chan'sheng）