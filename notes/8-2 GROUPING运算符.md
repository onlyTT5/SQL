# 8-2 GROUPING运算符

[toc]

## 同时得到合计行

**使用GROUP BY无法得到合计行**

```sql
SELECT product_type, SUM(sale_price)
FROM Product
GROUP BY product_type;
```

**分别计算出合计行和汇总结果再通过UNION ALL进行连接**

```SQL
SELECT '合计' AS product_type, SUM(sale_price)
FROM Product
UNION ALL
SELECT product_type, SUM(sale_price)
FROM Product
GROUP BY product_type;
```

> 需要执行两次几乎相同的SELECT语句，十分繁琐，DBMS内部处理成本也非常高

## ROLLUP 同时得出合计和小计

### ROLLIUP的使用方法

**使用ROLLUP同时得出合计和小计**

```sql
SELECT product_type, SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type);
```

> 超级分组记录默认使用NULL作为聚合键

### 将“登记日期”添加到聚合键当中

**在GROUP BY中添加“登记日期”（不使用ROLLUP）**

```SQL
SELECT product_type, regist_date, SUM(sale_price) AS sum_price
FROM Product
GROUP BY product_type, regist_date;
```

**在GROUP BY中添加“登记日期”（使用ROLLUP）**

```SQL
SELECT product_type, regist_date, SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type, regist_date);
```

未使用登记日期作为聚合键记录

> ROLLUP可以同时得出合计和小计，是非常方便的工具

## GROUPING函数 让NULL更容易分辨

**使用GROUPING函数来判断NULL**

```sql
SELECT GROUPING(product_type) AS product_type, GROUPING(regist_date) AS regist_date, SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type, regist_date);
```

**在超级分组记录的键值中插入恰当的字符串**

```SQL
SELECT CASE WHEN GROUPING(product_type) = 1
    THEN '商品种类 合计'
    ELSE product_type END AS product_type,
    CASE WHEN GROUPING(regist_date) = 1
    THEN '登记日期 合计'
    ELSE CAST(regist_date AS VARCHAR(16)) END AS regist_date,
    SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type, regist_date);
```

> 使用GROUPING函数能够简单地分辨出原始数据中的NULL和超级分组记录中的NULL

## CUBE 用数据来搭积木

**使用CUBE取得全部组合的结果**

```SQL
SELECT CASE WHEN GROUPING(product_type) = 1
    THEN '商品种类 合计'
    ELSE product_type END AS product_type,
    CASE WHEN GROUPING(regist_date) = 1
    THEN '登记日期 合计'
    ELSE CAST(regist_date AS VARCHAR) END AS regist_date,
    SUM(sale_price) AS sum_price
FROM Product
GROUP BY ROLLUP(product_type, regist_date);
```

> 可以把CUBE理解为使用聚合键进行切割的模块堆积成一个立方体

## GROUPING SETS 取得期望的积木

**使用GROUP SETS取得部分组合的结果**

```sql
SELECT CASE WHEN GROUPING(product_type) = 1
    THEN '商品种类 合计'
    ELSE product_type END AS product_type,
    CASE WHEN GROUPING(regist_date) = 1
    THEN '登记日期 合计'
    ELSE CAST(regist_date AS VARCHAR) END AS regist_date,
    SUM(sale_price) AS sum_price
FROM Product
GROUP BY GROUPING SETS (product_type, regist_date);
```

取出个别条件对应的不固定的结果
