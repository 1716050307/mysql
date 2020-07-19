-- mysq1事务

mysql中，事务其实是一个最小的不可分割的工作单元。事务能够保证一个业务的完整性。
比如我们的银行转账:

a -> -100
update user set money=money-100 where name= 'a' ;

b->+100
update user set money=money+100 where name= 'b' ;

--实际的程序中，如果只有一条语句执行成功了，而另外-条没有执行成功? 
--出现数据前后不一致。

update user set money=money-100 where name ='a' ;
update user set money=money+100 where name= 'b' ;

--多条sql语句，可能会有同时成功的要求，要么就同时失败。

-- mysql中如何控制事务?

1、mysql默认是开启事务的(自动提交)。

select @@autocommit;

mysql> select @@autocommit;
+--------------+
| @@autocommit |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)
--默认事务开启的作用是什么?
--当我们去执行一个sql语句的时候，效果会立即体现出来，且不能回滚。

create database bank;
create table user(
     id int primary key,
     name varchar(20),
     money int
);

insert into user values(1,'a',1000);
select * from user;
mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |  1000 |
+----+------+-------+
1 row in set (0.00 sec)
-- 事务回滚:撤销sq1语句执行效果
rollback;

--发现回滚比没任何作用！！！
mysql> rollback;
Query OK, 0 rows affected (0.00 sec)
mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |  1000 |
+----+------+-------+
1 row in set (0.00 sec)

--设置mysql 自动提交为false

mysql> set autocommit=0;
Query OK, 0 rows affected (0.00 sec)

mysql> select @@autocommit;
+--------------+
| @@autocommit |
+--------------+
|            0 |
+--------------+
1 row in set (0.00 sec)

-- 上面的操作，关闭了mysql 的自动提交(commit)

insert into user values(2,'b',1000);

mysql> insert into user values(2,'b',1000);
Query OK, 1 row affected (0.00 sec)

mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |  1000 |
|  2 | b    |  1000 |
+----+------+-------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |  1000 |
+----+------+-------+
1 row in set (0.00 sec)

--临时的种操作，并没有真是提交，可以被rollback;
--如何真实提交成功数据(commit：实现真实提交数据)

mysql> insert into user values(2,'b',1000);
Query OK, 1 row affected (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |  1000 |
|  2 | b    |  1000 |
+----+------+-------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |  1000 |
|  2 | b    |  1000 |
+----+------+-------+
2 rows in set (0.00 sec)

--总结：

--自动提交? @@autocommit=1

--手动提交? commit;

--事务回滚? rollback;

--如果说这个时候转账:

update user set money=money-100 where name='a';
update user set money=money+100 where name='b';

rollback; 

-- 结果显示：
mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |   900 |
|  2 | b    |  1100 |
+----+------+-------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |  1000 |
|  2 | b    |  1000 |
+----+------+-------+
2 rows in set (0.00 sec)

-- 事务给我们提供了一个返回的机会。
-- 如果成功：手动给一个：commit
-- 如果失败：手动给一个：rollbac

set autocommit =1;
-----------------------------------------------------------------------
begin;
--或者
start transaction;
--都可以帮我们手动开启一个事务

-- 手动开启事务表达方式(1)：
begin;
update user set money=money-100 where name='a';
update user set money=money+100 where name='b';

mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |   900 |
|  2 | b    |  1100 |
+----+------+-------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from user;
+----+------+-------+
| id | name | money |
+----+------+-------+
|  1 | a    |  1000 |
|  2 | b    |  1000 |
+----+------+-------+
2 rows in set (0.00 sec)

-- 手动开启事务表达方式(2)：
begin;
update user set money=money-100 where name='a';
update user set money=money+100 where name='b';

--commit：防止撤销语句(与之前的方式一样)
commit;
mysql> commit;

事务的四大特征:
A 原子性:事务是最小的单位，不可以在分割。
C 一致性:事务要求，同一事务中的sql语句，必须保证同时成功或者同时失败。
I 隔离性:事务1和事务2之间是具有隔离性的。
D 持久性:事务一旦结束(commit,rollback),就不可以返回。

事务开启:
1.修改默认提交 set autocommit=0;
2.begin;
3.start transaction;

事务手动提交:
commit;

事务手动回滚:
rollback;

-- 事物的隔离性：

1、read uncommitted;      读未提交的
2、read committed;        读已经提交的
3、repeatable read;       可以重复读
4、serializable;          串行化

1- read uncommitted

如果有事务a,和事务b:
a事务对数据进行操作,在操作的过程中,事务没有被提交,但是b可以看见a操作的结果。


bank数据库user表
insert into user values(3,'小明',1000);
insert into user values(4,'淘宝店',1000);

mysql> select * from user;
+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |  1000 |
|  4 | 淘宝店    |  1000 |
+----+-----------+-------+
4 rows in set (0.00 sec)

-- 如何查看数据库的隔离级别?
mysql 5.x:
select @@global.tx_isolation;
select @@tx_isolation;

mysql 8.0:
-- 系统级别：
select @@global.transaction_isolation;
-- 会话级别：
select @@transaction_isolation;

-- mysql默认隔离级别REPEATABLE-READ
mysql> select @@global.transaction_isolation;
+--------------------------------+
| @@global.transaction_isolation |
+--------------------------------+
| REPEATABLE-READ                |
+--------------------------------+
1 row in set (0.00 sec)


--如何修改隔离级别：

set global transaction isolation level read uncommitted;

mysql> select @@global.transaction_isolation;
+--------------------------------+
| @@global.transaction_isolation |
+--------------------------------+
| READ-UNCOMMITTED               |
+--------------------------------+
1 row in set (0.00 sec)


--转账：小明在淘宝买鞋子：800元钱，
        小明-》成都ATM
        淘宝店-》广州ATM
start transaction;
update user set money=money-800 where name='小明';
update user set money=money+800 where name='淘宝店';

mysql> select * from user;
+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |   200 |
|  4 | 淘宝店    |  1800 |
+----+-----------+-------+
4 rows in set (0.00 sec)

-- 给淘宝店打电话，说你去查一下，是不是到账了

-- 淘宝店在广州查账
mysql> select * from user;
+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |   200 |
|  4 | 淘宝店    |  1800 |
+----+-----------+-------+
4 rows in set (0.00 sec)


--发货
-- 晚上请女朋友吃好吃的
-- 1800


--小明-》成都：rollback;

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from user;
+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |  1000 |
|  4 | 淘宝店    |  1000 |
+----+-----------+-------+
4 rows in set (0.00 sec)


-- 结账的时候发现钱不够
mysql> select * from user;
+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |  1000 |
|  4 | 淘宝店    |  1000 |
+----+-----------+-------+
4 rows in set (0.00 sec)

--如果两个不同的地方，都在进行操作，如果事务a开启之后,他的数据可以被其他事务读取到。
--这样就会出现(脏读)
--脏读:一个事务读到了另外一个事务没有提交的数据，就叫做脏读。
--实际开发是不允许脏读出现的。


2、read committed;        读已经提交的
set global transaction isolation level read committed;

select @@global.transaction_isolation;

-- 修改隔离级别为READ-COMMITTED
mysql> select @@global.transaction_isolation;
+--------------------------------+
| @@global.transaction_isolation |
+--------------------------------+
| READ-COMMITTED                 |
+--------------------------------+
1 row in set (0.00 sec)


bank 数据库 user表

小张:银行的会计
start transaction;
select * from user;

+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |  1000 |
|  4 | 淘宝店    |  1000 |
+----+-----------+-------+

小张出去上厕所去了。。。抽烟。。。。

小王:
start transaction;
insert into user values(5,'c' ,100);
commit;

+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |  1000 |
|  4 | 淘宝店    |  1000 |
|  5 | c         |   100 |
+----+-----------+-------+

-- 小张上完厕所，抽完烟回来了(想计算平均数)。
select avg (money) from user;

mysql> select avg (money) from user;
+-------------+
| avg (money) |
+-------------+
|    820.0000 |
+-------------+
1 row in set (0.00 sec)


-- money 的平均值不是1000, 变少了?
-- 虽然我只能读到另外一个事务提交的数据，但还是会出现问题，就是
-- 读取同一个表的数据，发现前后不一致。
-- 不可重复读现象: read committed !

3、repeatable read;   可以重复读

set global transaction isolation level repeatable read;
select @@global.transaction_isolation;

mysql> set global transaction isolation level repeatable read;
Query OK, 0 rows affected (0.00 sec)

mysql> select @@global.transaction_isolation;
+--------------------------------+
| @@global.transaction_isolation |
+--------------------------------+
| REPEATABLE-READ                |
+--------------------------------+
1 row in set (0.00 sec)

-- 在REPEATABLE-READ 隔离级别下又会出现什么问题?

select * from user;

mysql> select * from user;
+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |  1000 |
|  4 | 淘宝店    |  1000 |
|  5 | c         |   100 |
+----+-----------+-------+
5 rows in set (0.01 sec)

-- 张全蛋-成都
start transaction;

-- 王尼玛-北京
start transaction;
-- 张全蛋-成都
insert into user values(6,'d',1000);

-- 王尼玛-北京
insert into user values(6,'d',1000);

mysql> select *from user;
+----+-----------+-------+
| id | name      | money |
+----+-----------+-------+
|  1 | a         |  1000 |
|  2 | b         |  1000 |
|  3 | 小明      |  1000 |
|  4 | 淘宝店    |  1000 |
|  5 | c         |   100 |
+----+-----------+-------+
5 rows in set (0.00 sec)

mysql> insert into user values(6,'d',1000);
ERROR 1062 (23000): Duplicate entry '6' for key 'user.PRIMARY'


--这种现象就叫做幻读! !
--事务a和事务b同时操作一张表，事务a提交的数据，也不能被事务b读到，就可以造成幻读。

4、serializable;    串行化

set global transaction isolation level serializable;
select @@global.transaction_isolation;

--修改隔离级别为串行化
mysql> select @@global.transaction_isolation;
+--------------------------------+
| @@global.transaction_isolation |
+--------------------------------+
| SERIALIZABLE                   |
+--------------------------------+
1 row in set (0.00 sec)

-- 张全蛋-成都
start transaction;

-- 王尼玛-北京
start transaction;
-- 张全蛋-成都
insert into user values(6,'d',1000);

-- 王尼玛-北京
insert into user values(6,'d',1000);

--当user表被另外一个事务操作的时候，其他事务里面的写操作，是不可以进行的。
--进入排队状态(串行化)，指导王尼玛那边事务结束之后，张全蛋这个的写入操作才会执行。
--在没有等待超时的情况下。

--串行化问题是，性能特差! ! !
READ-UNCOMMITTED > READ-COMMITTED > REPEATABLE- READ > SERIALIZABLE;
--隔离级别越高，性能越差
--mysql默认隔离级别是REPEATABLE- READ

