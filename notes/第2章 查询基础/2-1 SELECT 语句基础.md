# 2-1 `SELECT` 语句基础

[toc]

## 列的查询

> 从表中选取数据时需要使用 **`SELECT` 语句** ，也就是只从表中选出（SELECT）必要数据的意思。通过 `SELECT` 语句查询并选取出必要数据的过程称为**匹配查询** 或**查询** （query）。

**语法 2-1　基本的 `SELECT` 语句**

```sql
SELECT <列名>，……
 FROM <表名>
```

## 查询出表中所有的列

想要查询出全部列时，可以使用代表所有列的**星号（`\*` ）** 。

**语法 2-2　查询全部的列**

```sql
SELECT *
  FROM <表名>;
```

- 星号（`*` ）代表全部列的意思。

## 为列设定别名

SQL 语句可以使用 **`AS` 关键字** 为列设定**别名** 。

**代码清单 2-4　为列设定别名**

```sql
SELECT product_id     AS id,
       product_name   AS name,
       purchase_price AS price
  FROM Product;
```

> 别名可以使用中文，使用中文时需要用**双引号（`"` ）** 括起来 。
>
> 3 使用双引号可以设定包含空格（空白）的别名。但是如果忘记使用双引号就可能出错，因此并不推荐。大家可以像 `product_list` 这样使用下划线（_）来代替空白。

## 常数的查询

`SELECT` 子句中不仅可以书写列名，还可以书写常数。

**代码清单 2-6　查询常数**

```sql
SELECT '商品' AS string, 38 AS number, '2009-02-24' AS date,
       product_id, product_name
  FROM Product;
```

## 从结果中删除重复行

**代码清单 2-7　使用 `DISTINCT` 删除 `product_type` 列中重复的数据**

> 保存了那些种类

```sql
SELECT DISTINCT product_type
  FROM Product;
```

**代码清单 2-8　对含有 `NULL` 数据的列使用 `DISTINCT` 关键字**

```sql
SELECT DISTINCT purchase_price
  FROM Product;
```

## 根据 `WHERE` 语句来选择记录

**语法 2-3　`SELECT` 语句中的 `WHERE` 子句**

```sql
SELECT <列名>, ……
  FROM <表名>
 WHERE <条件表达式>;
```

## 注释的书写方法

**代码清单 2-13　1行注释的使用示例**

```sql
-- 本SELECT语句会从结果中删除重复行。
SELECT DISTINCT product_id, purchase_price
  FROM Product;
```

**代码清单 2-14　多行注释的使用示例**

```sql
/* 本SELECT语句，
   会从结果中删除重复行。*/
SELECT DISTINCT product_id, purchase_price
  FROM Product;
```

