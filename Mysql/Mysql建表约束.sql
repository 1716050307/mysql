-------- 主键约束--------
它能够唯一确定一张表中的一条记录，也就是我们通过给某个字段添加约束，
也就可以使得该字段不重复且不为空

-----主键不能为空，任何一个主键都不行-----

--单个主键
create table user(
	id int primary key,
	name varchar(20)
);

--联合主键(只要联合主键值加起来不一样即可)
create table user2(
	id int,
	name varchar(20),
	password varchar(20),
	primary key(id,name)
);


----自增约束
auto_increment与主键连用

create table user3(
	id int primary key auto_increment,
	name varchar(20)
);

--在name栏目放入一个张三，id栏会自动生成一个序号(管控id的值进行自动递增)
insert into user3 (name) values('zhangsan');

--如果创建表时候忘记创建约束该如何？

create table user4(
	id int,
	name varchar(20)
);

创建约束：
alter table user4 add primary key(id);
删除约束：
alter table user4 drop primary key(id);
使用modify修改字段方式修改约束：
alter table user4 modify id int primary key;


--------唯一约束--------(unique)
--约束修饰的字段值不可重复

create table user5(
	id int,
	name varchar(20)
);
alter table user5 add unique(name);

--unique(id,name)两个键在一起不重复即可
create table user6(
	id int,
	name varchar(20),
	unique(id,name)
);
insert into user6(1,'zhangsan');
insert into user6(2,'zhangsan');
insert into user6(1,'lisi');

--如何删除唯一约束？
alter table user5 drop index name;
--添加？
alter table user5 modify name varchar(20) unique;

--总结：
0.建表时候添加约束：
1.使用alter。。。。add。。。
2.alter。。。modify。。。
3.alter。。。drop。。。


--------非空约束---------
--修饰字段不能为空，即NULL  (not null)
create table user9(
	id int ,
	name varchar(20) not null
);


-------外键约束--------
--涉及两个表格：父表，子表
--主表，副表

--班级
create table classes(
	id int primary key,
	name varchar(20)
);

--学生表
create table student(
	id int primary key,
	name varchar(20),
	class_id int,
	foreign key(class_id) references classes(id)
);

--classses内插入班级信息
insert into classes values(1,'一班');
insert into classes values(2,'二班');
insert into classes values(3,'三班');
insert into classes values(4,'四班');

--student内插入信息
正确方式：
insert into student values(1001,'张三',1);
insert into student values(1002,'张三',2);
insert into student values(1003,'张三',3);
insert into student values(1004,'张三',4);
错误方式：(主表没有五班)
insert into student values(1005,'张三',5);

--主表(父表)classes中没有的数据值，在副表(子表)中，是不可以使用的。
--主表被副表引用，不可以被删除的
无法删除内容，因为子表在使用父表的内容！！！
delete from classes where id=4;
