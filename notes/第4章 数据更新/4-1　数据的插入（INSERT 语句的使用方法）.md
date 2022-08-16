# 4-1　数据的插入（`INSERT` 语句的使用方法）

[toc]

## 什么是 `INSERT`

**图4-1　INSERT（插入）的流程**

![{%}](D:/GitRep/SQL/notes/%E7%AC%AC4%E7%AB%A0%20%E6%95%B0%E6%8D%AE%E6%9B%B4%E6%96%B0/4-1%E3%80%80%E6%95%B0%E6%8D%AE%E7%9A%84%E6%8F%92%E5%85%A5%EF%BC%88INSERT%20%E8%AF%AD%E5%8F%A5%E7%9A%84%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95%EF%BC%89.assets/Image00079-16606123007693.gif)

**代码清单 4-1　创建 `ProductIns` 表的`CREATE TABLE` 语句***

```sql
CREATE TABLE ProductIns
(product_id      CHAR(4)      NOT NULL,
 product_name    VARCHAR(100) NOT NULL,
 product_type    VARCHAR(32)  NOT NULL,
 sale_price      INTEGER      DEFAULT 0,
 purchase_price  INTEGER      ,
 regist_date     DATE         ,
 PRIMARY KEY (product_id));
```

如前所述，这里仅仅是创建出了一个表，并没有插入数据。接下来，我们就向 `ProductIns` 表中插入数据。

## `INSERT` 语句的基本语法

**语法 4-1　`INSERT` 语句**

```sql
INSERT INTO <表名> (列1, 列2, 列3, ……) VALUES (值1, 值2, 值3, ……);
```

例如，我们要向 `ProductIns` 表中插入一行数据，各列的值如下所示。

| `product_id`  （商品编号） | `product_name`  （商品名称） | `product_type`  （商品种类） | `sale_price`  （销售单价） | `purchase_price`  （进货单价） | `regist_date`  （登记日期） |
| :------------------------: | :--------------------------: | :--------------------------: | :------------------------: | :----------------------------: | :-------------------------: |
|           `0001`           |            T 恤衫            |             衣服             |           `1000`           |             `500`              |        `2009-09-20`         |

**代码清单 4-2　向表中插入一行数据**

```sql
INSERT INTO ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');
```

> 当然，表名后面的列清单和 `VALUES` 子句中的值清单的列数必须保持一致。如下所示，列数不一致时会出错，无法插入数据。

将列名和值用逗号隔开，分别括在（）内，这种形式称为**清单** 。代码清单 4-2 中的 INSERT 语句包含如下两个清单。

**列清单** →`(product_id, product_name, product_type, sale_price, purchase_price, regist_date)`

**值清单** →`('0001', 'T恤衫', '衣服', 1000, 500,'2009-09-20')`

> 此外，原则上，执行一次 `INSERT` 语句会插入一行数据 3 。因此，插入多行时，通常需要循环执行相应次数的 `INSERT`语句。
>
> 插入多行的情况，请参考专栏“多行 `INSERT` ”。

**代码清单4-A　通常的`INSERT` 和多行`INSERT`**

```sql
-- 通常的INSERT
INSERT INTO ProductIns VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO ProductIns VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO ProductIns VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');

-- 多行INSERT （Oracle以外）
INSERT INTO ProductIns VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11'),
('0003', '运动T恤', '衣服', 4000, 2800, NULL),
('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');
```

## 列清单的省略

对表进行全列 `INSERT` 时，可以省略表名后的列清单。这时 `VALUES` 子句的值会默认按照从左到右的顺序赋给每一列。

**代码清单 4-3　省略列清单**

```sql
-- 包含列清单
INSERT INTO ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');

-- 省略列清单
INSERT INTO ProductIns VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');
```

## 插入 `NULL`

想要插入 `NULL` 的列一定不能设置 `NOT NULL` 约束。向设置了 `NOT NULL` 约束的列中插入 `NULL` 时，`INSERT` 语句会出错，导致数据插入失败。

## 插入默认值

我们可以通过“`DEFAULT < 默认值 >` ”的形式来设定默认值。

**代码清单 4-5　创建 `ProductIns` 表的`CREATE TABLE` 语句（节选）**

```SQL
CREATE TABLE ProductIns
(product_id     CHAR(4)  NOT NULL,
         （略）
 sale_price      INTEGER  DEFAULT 0, -- 销售单价的默认值设定为0;
         （略）
 PRIMARY KEY (product_id));
```

- **通过显式方法插入默认值**

  *代码清单 4-6　通过显式方法设定默认值**

  ```sql
  INSERT INTO ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0007', '擦菜板', '厨房用具', DEFAULT, 790, '2009-04-28');
  ```

- **通过隐式方法设定默认值**

  ```sql
  INSERT INTO ProductIns (product_id, product_name, product_type, purchase_price, regist_date) VALUES ('0007', '擦菜板', '厨房用具', 790, '2009-04-28');
  ```

> 建议大家使用显式的方法。因为这样可以一目了然地知道 `sale_price` 列使用了默认值，SQL 语句的含义也更加容易理解。
>
> 说到省略列名，还有一点要说明一下。如果省略了没有设定默认值的列，该列的值就会被设定为 `NULL` 。因此，如果省略的是设置了 `NOT NULL` 约束的列，`INSERT` 语句就会出错（代码清单 4-8）。请大家一定要注意。

**代码清单 4-8　未设定默认值的情况**

```SQL
-- 省略purchase_price列（无约束）：会赋予“NULL”
INSERT INTO ProductIns (product_id, product_name, product_type, sale_price, regist_date) VALUES ('0008', '圆珠笔', '办公用品', 100, '2009-11-11');

-- 省略product_name列（设置了NOT NULL约束）：错误！
INSERT INTO ProductIns (product_id, product_type, sale_price,purchase_price, regist_date) VALUES ('0009', '办公用品', 1000, 500, '2009-12-12');
```

> 省略`INSERT` 语句中的列名，就会自动设定为该列的默认值（没有默认值时会设定为`NULL` ）。

## 从其他表中复制数据

要插入数据，除了使用 `VALUES` 子句指定具体的数据之外，还可以从其他表中复制数据。

首先得创建一张表

**代码清单 4-9　创建 `ProductCopy` 表的`CREATE TABLE` 语句**

```SQL
-- 用来插入数据的商品复制表
CREATE TABLE ProductCopy
(product_id      CHAR(4)      NOT NULL,
 product_name    VARCHAR(100) NOT NULL,
 product_type    VARCHAR(32)  NOT NULL,
 sale_price      INTEGER      ,
 purchase_price  INTEGER      ,
 regist_date     DATE         ,
 PRIMARY KEY (product_id));
```

**代码清单 4-10　`INSERT ... SELECT` 语句**

```sql
-- 将商品表中的数据复制到商品复制表中
INSERT INTO ProductCopy (product_id, product_name, product_type, sale_price, purchase_price, regist_date)
SELECT product_id, product_name, product_type, sale_price, purchase_price, regist_date
  FROM Product;
```

执行该 **`INSERT … SELECT` 语句** 时，如果原来 `Product` 表中有 8 行数据，那么 `ProductCopy` 表中也会插入完全相同的 8 行数据。当然，`Product` 表中的原有数据不会发生改变。因此，`INSERT … SELECT` 语句可以在需要进行数据备份时使用

![{%}](D:/GitRep/SQL/notes/%E7%AC%AC4%E7%AB%A0%20%E6%95%B0%E6%8D%AE%E6%9B%B4%E6%96%B0/4-1%E3%80%80%E6%95%B0%E6%8D%AE%E7%9A%84%E6%8F%92%E5%85%A5%EF%BC%88INSERT%20%E8%AF%AD%E5%8F%A5%E7%9A%84%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95%EF%BC%89.assets/Image00081-16606151689128.gif)

- **多种多样的 `SELECT` 语句**

该 `INSERT` 语句中的 `SELECT` 语句，也可以使用 `WHERE` 子句或者 `GROUP BY` 子句等。

接下来我们尝试一下使用包含 `GROUP BY` 子句的 `SELECT` 语句进行插入。

**代码清单 4-11　创建 `ProductType` 表的`CREATE TABLE` 语句**

```sql
-- 根据商品种类进行汇总的表；
CREATE TABLE ProductType
(product_type       VARCHAR(32)     NOT NULL,
 sum_sale_price     INTEGER         ,
 sum_purchase_price INTEGER         ,
 PRIMARY KEY (product_type));
```

**代码清单 4-12　插入其他表中数据合计值的`INSERT ... SELECT` 语句**执行结果****

```sql
INSERT INTO ProductType (product_type, sum_sale_price, sum_purchase_price)
SELECT product_type, SUM(sale_price), SUM(purchase_price)
  FROM Product
 GROUP BY product_type;
```

**执行结果**

```sql
 product_type | sum_sale_price  | sum_purchase_price
--------------+-----------------+--------------------
 衣服         |            5000 |               3300
 办公用品     |             600 |                320
 厨房用具     |           11180 |               8590
```