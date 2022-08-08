# 0-2 通过 PostgreSQL 执行 SQL 语句

[toc]

## 创建学习用的数据库

### 01、执行创建数据库的SQL语句

```sql
CREATE DATABASE shop;
```

创建成功后，画面中会显示如下信息

```sql
CREATE DATABASE
```

![NeatReader-1659996645047](D:/GitRep/SQL/notes/0-2%20%E6%89%A7%E8%A1%8CSQL%E8%AF%AD%E5%8F%A5.assets/NeatReader-1659996645047-16599966697832.png)

> 数据库创建成功

### 02、**结束 psql**

```sql
\q
```

> “`\q` ”中的 q 是“quit”（退出）的缩写。

![NeatReader-1659996804791](D:/GitRep/SQL/notes/0-2%20%E6%89%A7%E8%A1%8CSQL%E8%AF%AD%E5%8F%A5.assets/NeatReader-1659996804791-16599968316895.png)

## 连接学习用的数据库（登录）

```sql
D:\PostgreSQL\9.6\bin\psql.exe -U postgres -d shop
```

> 选项“`-d shop` ”是指定“数据库 `shop` ”的意思。

> 登录成功后会显示如下信息

```sql
shop=#
```

![NeatReader-1659997130855](D:/GitRep/SQL/notes/0-2%20%E6%89%A7%E8%A1%8CSQL%E8%AF%AD%E5%8F%A5.assets/NeatReader-1659997130855-16599971745708.png)