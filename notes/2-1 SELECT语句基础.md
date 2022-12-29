# 2-1 SELECT语句基础

[toc]

## 列的查询

**语法2-1 基本的SELECT语句**

```sql
SELECT <列名> FROM <表名>;
```

## 查询表中所有的列

**语法2-1 基本的SELECT语句**

```sql
SELECT * FROM <表名>;
```

## 为列设置别名

**语法2-2 设置别名**

```sql
SELECT
<列名> AS <别名>,
<列名> AS <别名>,
<列名> AS <别名>,
FROM <表名>;
```

可以是中文名，但要加上`""`

## 常数查询

**语法2-3 查询常数AS**

```SQL
SELECT <常数> AS <列名>, <常数> AS <列名>, <常数> AS <列名>
FROM Product;
```

## 从结果中查询重复行

语法2-4 SELECT语句中的DISTINCT语句

```SQL
SELECT DISTINCT <列名>
FROM <表名>;
```

可以多列使用

## 根据WHERE语句来选择记录

**语法2-5 SELECT语句中的WHERE语句**

```SQL
SELECT <列名>
FROM <表名>
WHERE <条件表达式>;
```

- 也可以不作为选取出作为查询条件的列
- WHERE子句要紧跟在FROM子句之后

## 注释的书写方法

- 一行注释`--`
- 多行注释`/* */`