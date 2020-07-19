---------数据库的三大设计范式.sql

--1.第一范式
--1NF

数据表中的所有字段都是不可分割的原子值

--范式，设计的越详细，对于某些实际操作可能更好，但是不一定都是好处。
--即每个字段不可继续拆分才称为第一字段，如果可以继续拆分，就不是第一范式

--2.第二范式
--必须使满足第一范式的前提，第二范式要求，除主键外的每一列都必须完全依赖与主键。
--如果要出现不完全依赖，只可能发生在联合主键情况下。！！！！！

--订单表
非第二范式示例：
create table myorder(
	product_id int,
	cusomer_id int,
	product_name varchar(20),
	cusomer_name varchar(20),
	primary key(product_id,cusomer_id)
);
--问题
--除了主键以为的其他列，只依赖与主键的部分字段。(product_name依赖于product_id，cusomer_name依赖于cusomer_id)
--解决办法：拆表！！！！！

create table myorder1(
	order_id int primary key,--订单id
	product_id varchar(20),  --产品id
	cusomer_id varchar(20)   --消费id
);

create table product(
	id int primary key,
	name varchar(20)
);

create table cusomer(
	id int primary key,
	name varchar(20)
);

--分成三个表，即可满足第二范式要求

-------第三范式--------
--3NF
--必须先满足第二范式，除去主键列的其他列之间不能存在依赖关系

create table myorder1(
	order_id int primary key,--订单id
	product_id varchar(20),  --产品id
	cusomer_id varchar(20)   --消费id
	cusomer_phone varchar(15)--电话和消费者id有依赖关系，所以不满足第三范式
);

--修改方式(电话放在用户信息表)
create table myorder1(
	order_id int primary key,--订单id
	product_id varchar(20),  --产品id
	cusomer_id varchar(20)   --消费id
);

create table product(
	id int primary key,
	name varchar(20),
	phone varchar(15)
);