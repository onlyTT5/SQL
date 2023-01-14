# 6-3 CASE表达式

[toc]

## 什么是CASE表达式

进行一种运算功能，还能用作条件分支

## CASE表达式的语法

**语法6-16 搜索CASE表达式**

```sql
CASE WHEN <求值表达式> THEN <表达式>
	WHEN <求值表达式> THEN <表达式>
	WHEN <求值表达式> THEN <表达式>
	.
	.
	.
	ELSE <表达式>
END
```

## CASE表达式的使用方法

```sql
SELECT product_name,
    CASE WHEN product_type = '衣服'
        THEN 'A:' + product_type
        WHEN product_type = '办公用品'
        THEN 'B:' + product_type
        WHEN product_type = '厨房用具'
        THEN 'C:' + product_type
        ELSE NULL
    END AS abc_product_type
FROM Product;
```

> 虽然CASE表达式的ELSE子句可以省略，但还是希望大家不要省略
>
> CASE表达式中的END不能省略

### CASE表达式的书写位置

**通常使用GROUP BY也无法实现行列转换**

```sql
SELECT product_type, SUM(sale_price) AS sum_price
FROM Product
GROUP BY product_type;
```

**使用CASE表达式进行行列转换**

```sql
SELECT SUM(CASE WHEN product_type = '衣服'
    THEN sale_price ELSE 0 END) AS sum_price_clothes,
    SUM(CASE WHEN product_type = '办公用品'
    THEN sale_price ELSE 0 END) AS sum_price_kitchen,
    SUM(CASE WHEN product_type = '厨房用具'
    THEN sale_price ELSE 0 END) AS sum_price_office
FROM Product;
```

> 在满足商品种类（product_type）为“衣服”或者“办公用品”等特定值时，上述CASE表达式输出该商品的销售单价（sale_price）,不满足时输出0

## 简单CASE表达式

**语法6-A 简单CASE表达式**

```sql
CASE <表达式>
	WHEN <表达式> THEN <表达式>
	WHEN <表达式> THEN <表达式>
	WHEN <表达式> THEN <表达式>
	.
	.
	.
	ELSE <表达式>
END
```

使用CASE表达式将字符串A~C添加到商品种类中

```sql
-- 使用搜索CASE表达式的情况
SELECT product_name,
    CASE WHEN product_type = '衣服'
        THEN 'A:' + product_type
        WHEN product_type = '办公用品'
        THEN 'B:' + product_type
        WHEN product_type = '厨房用具'
        THEN 'C:' + product_type
        ELSE NULL
    END AS abc_product_type
FROM Product;

-- 使用简单CASE表达式的情况
SELECT product_name,
    CASE product_type
        WHEN '衣服' THEN 'A:' + product_type
        WHEN '办公用品' THEN 'B:' + product_type
        WHEN '厨房用具' THEN 'C:' + product_type
        ELSE NULL
    END AS abc_product_type
FROM Product;
```

> 虽然看上去简化了书写，但是想要在WHEN 子句中指定不同列时，简单CASE表达式就无能为力了