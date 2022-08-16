# 4-2　数据的删除（`DELETE` 语句的使用方法）

[toc]

## `DROP TABLE` 语句和 `DELETE` 语句

1. `DROP TABLE` 语句会完全删除整张表，因此删除之后再想插入数据，就必须使用 `CREATE TABLE` 语句重新创建一张表。
2. 中的 `DELETE` 语句在删除数据（行）的同时会保留数据表，因此可以通过 `INSERT` 语句再次向表中插入数据。

## `DELETE` 语句的基本语法

**语法 4-2　保留数据表，仅删除全部数据行的 `DELETE` 语句**

```sql
DELETE FROM <表名>;
```

> `DELETE` 语句的删除对象并不是表或者列，而是记录

## 指定删除对象的 `DELETE` 语句（搜索型 `DELETE` ）

想要删除部分数据行时，可以像 `SELECT` 语句那样使用 `WHERE` 子句指定删除条件。这种指定了删除对象的 `DELETE`语句称为**搜索型 `DELETE`** 8 。

**语法 4-3　删除部分数据行的搜索型 `DELETE`**

```sql
DELETE FROM <表名>
 WHERE <条件>;
```

**代码清单 ****4-14　删除销售单价（`sale_price` ）大于等于 4000日元的数据**

```sql
DELETE FROM Product
 WHERE sale_price >= 4000;
```

> 与 `SELECT` 语句不同的是，`DELETE` 语句中不能使用 `GROUP BY` 、 `HAVING` 和 `ORDER BY` 三类子句，而只能使用 `WHERE`子句。原因很简单， `GROUP BY` 和 `HAVING` 是从表中选取数据时用来改变抽取数据形式的，而 `ORDER BY` 是用来指定取得结果显示顺序的。因此，在删除表中数据时它们都起不到什么作用。

## **删除和舍弃**

**语法4-A　只能删除表中全部数据的`TRUNCATE` 语句**

```sql
TRUNCATE <表名>;
```

> 与 `DELETE` 不同的是，`TRUNCATE` 只能删除表中的全部数据，而不能通过 `WHERE` 子句指定条件来删除部分数据。也正是因为它不能具体地控制删除对象，所以其处理速度比 `DELETE` 要快得多。实际上，`DELETE` 语句在DML 语句中也属于处理时间比较长的，因此需要删除全部数据行时，使用 `TRUNCATE` 可以缩短执行时间。