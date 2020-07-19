SQL的四种连接查询(优点：可以不创建外键去查找)
内连接
inner join 或者join

外链接

1.左连接left join或者Left outer join

2.右连接right join或right outer join

3.完全外链接full join 或者full outer join

--创建两个表:
--创建测试连接数据库
create database testjoin;

-- person 表
id,
name ,
ca rdId

create table person(
     id int,
     name varchar(20),
     cardId int
);

-- card表
id,
name

create table card(
     id int,
     name varchar(20)
);

insert into card values(1,'饭卡');
insert into card values(2,'建行卡');
insert into card values(3,'农行卡');
insert into card values(4,'工商卡');
insert into card values(5,'邮政卡');
insert into person values(1,'张三',1);
insert into person values(2,'李四',3);
insert into person values(3,'王五',6);

--并没有创建外键的表

--1.inner join / join 查询(内联查询，其实就是两张表中的数据，通过某个字段相对,查询出相关记录数据。即：求交集)
select * from person inner join card on person.cardId=card.id;

mysql> select * from person inner join card on person.cardId=card.id;
+------+--------+--------+------+-----------+
| id   | name   | cardId | id   | name      |
+------+--------+--------+------+-----------+
|    1 | 张三   |      1 |    1 | 饭卡      |
|    2 | 李四   |      3 |    3 | 农行卡    |
+------+--------+--------+------+-----------+
2 rows in set (0.01 sec)

--2.left join / left outer join 左连接(左外连接，会把左边表里面的所有数据取出来，而右边表中的数据，如果有相等的，就显示出来如果没有，就会补NULL)
select * from person left join card on person.cardId=card.id;

mysql> select * from person left join card on person.cardId=card.id;
+------+--------+--------+------+-----------+
| id   | name   | cardId | id   | name      |
+------+--------+--------+------+-----------+
|    1 | 张三   |      1 |    1 | 饭卡      |
|    2 | 李四   |      3 |    3 | 农行卡    |
|    3 | 王五   |      6 | NULL | NULL      |
+------+--------+--------+------+-----------+
3 rows in set (0.01 sec)

--3.right join / right outer join 右连接(右外连接，会把右边表里面的所有数据取出来，而左边表中的数据，如果有相等的，就显示出来如果没有，就会补NULL)
select * from person right join card on person.cardId=card.id;

mysql> select * from person right join card on person.cardId=card.id;
+------+--------+--------+------+-----------+
| id   | name   | cardId | id   | name      |
+------+--------+--------+------+-----------+
|    1 | 张三   |      1 |    1 | 饭卡      |
|    2 | 李四   |      3 |    3 | 农行卡    |
| NULL | NULL   |   NULL |    2 | 建行卡    |
| NULL | NULL   |   NULL |    4 | 工商卡    |
| NULL | NULL   |   NULL |    5 | 邮政卡    |
+------+--------+--------+------+-----------+
5 rows in set (0.00 sec)

--4、full join / full outer join 全外链接
select * from person full outer join card on person.cardId=card.id;

--mysql不支持full join

select * from person left join card on person.cardId=card.id
union
select * from person right join card on person.cardId=card.id;

mysql> select * from person left join card on person.cardId=card.id
    -> union
    -> select * from person right join card on person.cardId=card.id;
+------+--------+--------+------+-----------+
| id   | name   | cardId | id   | name      |
+------+--------+--------+------+-----------+
|    1 | 张三   |      1 |    1 | 饭卡      |
|    2 | 李四   |      3 |    3 | 农行卡    |
|    3 | 王五   |      6 | NULL | NULL      |
| NULL | NULL   |   NULL |    2 | 建行卡    |
| NULL | NULL   |   NULL |    4 | 工商卡    |
| NULL | NULL   |   NULL |    5 | 邮政卡    |
+------+--------+--------+------+-----------+
6 rows in set (0.01 sec)





create table book(
	id int primary key,
	name varchar(20),
	category varchar(20),
	price int,
	publish_time date
)















