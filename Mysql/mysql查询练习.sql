--mysql查询练习.sql

-- 学生表：(Student)
-- 学号 姓名 班级 性别 出生年月日 所在班级
create table Student(
	sno varchar(20) primary key,
	sname varchar(20) not null,
	ssex varchar(10) not null,
	sbirthday datetime,
	class varchar(20)
);

-- 课程表：(Course)
-- 课程号 课程名称 教师编号
create table Course(
	cno varchar(20) primary key,
	cname varchar(20) not null,
	tno varchar(20) not null,
	foreign key(tno) references Teacher(tno)
);

-- 成绩表：(Score)
-- 学号 课程号 成绩
-- create table Score(
-- 	sno varchar(20) primary key,
-- 	cno varchar(20) not null,
-- 	dgree decimal,
-- 	foreign key(sno) references Student(sno),
-- 	foreign key(cno) references Course(cno)
-- );
-- 上面是错误表格！！！
-- 修改如下：
drop table score;
create table Score(
	sno varchar(20) not null,
	cno varchar(20) not null,
	dgree decimal,
	foreign key(sno) references Student(sno),
	foreign key(cno) references Course(cno),
	primary key(sno, cno)
);

-- 教师表：(Teacher)
-- 教师编号 教师姓名 教师性别 出生年月日 职称 所在部门
create table Teacher(
	tno varchar(20) primary key,
	tname varchar(20) not null,
	tsex varchar(10) not null,
	tbirthday datetime,
	prof varchar(20) not null,
	depart varchar(20) not null
);

--往数据表添加数据
#添加学生信息表
insert into student values('101','曾华','男','1977-09-01','95033');
insert into student values('102','匡明','男','1975-10-02','95031');
insert into student values('103','王丽','女','1976-01-23','95033');
insert into student values('104','李军','男','1976-02-20','95033');
insert into student values('105','王芳','女','1975-02-10','95031');
insert into student values('106','陆君','男','1974-06-03','95031');
insert into student values('107','王尼玛','男','1976-02-20','95033');
insert into student values('108','张全蛋','女','1975-02-10','95031');
insert into student values('109','赵铁柱','男','1974-06-03','95031');

#添加教师信息表
insert into teacher values('804','李诚','男','1958-12-02','副教授','计算机系');
insert into teacher values('856','张旭','男','1969-03-12','讲师','电子工程系');
insert into teacher values('825','王萍','女','1972-05-05','助教','计算机系');
insert into teacher values('831','刘冰','女','1977-08-14','助教','电子工程系');

#添加课程信息表
insert into course values('3-105','计算机导论','825');
insert into course values('3-245','操作系统','804');
insert into course values('6-166','数字电路','856');
insert into course values('9-888','高等数学','831');

#添加成绩信息表
insert into score values('103','3-245','86');
insert into score values('105','3-245','75');
insert into score values('109','3-245','68');
insert into score values('103','3-105','92');
insert into score values('105','3-105','88');
insert into score values('109','3-105','76');
insert into score values('103','9-888','64');
insert into score values('105','9-888','91');
insert into score values('109','9-888','78');
insert into score values('103','6-166','85');
insert into score values('105','6-166','79');
insert into score values('109','6-166','81');

mysql> select * from score;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
| 103 | 3-245 |    86 |
| 103 | 6-166 |    85 |
| 103 | 9-888 |    64 |
| 105 | 3-105 |    88 |
| 105 | 3-245 |    75 |
| 105 | 6-166 |    79 |
| 105 | 9-888 |    91 |
| 109 | 3-105 |    76 |
| 109 | 3-245 |    68 |
| 109 | 6-166 |    81 |
| 109 | 9-888 |    78 |
+-----+-------+-------+
12 rows in set (0.00 sec)

-------查询练习
-- 1、 查询student表的所有记录。
mysql> select * from student;
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | 曾华      | 男   | 1977-09-01 00:00:00 | 95033 |
| 102 | 匡明      | 男   | 1975-10-02 00:00:00 | 95031 |
| 103 | 王丽      | 女   | 1976-01-23 00:00:00 | 95033 |
| 104 | 李军      | 男   | 1976-02-20 00:00:00 | 95033 |
| 105 | 王芳      | 女   | 1975-02-10 00:00:00 | 95031 |
| 106 | 陆君      | 男   | 1974-06-03 00:00:00 | 95031 |
| 107 | 王尼玛    | 男   | 1976-02-20 00:00:00 | 95033 |
| 108 | 张全蛋    | 女   | 1975-02-10 00:00:00 | 95031 |
| 109 | 赵铁柱    | 男   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
9 rows in set (0.00 sec)

-- 2、 查询student表中的所有记录的sname、ssex和class列。
select sname,ssex,class from student;

mysql> select sname,ssex,class from student;
+-----------+------+-------+
| sname     | ssex | class |
+-----------+------+-------+
| 曾华      | 男   | 95033 |
| 匡明      | 男   | 95031 |
| 王丽      | 女   | 95033 |
| 李军      | 男   | 95033 |
| 王芳      | 女   | 95031 |
| 陆君      | 男   | 95031 |
| 王尼玛    | 男   | 95033 |
| 张全蛋    | 女   | 95031 |
| 赵铁柱    | 男   | 95031 |
+-----------+------+-------+
9 rows in set (0.00 sec)

--3、 查询教师所有的单位即不重复的depart列。
select depart from teacher;

mysql> select depart from teacher;
+-----------------+
| depart          |
+-----------------+
| 计算机系        |
| 计算机系        |
| 电子工程系      |
| 电子工程系      |
+-----------------+
4 rows in set (0.00 sec)


---------(关键字：distinct 排除重复)----------
select distinct depart from teacher;

mysql> select distinct depart from teacher;
+-----------------+
| depart          |
+-----------------+
| 计算机系        |
| 电子工程系      |
+-----------------+
2 rows in set (0.01 sec)

--4、查询score表中 成绩在60到80之间的所有记录。
--方法一：查询区间需要使用：between...and.... 实现
select * from score where dgree between 60 and 80;

mysql> select * from score where dgree between 60 and 80;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 9-888 |    64 |
| 105 | 3-245 |    75 |
| 105 | 6-166 |    79 |
| 109 | 3-105 |    76 |
| 109 | 3-245 |    68 |
| 109 | 9-888 |    78 |
+-----+-------+-------+
6 rows in set (0.01 sec)

select * from score where dgree between 80 and 60;(只可以从小大)

mysql> select * from score where dgree between 80 and 60;
Empty set (0.00 sec)

--方法二：查询区间需要使用'>'和'<'写
select * from score where dgree > 60 and dgree < 80;

mysql> select * from score where dgree > 60 and dgree < 80;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 9-888 |    64 |
| 105 | 3-245 |    75 |
| 105 | 6-166 |    79 |
| 109 | 3-105 |    76 |
| 109 | 3-245 |    68 |
| 109 | 9-888 |    78 |
+-----+-------+-------+
6 rows in set (0.01 sec)

--5、 查询score表中成绩为85， 86或88的记录。
--表示或者关系查询：in 关键字使用(‘在’的意思)
select * from score where dgree in (85,86,88);

mysql> select * from score where dgree in (85,86,88);
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-245 |    86 |
| 103 | 6-166 |    85 |
| 105 | 3-105 |    88 |
+-----+-------+-------+
3 rows in set (0.00 sec)

--6、 查询student表中“95031"班或性别为“女”的同学记录。
--or 表示或者
select * from student where class='95031' or ssex='女';

mysql> select * from student where class='95031' or ssex='女';
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 102 | 匡明      | 男   | 1975-10-02 00:00:00 | 95031 |
| 103 | 王丽      | 女   | 1976-01-23 00:00:00 | 95033 |
| 105 | 王芳      | 女   | 1975-02-10 00:00:00 | 95031 |
| 106 | 陆君      | 男   | 1974-06-03 00:00:00 | 95031 |
| 108 | 张全蛋    | 女   | 1975-02-10 00:00:00 | 95031 |
| 109 | 赵铁柱    | 男   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
6 rows in set (0.00 sec)

--7、以class降序查询student表的所有记录。
--升序，降序表达：使用order by配合 desc 降序 asc 升序(默认升序，不去写也可以)
select * from student order by class desc;

mysql> select * from student order by class desc;
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | 曾华      | 男   | 1977-09-01 00:00:00 | 95033 |
| 103 | 王丽      | 女   | 1976-01-23 00:00:00 | 95033 |
| 104 | 李军      | 男   | 1976-02-20 00:00:00 | 95033 |
| 107 | 王尼玛    | 男   | 1976-02-20 00:00:00 | 95033 |
| 102 | 匡明      | 男   | 1975-10-02 00:00:00 | 95031 |
| 105 | 王芳      | 女   | 1975-02-10 00:00:00 | 95031 |
| 106 | 陆君      | 男   | 1974-06-03 00:00:00 | 95031 |
| 108 | 张全蛋    | 女   | 1975-02-10 00:00:00 | 95031 |
| 109 | 赵铁柱    | 男   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
9 rows in set (0.00 sec)

--升序asc(两个方法都可以)
select * from student order by class;
select * from student order by class asc;

--8、以cno升序、 dgree降序 查询score表的所有记录。
select * from score order by cno asc,dgree desc;

mysql> select * from score order by cno asc,dgree desc;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
| 105 | 3-105 |    88 |
| 109 | 3-105 |    76 |
| 103 | 3-245 |    86 |
| 105 | 3-245 |    75 |
| 109 | 3-245 |    68 |
| 103 | 6-166 |    85 |
| 109 | 6-166 |    81 |
| 105 | 6-166 |    79 |
| 105 | 9-888 |    91 |
| 109 | 9-888 |    78 |
| 103 | 9-888 |    64 |
+-----+-------+-------+
12 rows in set (0.00 sec)

先以cno的升序排序，如果相同按照dgree的降序排序

--9、查询“95031"班的学生人数。
--统计关键词：count
select count(*) from student where class='95031';

mysql> select count(*) from student where class='95031';
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.01 sec)

mysql> select count(*) from student;
+----------+
| count(*) |
+----------+
|        9 |
+----------+
1 row in set (0.01 sec)

--10、查询score表中的最高分的学生学号和课程号。 (子查询或者排序)
--子查询
select sno,cno from score where dgree=(select max(dgree) from score);

mysql> select sno,cno from score where dgree=(select max(dgree) from score);
+-----+-------+
| sno | cno   |
+-----+-------+
| 103 | 3-105 |
+-----+-------+
1 row in set (0.00 sec)

--1 找到最高分数：
select max(dgree) from score;

mysql> select max(dgree) from score;
+------------+
| max(dgree) |
+------------+
|         92 |
+------------+
1 row in set (0.00 sec)

--2 找到最高分数中的 sno 和cno：
select sno,cno from score where dgree=(select max(dgree) from score);

--排序做法：(limit a,b ：表示从a开始，查找b条 信息提取)
select sno,cno,dgree from score order by dgree;

mysql> select sno,cno,dgree from score order by dgree;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 9-888 |    64 |
| 109 | 3-245 |    68 |
| 105 | 3-245 |    75 |
| 109 | 3-105 |    76 |
| 109 | 9-888 |    78 |
| 105 | 6-166 |    79 |
| 109 | 6-166 |    81 |
| 103 | 6-166 |    85 |
| 103 | 3-245 |    86 |
| 105 | 3-105 |    88 |
| 105 | 9-888 |    91 |
| 103 | 3-105 |    92 |
+-----+-------+-------+
12 rows in set (0.00 sec)

select sno,cno,dgree from score order by dgree desc limit 0,1;

mysql> select sno,cno,dgree from score order by dgree desc limit 0,1;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
+-----+-------+-------+
1 row in set (0.01 sec)

--11、查询每门课的平均成绩。
mysql> select *from Course;
+-------+-----------------+-----+
| cno   | cname           | tno |
+-------+-----------------+-----+
| 3-105 | 计算机导论      | 825 |
| 3-245 | 操作系统        | 804 |
| 6-166 | 数字电路        | 856 |
| 9-888 | 高等数学        | 831 |
+-------+-----------------+-----+
4 rows in set (0.01 sec)

--avg():求平均值
select avg(dgree) from score where cno='3-105';

mysql> select avg(dgree) from score where cno='3-105';
+------------+
| avg(dgree) |
+------------+
|    85.3333 |
+------------+
1 row in set (0.01 sec)

--我们想得到全部平均成绩信息
--group by 分组
select cno,avg(dgree) from score group by cno;

mysql> select cno,avg(dgree) from score group by cno;
+-------+------------+
| cno   | avg(dgree) |
+-------+------------+
| 3-105 |    85.3333 |
| 3-245 |    76.3333 |
| 6-166 |    81.6667 |
| 9-888 |    77.6667 |
+-------+------------+
4 rows in set (0.01 sec)

--12、查询score表中至少有2名学生选修的并以3开头的课程的平均分数。
--like '。%' 表示以。开头的查询
--group by ... having ... (而非where)
select cno,avg(dgree) from score group by cno having count(cno)>=2 and cno like'3%';

mysql> select cno,avg(dgree) from score group by cno having count(cno)>=2 and cno like'3%';
+-------+------------+
| cno   | avg(dgree) |
+-------+------------+
| 3-105 |    85.3333 |
| 3-245 |    76.3333 |
+-------+------------+
2 rows in set (0.01 sec)

select cno,avg(dgree),count(*) from score group by cno having count(cno)>=2 and cno like'3%';

--输出出现次数信息！！！ 
mysql> select cno,avg(dgree),count(*) from score group by cno having count(cno)>=2 and cno like'3%';
+-------+------------+----------+
| cno   | avg(dgree) | count(*) |
+-------+------------+----------+
| 3-105 |    85.3333 |        3 |
| 3-245 |    76.3333 |        3 |
+-------+------------+----------+
2 rows in set (0.00 sec)

--13、查询分数大于70，小于90的sno列。
select sno,dgree from score where dgree>70 and dgree<90;

mysql> select sno,dgree from score where dgree>70 and dgree<90;
+-----+-------+
| sno | dgree |
+-----+-------+
| 103 |    86 |
| 103 |    85 |
| 105 |    88 |
| 105 |    75 |
| 105 |    79 |
| 109 |    76 |
| 109 |    81 |
| 109 |    78 |
+-----+-------+
8 rows in set (0.00 sec)

select sno,dgree from score where dgree between 70 and 90;

mysql> select sno,dgree from score where dgree between 70 and 90;
+-----+-------+
| sno | dgree |
+-----+-------+
| 103 |    86 |
| 103 |    85 |
| 105 |    88 |
| 105 |    75 |
| 105 |    79 |
| 109 |    76 |
| 109 |    81 |
| 109 |    78 |
+-----+-------+
8 rows in set (0.00 sec)

--14、查询所有学生的sname、cno和degree列。
--连接两个表格：
select sname,cno,dgree from student,score where student.sno=score.sno;

mysql> select sname,cno,dgree from student,score where student.sno=score.sno;
+-----------+-------+-------+
| sname     | cno   | dgree |
+-----------+-------+-------+
| 王丽      | 3-105 |    92 |
| 王丽      | 3-245 |    86 |
| 王丽      | 6-166 |    85 |
| 王丽      | 9-888 |    64 |
| 王芳      | 3-105 |    88 |
| 王芳      | 3-245 |    75 |
| 王芳      | 6-166 |    79 |
| 王芳      | 9-888 |    91 |
| 赵铁柱    | 3-105 |    76 |
| 赵铁柱    | 3-245 |    68 |
| 赵铁柱    | 6-166 |    81 |
| 赵铁柱    | 9-888 |    78 |
+-----------+-------+-------+
12 rows in set (0.00 sec)

mysql> select sno,sname from student;
+-----+-----------+
| sno | sname     |
+-----+-----------+
| 101 | 曾华      |
| 102 | 匡明      |
| 103 | 王丽      |
| 104 | 李军      |
| 105 | 王芳      |
| 106 | 陆君      |
| 107 | 王尼玛    |
| 108 | 张全蛋    |
| 109 | 赵铁柱    |
+-----+-----------+
9 rows in set (0.00 sec)
mysql> select sno,cno,dgree from score;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
| 103 | 3-245 |    86 |
| 103 | 6-166 |    85 |
| 103 | 9-888 |    64 |
| 105 | 3-105 |    88 |
| 105 | 3-245 |    75 |
| 105 | 6-166 |    79 |
| 105 | 9-888 |    91 |
| 109 | 3-105 |    76 |
| 109 | 3-245 |    68 |
| 109 | 6-166 |    81 |
| 109 | 9-888 |    78 |
+-----+-------+-------+
12 rows in set (0.00 sec)

--15、查询所有学生的sno、cname和degree列。
select sno,cname,dgree from course,score where course.cno=score.cno;

mysql> select sno,cname,dgree from course,score where course.cno=score.cno;
+-----+-----------------+-------+
| sno | cname           | dgree |
+-----+-----------------+-------+
| 103 | 计算机导论      |    92 |
| 105 | 计算机导论      |    88 |
| 109 | 计算机导论      |    76 |
| 103 | 操作系统        |    86 |
| 105 | 操作系统        |    75 |
| 109 | 操作系统        |    68 |
| 103 | 数字电路        |    85 |
| 105 | 数字电路        |    79 |
| 109 | 数字电路        |    81 |
| 103 | 高等数学        |    64 |
| 105 | 高等数学        |    91 |
| 109 | 高等数学        |    78 |
+-----+-----------------+-------+
12 rows in set (0.00 sec)

--16、查询所有学生的sname、cname和degree列。
sname -> student
cname -> course
dgree -> score
--来自三个不同的表格，如何查询(找表格之间的相同关键字)：
select sname,cname,dgree from student,course,score where student.sno=score.sno and Course.cno=score.cno;

mysql> select sname,cname,dgree from student,course,score where student.sno=score.sno and Course.cno=score.cno;
+-----------+-----------------+-------+
| sname     | cname           | dgree |
+-----------+-----------------+-------+
| 王丽      | 计算机导论      |    92 |
| 王芳      | 计算机导论      |    88 |
| 赵铁柱    | 计算机导论      |    76 |
| 王丽      | 操作系统        |    86 |
| 王芳      | 操作系统        |    75 |
| 赵铁柱    | 操作系统        |    68 |
| 王丽      | 数字电路        |    85 |
| 王芳      | 数字电路        |    79 |
| 赵铁柱    | 数字电路        |    81 |
| 王丽      | 高等数学        |    64 |
| 王芳      | 高等数学        |    91 |
| 赵铁柱    | 高等数学        |    78 |
+-----------+-----------------+-------+
12 rows in set (0.00 sec)

--相同关键字的时候不能正常定义，需要指明！！
--修改显示列表名称用as：
select sname,cname,dgree,student.sno as stu_sno,course.cno as cou_cno 
from student,course,score 
where student.sno=score.sno 
and Course.cno=score.cno;

mysql> select sname,cname,dgree,student.sno,course.cno
    -> from student,course,score
    -> where student.sno=score.sno
    -> and Course.cno=score.cno;
+-----------+-----------------+-------+-----+-------+
| sname     | cname           | dgree | sno | cno   |
+-----------+-----------------+-------+-----+-------+
| 王丽      | 计算机导论      |    92 | 103 | 3-105 |
| 王芳      | 计算机导论      |    88 | 105 | 3-105 |
| 赵铁柱    | 计算机导论      |    76 | 109 | 3-105 |
| 王丽      | 操作系统        |    86 | 103 | 3-245 |
| 王芳      | 操作系统        |    75 | 105 | 3-245 |
| 赵铁柱    | 操作系统        |    68 | 109 | 3-245 |
| 王丽      | 数字电路        |    85 | 103 | 6-166 |
| 王芳      | 数字电路        |    79 | 105 | 6-166 |
| 赵铁柱    | 数字电路        |    81 | 109 | 6-166 |
| 王丽      | 高等数学        |    64 | 103 | 9-888 |
| 王芳      | 高等数学        |    91 | 105 | 9-888 |
| 赵铁柱    | 高等数学        |    78 | 109 | 9-888 |
+-----------+-----------------+-------+-----+-------+
12 rows in set (0.00 sec)

mysql> select sname,cname,dgree,student.sno as stu_sno,course.cno as cou_cno
    -> from student,course,score
    -> where student.sno=score.sno
    -> and Course.cno=score.cno;
+-----------+-----------------+-------+---------+---------+
| sname     | cname           | dgree | stu_sno | cou_cno |
+-----------+-----------------+-------+---------+---------+
| 王丽      | 计算机导论      |    92 | 103     | 3-105   |
| 王芳      | 计算机导论      |    88 | 105     | 3-105   |
| 赵铁柱    | 计算机导论      |    76 | 109     | 3-105   |
| 王丽      | 操作系统        |    86 | 103     | 3-245   |
| 王芳      | 操作系统        |    75 | 105     | 3-245   |
| 赵铁柱    | 操作系统        |    68 | 109     | 3-245   |
| 王丽      | 数字电路        |    85 | 103     | 6-166   |
| 王芳      | 数字电路        |    79 | 105     | 6-166   |
| 赵铁柱    | 数字电路        |    81 | 109     | 6-166   |
| 王丽      | 高等数学        |    64 | 103     | 9-888   |
| 王芳      | 高等数学        |    91 | 105     | 9-888   |
| 赵铁柱    | 高等数学        |    78 | 109     | 9-888   |
+-----------+-----------------+-------+---------+---------+
12 rows in set (0.00 sec)


--共同字段的相等的联系：
select sname,cname,dgree,
student.sno as stu_sno,
score.sno as sco_sno,
course.cno as cou_cno,
score.cno as sco_cno 
from student,course,score 
where student.sno=score.sno 
and Course.cno=score.cno;

mysql> select sname,cname,dgree,
    -> student.sno as stu_sno,
    -> score.sno as sco_sno,
    -> course.cno as cou_cno,
    -> score.cno as sco_cno
    -> from student,course,score
    -> where student.sno=score.sno
    -> and Course.cno=score.cno;
+-----------+-----------------+-------+---------+---------+---------+---------+
| sname     | cname           | dgree | stu_sno | sco_sno | cou_cno | sco_cno |
+-----------+-----------------+-------+---------+---------+---------+---------+
| 王丽      | 计算机导论      |    92 | 103     | 103     | 3-105   | 3-105   |
| 王芳      | 计算机导论      |    88 | 105     | 105     | 3-105   | 3-105   |
| 赵铁柱    | 计算机导论      |    76 | 109     | 109     | 3-105   | 3-105   |
| 王丽      | 操作系统        |    86 | 103     | 103     | 3-245   | 3-245   |
| 王芳      | 操作系统        |    75 | 105     | 105     | 3-245   | 3-245   |
| 赵铁柱    | 操作系统        |    68 | 109     | 109     | 3-245   | 3-245   |
| 王丽      | 数字电路        |    85 | 103     | 103     | 6-166   | 6-166   |
| 王芳      | 数字电路        |    79 | 105     | 105     | 6-166   | 6-166   |
| 赵铁柱    | 数字电路        |    81 | 109     | 109     | 6-166   | 6-166   |
| 王丽      | 高等数学        |    64 | 103     | 103     | 9-888   | 9-888   |
| 王芳      | 高等数学        |    91 | 105     | 105     | 9-888   | 9-888   |
| 赵铁柱    | 高等数学        |    78 | 109     | 109     | 9-888   | 9-888   |
+-----------+-----------------+-------+---------+---------+---------+---------+
12 rows in set (0.00 sec)

--17、查询“95031"班学生每门课的平均分。
select *from student where class='95031';

mysql> select *from student where class='95031';
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 102 | 匡明      | 男   | 1975-10-02 00:00:00 | 95031 |
| 105 | 王芳      | 女   | 1975-02-10 00:00:00 | 95031 |
| 106 | 陆君      | 男   | 1974-06-03 00:00:00 | 95031 |
| 108 | 张全蛋    | 女   | 1975-02-10 00:00:00 | 95031 |
| 109 | 赵铁柱    | 男   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
5 rows in set (0.00 sec)
--查询score表中的sno信息和student表中的sno信息相同的(使用：in)
--in 常用于where表达式中，其作用是查询某个范围内的数据。
select *from score where sno in (select sno from student where class='95031');

mysql> select *from score where sno in (select sno from student where class='95031');
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 105 | 3-105 |    88 |
| 105 | 3-245 |    75 |
| 105 | 6-166 |    79 |
| 105 | 9-888 |    91 |
| 109 | 3-105 |    76 |
| 109 | 3-245 |    68 |
| 109 | 6-166 |    81 |
| 109 | 9-888 |    78 |
+-----+-------+-------+
8 rows in set (0.01 sec)

方法一：
select cno,avg(dgree) from score where sno in (select sno from student where class='95031') group by cno;

mysql> select cno,avg(dgree) from score where sno in (select sno from student where class='95031') group by cno;
+-------+------------+
| cno   | avg(dgree) |
+-------+------------+
| 3-105 |    82.0000 |
| 3-245 |    71.5000 |  
| 6-166 |    80.0000 |
| 9-888 |    84.5000 |
+-------+------------+
4 rows in set (0.01 sec)

方法二：
select cno,avg(dgree) from score,student where (student.sno=score.sno and class='95031') group by cno;

mysql> select cno,avg(dgree) from score,student where (student.sno=score.sno and class='95031') group by cno;
+-------+------------+
| cno   | avg(dgree) |
+-------+------------+
| 3-105 |    82.0000 |
| 3-245 |    71.5000 |
| 6-166 |    80.0000 |
| 9-888 |    84.5000 |
+-------+------------+
4 rows in set (0.01 sec)

-- 18、查询选修“3-105”课程的成绩高于“109”号同学“3-105”成绩的所有同学的记录。
select * from score where cno='3-105' and 
dgree>(select dgree from score where sno='109' and cno='3-105');

mysql> select * from score where cno='3-105' and dgree>(select dgree from score where sno='109' and cno='3-105');
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
| 105 | 3-105 |    88 |
+-----+-------+-------+
2 rows in set (0.00 sec)

--19、查询成绩高于学号为“109”、课程号为“3-105"的成绩的所有记录。
select * from score where 
dgree>(select dgree from score where sno='109' and cno='3-105');

mysql> select * from score where dgree>(select dgree from score where sno='109' and cno='3-105');
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
| 103 | 3-245 |    86 |
| 103 | 6-166 |    85 |
| 105 | 3-105 |    88 |
| 105 | 6-166 |    79 |
| 105 | 9-888 |    91 |
| 109 | 6-166 |    81 |
| 109 | 9-888 |    78 |
+-----+-------+-------+
8 rows in set (0.00 sec)

--20、查询和学号为108、101的同学同年出生的所有学生的sno、sname和sbirthday列。
--year():查询出年份
--in：in常用于where表达式中，其作用是查询某个范围内的数据。
mysql> select year(sbirthday) from student where sno in (108,101);
+-----------------+
| year(sbirthday) |
+-----------------+
|            1977 |
|            1975 |
+-----------------+
2 rows in set (0.01 sec)

select * from student where year(sbirthday) in (select year(sbirthday)
 from student where sno in (108,101));

mysql> select * from student where year(sbirthday) in (select year(sbirthday) from student where sno in (108,101));
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | 曾华      | 男   | 1977-09-01 00:00:00 | 95033 |
| 102 | 匡明      | 男   | 1975-10-02 00:00:00 | 95031 |
| 105 | 王芳      | 女   | 1975-02-10 00:00:00 | 95031 |
| 108 | 张全蛋    | 女   | 1975-02-10 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
4 rows in set (0.00 sec)

--21、查询“张旭“教师任课的学生成绩
select tno from teacher where tname='张旭';

--方法一：
select * from score where cno=(select cno from course 
where tno=(select tno from teacher where tname='张旭'));

mysql> select * from score where cno=(select cno from course where tno=(select tno from teacher where tname='张旭'));
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 6-166 |    85 |
| 105 | 6-166 |    79 |
| 109 | 6-166 |    81 |
+-----+-------+-------+
3 rows in set (0.00 sec)

--方法二：
select sno,score.cno,dgree from teacher,score,course where teacher.tno=course.tno and course.cno=score.cno and tname='张旭';

mysql> select sno,score.cno,dgree from teacher,score,course
    -> where teacher.tno=course.tno and course.cno=score.cno and tname='张旭';
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 6-166 |    85 |
| 105 | 6-166 |    79 |
| 109 | 6-166 |    81 |
+-----+-------+-------+
3 rows in set (0.00 sec)

-- 22、查询选修某课程的同学人数多于5人的教师姓名。
--由于数据缺失，需要添加数据：
insert into score values('101','3-105','90');
insert into score values('102','3-105','91');
insert into score values('104','3-105','89');

select cno from score group by cno having count(*)>5;
+-------+
| cno   |
+-------+
| 3-105 |
+-------+
select tno from course where cno=(select cno from score group by cno having count(*)>5);
+-----+
| tno |
+-----+
| 825 |
+-----+
select tname from teacher where tno=(select tno from course where 
cno=(select cno from score group by cno having count(*)>5));

mysql> select tname from teacher where tno=(select tno from course where cno=(select cno from score group by cno having count(*)>5));
+--------+
| tname  |
+--------+
| 王萍   |
+--------+
1 row in set (0.00 sec)

-- 23、查询95033班和95031班全体学生的记录。
insert into student values('110','张飞','男','1974-06-03','95038');

select * from student where class in (95033,95031);

mysql> select * from student where class in (95033,95031);
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | 曾华      | 男   | 1977-09-01 00:00:00 | 95033 |
| 102 | 匡明      | 男   | 1975-10-02 00:00:00 | 95031 |
| 103 | 王丽      | 女   | 1976-01-23 00:00:00 | 95033 |
| 104 | 李军      | 男   | 1976-02-20 00:00:00 | 95033 |
| 105 | 王芳      | 女   | 1975-02-10 00:00:00 | 95031 |
| 106 | 陆君      | 男   | 1974-06-03 00:00:00 | 95031 |
| 107 | 王尼玛    | 男   | 1976-02-20 00:00:00 | 95033 |
| 108 | 张全蛋    | 女   | 1975-02-10 00:00:00 | 95031 |
| 109 | 赵铁柱    | 男   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
9 rows in set (0.01 sec)

mysql> select * from student where class not in (95033,95031);
+-----+--------+------+---------------------+-------+
| sno | sname  | ssex | sbirthday           | class |
+-----+--------+------+---------------------+-------+
| 110 | 张飞   | 男   | 1974-06-03 00:00:00 | 95038 |
+-----+--------+------+---------------------+-------+
1 row in set (0.00 sec)

-- 24、查询存在有85分以上成绩的课程Cno。
select cno,dgree from score where dgree>85;

mysql> select cno,dgree from score where dgree>85;
+-------+-------+
| cno   | dgree |
+-------+-------+
| 3-105 |    90 |
| 3-105 |    91 |
| 3-105 |    92 |
| 3-245 |    86 |
| 3-105 |    89 |
| 3-105 |    88 |
| 9-888 |    91 |
+-------+-------+
7 rows in set (0.00 sec)

-- 25、查询出“计算机系“教师所教课程的成绩表。
select tno from teacher where depart='计算机系';

+-----+
| tno |
+-----+
| 804 |
| 825 |
+-----+

select cno from course where tno in (select tno from teacher where depart='计算机系');

+-------+
| cno   |
+-------+
| 3-245 |
| 3-105 |
+-------+

select * from score where cno in (select cno from course where tno in (select tno from teacher where depart='计算机系'));
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-245 |    86 |
| 105 | 3-245 |    75 |
| 109 | 3-245 |    68 |
| 101 | 3-105 |    90 |
| 102 | 3-105 |    91 |
| 103 | 3-105 |    92 |
| 104 | 3-105 |    89 |
| 105 | 3-105 |    88 |
| 109 | 3-105 |    76 |
+-----+-------+-------+

-- 26、查询“计算机系”与“电子工程系“不同职称的教师的tname和prof。(教师名字和职称)
--union 求并集(过滤重复的)，union all (不过滤重复的)
--not in  不在范围内
select prof from teacher where depart='电子工程系';
select * from teacher where depart='计算机系' and prof not in (select prof from teacher where depart='电子工程系');
+-----+--------+------+---------------------+-----------+--------------+
| tno | tname  | tsex | tbirthday           | prof      | depart       |
+-----+--------+------+---------------------+-----------+--------------+
| 804 | 李诚   | 男   | 1958-12-02 00:00:00 | 副教授    | 计算机系     |
+-----+--------+------+---------------------+-----------+--------------+
select * from teacher where depart='电子工程系' and prof not in (select prof from teacher where depart='计算机系');
+-----+--------+------+---------------------+--------+-----------------+
| tno | tname  | tsex | tbirthday           | prof   | depart          |
+-----+--------+------+---------------------+--------+-----------------+
| 856 | 张旭   | 男   | 1969-03-12 00:00:00 | 讲师   | 电子工程系      |
+-----+--------+------+---------------------+--------+-----------------+

mysql> select * from teacher where depart='计算机系' and prof not in (select prof from teacher where depart='电子工程系')
    -> union
    -> select * from teacher where depart='电子工程系' and prof not in (select prof from teacher where depart='计算机系');
+-----+--------+------+---------------------+-----------+-----------------+
| tno | tname  | tsex | tbirthday           | prof      | depart          |
+-----+--------+------+---------------------+-----------+-----------------+
| 804 | 李诚   | 男   | 1958-12-02 00:00:00 | 副教授    | 计算机系        |
| 856 | 张旭   | 男   | 1969-03-12 00:00:00 | 讲师      | 电子工程系      |
+-----+--------+------+---------------------+-----------+-----------------+
2 rows in set (0.01 sec)

-- 27、查询选修编号为“3-105”课程且成绩至少高于选修编号为“3-245”的同学的Cno、Sno和dgree,
-- 并按dgree从高到低次序排序。
--至少？ 大于其中至少一个，关键词：any
select * from score where cno='3-105';
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 101 | 3-105 |    90 |
| 102 | 3-105 |    91 |
| 103 | 3-105 |    92 |
| 104 | 3-105 |    89 |
| 105 | 3-105 |    88 |
| 109 | 3-105 |    76 |
+-----+-------+-------+

select * from score where cno='3-245';
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-245 |    86 |
| 105 | 3-245 |    75 |
| 109 | 3-245 |    68 |
+-----+-------+-------+

select * from score where cno='3-105' 
and dgree>any(select dgree from score where cno='3-245') 
order by dgree desc;

mysql> select * from score where cno='3-105'
    -> and dgree>any(select dgree from score where cno='3-245')
    -> order by dgree desc;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
| 102 | 3-105 |    91 |
| 101 | 3-105 |    90 |
| 104 | 3-105 |    89 |
| 105 | 3-105 |    88 |
| 109 | 3-105 |    76 |
+-----+-------+-------+
6 rows in set (0.00 sec)

-- 28、查询选修编号为“3-105”且成绩高于选修编号为“3-245”课程的同学的Cno、Sno和Degree.
--且：“3-105”都的大于“3-245”。
--all 表示所有的关系
select * from score where cno='3-105' 
and dgree>all(select dgree from score where cno='3-245') 
order by dgree desc;

mysql> select * from score where cno='3-105'
    -> and dgree>all(select dgree from score where cno='3-245')
    -> order by dgree desc;
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
| 102 | 3-105 |    91 |
| 101 | 3-105 |    90 |
| 104 | 3-105 |    89 |
| 105 | 3-105 |    88 |
+-----+-------+-------+
5 rows in set (0.02 sec)

--29、查询所有教师和同学的name、sex和birthday。
--别名：as
select tname as name,tsex as sex,tbirthday as birthday from teacher
union
select sname,ssex,sbirthday from student;

mysql> select tname,tsex,tbirthday from teacher
    -> union
    -> select sname,ssex,sbirthday from student;
+-----------+------+---------------------+
| tname     | tsex | tbirthday           |
+-----------+------+---------------------+
| 李诚      | 男   | 1958-12-02 00:00:00 |
| 王萍      | 女   | 1972-05-05 00:00:00 |
| 刘冰      | 女   | 1977-08-14 00:00:00 |
| 张旭      | 男   | 1969-03-12 00:00:00 |
| 曾华      | 男   | 1977-09-01 00:00:00 |
| 匡明      | 男   | 1975-10-02 00:00:00 |
| 王丽      | 女   | 1976-01-23 00:00:00 |
| 李军      | 男   | 1976-02-20 00:00:00 |
| 王芳      | 女   | 1975-02-10 00:00:00 |
| 陆君      | 男   | 1974-06-03 00:00:00 |
| 王尼玛    | 男   | 1976-02-20 00:00:00 |
| 张全蛋    | 女   | 1975-02-10 00:00:00 |
| 赵铁柱    | 男   | 1974-06-03 00:00:00 |
| 张飞      | 男   | 1974-06-03 00:00:00 |
+-----------+------+---------------------+
14 rows in set (0.00 sec)

--30、查询所有“女”教师和“女”同学的name、sex和birthday.
select tname as name,tsex as sex,tbirthday as birthday from teacher where tsex='女'
union
select sname,ssex,sbirthday from student where ssex='女';

mysql> select tname as name,tsex as sex,tbirthday as birthday from teacher where tsex='女'
    -> union
    -> select sname,ssex,sbirthday from student where ssex='女';
+-----------+-----+---------------------+
| name      | sex | birthday            |
+-----------+-----+---------------------+
| 王萍      | 女  | 1972-05-05 00:00:00 |
| 刘冰      | 女  | 1977-08-14 00:00:00 |
| 王丽      | 女  | 1976-01-23 00:00:00 |
| 王芳      | 女  | 1975-02-10 00:00:00 |
| 张全蛋    | 女  | 1975-02-10 00:00:00 |
+-----------+-----+---------------------+
5 rows in set (0.00 sec)

-- 31、查询成绩比该课程平均成绩低的同学的成绩表。
select cno,avg(dgree) from score group by cno;
select * from score;
a表格：                      b表格：
+-----+-------+-------+     +-----+-------+-------+
| sno | cno   | dgree |     | sno | cno   | dgree |
+-----+-------+-------+     +-----+-------+-------+
| 101 | 3-105 |    90 |     | 101 | 3-105 |    90 |
| 102 | 3-105 |    91 |     | 102 | 3-105 |    91 |
| 103 | 3-105 |    92 |     | 103 | 3-105 |    92 |
| 103 | 3-245 |    86 |     | 103 | 3-245 |    86 |
| 103 | 6-166 |    85 |     | 103 | 6-166 |    85 |
| 103 | 9-888 |    64 |     | 103 | 9-888 |    64 |
| 104 | 3-105 |    89 |     | 104 | 3-105 |    89 |
| 105 | 3-105 |    88 |     | 105 | 3-105 |    88 |
| 105 | 3-245 |    75 |     | 105 | 3-245 |    75 |
| 105 | 6-166 |    79 |     | 105 | 6-166 |    79 |
| 105 | 9-888 |    91 |     | 105 | 9-888 |    91 |
| 109 | 3-105 |    76 |     | 109 | 3-105 |    76 |
| 109 | 3-245 |    68 |     | 109 | 3-245 |    68 |
| 109 | 6-166 |    81 |     | 109 | 6-166 |    81 |
| 109 | 9-888 |    78 |     | 109 | 9-888 |    78 |
+-----+-------+-------+     +-----+-------+-------+
--命名方式：score a,score b 
select *from score a where dgree<(select avg(dgree) from score b where a.cno=b.cno);

mysql> select *from score a where dgree<(select avg(dgree) from score b where a.cno=b.cno);
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 9-888 |    64 |
| 105 | 3-245 |    75 |
| 105 | 6-166 |    79 |
| 109 | 3-105 |    76 |
w| 109 | 3-245 |    68 |
| 109 | 6-166 |    81 |
+-----+-------+-------+
6 ros in set (0.00 sec)

--32、查询所有任课教师的Tname和Depart。
select tname,depart from teacher where tno in (select tno from course);

mysql> select tname,depart from teacher where tno in (select tno from course);
+--------+-----------------+
| tname  | depart          |
+--------+-----------------+
| 李诚   | 计算机系        |
| 王萍   | 计算机系        |
| 刘冰   | 电子工程系      |
| 张旭   | 电子工程系      |
+--------+-----------------+
4 rows in set (0.00 sec)

-- 33、查询至少有2名男生的班号。
select class from student where ssex='男' group by class having count(*)>1;

mysql> select class from student where ssex='男' group by class having count(*)>1;
+-------+
| class |
+-------+
| 95033 |
| 95031 |
+-------+
2 rows in set (0.01 sec)

-- 34、查询student表中不姓“ 王”的同学记录。(not like 取反)
select * from student where sname not like '王%';

mysql> select * from student where sname not like '王%';
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | 曾华      | 男   | 1977-09-01 00:00:00 | 95033 |
| 102 | 匡明      | 男   | 1975-10-02 00:00:00 | 95031 |
| 104 | 李军      | 男   | 1976-02-20 00:00:00 | 95033 |
| 106 | 陆君      | 男   | 1974-06-03 00:00:00 | 95031 |
| 108 | 张全蛋    | 女   | 1975-02-10 00:00:00 | 95031 |
| 109 | 赵铁柱    | 男   | 1974-06-03 00:00:00 | 95031 |
| 110 | 张飞      | 男   | 1974-06-03 00:00:00 | 95038 |
+-----+-----------+------+---------------------+-------+
7 rows in set (0.01 sec)

-- 35、查询student表中每个学生的姓名和年龄。
-- 年龄= 当前年份-出生年份
select year(now());
mysql> select year(now());
+-------------+
| year(now()) |
+-------------+
|        2020 |
+-------------+
1 row in set (0.01 sec)

select sname,year(now())-year(sbirthday) as '年龄' from student;

mysql> select sname,year(now())-year(sbirthday) as '年龄' from student;
+-----------+--------+
| sname     | 年龄   |
+-----------+--------+
| 曾华      |     43 |
| 匡明      |     45 |
| 王丽      |     44 |
| 李军      |     44 |
| 王芳      |     45 |
| 陆君      |     46 |
| 王尼玛    |     44 |
| 张全蛋    |     45 |
| 赵铁柱    |     46 |
| 张飞      |     46 |
+-----------+--------+
10 rows in set (0.00 sec)

-- 36、查询student表中最大和最小的sbirthday日期值。
--max() min() :大小值
select max(sbirthday) as '最大值',min(sbirthday) as '最小值' from student;

mysql> select max(sbirthday) as '最大值',min(sbirthday) as '最小值' from student;
+---------------------+---------------------+
| 最大值              | 最小值              |
+---------------------+---------------------+
| 1977-09-01 00:00:00 | 1974-06-03 00:00:00 |
+---------------------+---------------------+
1 row in set (0.00 sec)

-- 37、以班号和年龄从大到小的顺序查询student表中的全部记录。(日期是越小越大，所有用asc)
select * from student order by class desc,sbirthday asc;

mysql> select * from student order by class desc,sbirthday asc;
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 110 | 张飞      | 男   | 1974-06-03 00:00:00 | 95038 |
| 103 | 王丽      | 女   | 1976-01-23 00:00:00 | 95033 |
| 104 | 李军      | 男   | 1976-02-20 00:00:00 | 95033 |
| 107 | 王尼玛    | 男   | 1976-02-20 00:00:00 | 95033 |
| 101 | 曾华      | 男   | 1977-09-01 00:00:00 | 95033 |
| 106 | 陆君      | 男   | 1974-06-03 00:00:00 | 95031 |
| 109 | 赵铁柱    | 男   | 1974-06-03 00:00:00 | 95031 |
| 105 | 王芳      | 女   | 1975-02-10 00:00:00 | 95031 |
| 108 | 张全蛋    | 女   | 1975-02-10 00:00:00 | 95031 |
| 102 | 匡明      | 男   | 1975-10-02 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
10 rows in set (0.00 sec)

-- 38、查询“男”教师及其所上的课程。
select * from course where tno in (select tno from teacher where tsex='男');

mysql> select * from course where tno in (select tno from teacher where tsex='男');
+-------+--------------+-----+
| cno   | cname        | tno |
+-------+--------------+-----+
| 3-245 | 操作系统     | 804 |
| 6-166 | 数字电路     | 856 |
+-------+--------------+-----+
2 rows in set (0.01 sec)

-- 39、查询最高分同学的sno、cno和degree列。
select *from score where dgree=(select max(dgree) from score);

mysql> select *from score where dgree=(select max(dgree) from score);
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
+-----+-------+-------+
1 row in set (0.00 sec)

-- 40、查询和"李军”同性别的所有同学的Sname。
select sname from student where ssex=(select ssex from student where sname='李军');

mysql> select sname from student where ssex=(select ssex from student where sname='李军');
+-----------+
| sname     |
+-----------+
| 曾华      |
| 匡明      |
| 李军      |
| 陆君      |
| 王尼玛    |
| 赵铁柱    |
| 张飞      |
+-----------+
7 rows in set (0.00 sec)

-- <>  != :表示不等于情况
select sname from student where ssex=(select ssex from student where sname='李军') and sname != '李军';
+-----------+
| sname     |
+-----------+
| 曾华      |
| 匡明      |
| 陆君      |
| 王尼玛    |
| 赵铁柱    |
| 张飞      |
+-----------+

-- 41、查询和"李军”同性别并同班的同学Sname。
select sname from student where ssex=(select ssex from student where sname='李军') 
and class=(select class from student where sname='李军');

mysql> select sname from student where ssex=(select ssex from student where sname='李军')
    -> and class=(select class from student where sname='李军');
+-----------+
| sname     |
+-----------+
| 曾华      |
| 李军      |
| 王尼玛    |
+-----------+
3 rows in set (0.00 sec)

-- 42、查询所有选修计算机导论”课程的“男”同学的成绩表。
select * from score where cno=(select cno from course where cname='计算机导论') 
and sno in (select sno from student where ssex='男');

mysql> select * from score where cno=(select cno from course where cname='计算机导论')
    -> and sno in (select sno from student where ssex='男');
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 101 | 3-105 |    90 |
| 102 | 3-105 |    91 |
| 104 | 3-105 |    89 |
| 109 | 3-105 |    76 |
+-----+-------+-------+
4 rows in set (0.01 sec)

-- 43、假设使用如下命令建立了一个grade表:
create table grade(
low int(3),
upp int(3),
grade char(1)
);

insert into grade values(90,100,'A');
insert into grade values(80,89,'B');
insert into grade values(70,79,'C');
insert into grade values(60,69,'D');
insert into grade values(0,59,'E');

--现查询所有同学的sno、cno和grade列。
select sno,cno,grade from score,grade where dgree between low and upp;

mysql> select sno,cno,grade from score,grade where dgree between low and upp;
+-----+-------+-------+
| sno | cno   | grade |
+-----+-------+-------+
| 101 | 3-105 | A     |
| 102 | 3-105 | A     |
| 103 | 3-105 | A     |
| 103 | 3-245 | B     |
| 103 | 6-166 | B     |
| 103 | 9-888 | D     |
| 104 | 3-105 | B     |
| 105 | 3-105 | B     |
| 105 | 3-245 | C     |
| 105 | 6-166 | C     |
| 105 | 9-888 | A     |
| 109 | 3-105 | C     |
| 109 | 3-245 | D     |
| 109 | 6-166 | B     |
| 109 | 9-888 | C     |
+-----+-------+-------+
15 rows in set (0.01 sec)

