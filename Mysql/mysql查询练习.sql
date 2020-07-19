--mysql��ѯ��ϰ.sql

-- ѧ����(Student)
-- ѧ�� ���� �༶ �Ա� ���������� ���ڰ༶
create table Student(
	sno varchar(20) primary key,
	sname varchar(20) not null,
	ssex varchar(10) not null,
	sbirthday datetime,
	class varchar(20)
);

-- �γ̱�(Course)
-- �γ̺� �γ����� ��ʦ���
create table Course(
	cno varchar(20) primary key,
	cname varchar(20) not null,
	tno varchar(20) not null,
	foreign key(tno) references Teacher(tno)
);

-- �ɼ���(Score)
-- ѧ�� �γ̺� �ɼ�
-- create table Score(
-- 	sno varchar(20) primary key,
-- 	cno varchar(20) not null,
-- 	dgree decimal,
-- 	foreign key(sno) references Student(sno),
-- 	foreign key(cno) references Course(cno)
-- );
-- �����Ǵ����񣡣���
-- �޸����£�
drop table score;
create table Score(
	sno varchar(20) not null,
	cno varchar(20) not null,
	dgree decimal,
	foreign key(sno) references Student(sno),
	foreign key(cno) references Course(cno),
	primary key(sno, cno)
);

-- ��ʦ��(Teacher)
-- ��ʦ��� ��ʦ���� ��ʦ�Ա� ���������� ְ�� ���ڲ���
create table Teacher(
	tno varchar(20) primary key,
	tname varchar(20) not null,
	tsex varchar(10) not null,
	tbirthday datetime,
	prof varchar(20) not null,
	depart varchar(20) not null
);

--�����ݱ��������
#���ѧ����Ϣ��
insert into student values('101','����','��','1977-09-01','95033');
insert into student values('102','����','��','1975-10-02','95031');
insert into student values('103','����','Ů','1976-01-23','95033');
insert into student values('104','���','��','1976-02-20','95033');
insert into student values('105','����','Ů','1975-02-10','95031');
insert into student values('106','½��','��','1974-06-03','95031');
insert into student values('107','������','��','1976-02-20','95033');
insert into student values('108','��ȫ��','Ů','1975-02-10','95031');
insert into student values('109','������','��','1974-06-03','95031');

#��ӽ�ʦ��Ϣ��
insert into teacher values('804','���','��','1958-12-02','������','�����ϵ');
insert into teacher values('856','����','��','1969-03-12','��ʦ','���ӹ���ϵ');
insert into teacher values('825','��Ƽ','Ů','1972-05-05','����','�����ϵ');
insert into teacher values('831','����','Ů','1977-08-14','����','���ӹ���ϵ');

#��ӿγ���Ϣ��
insert into course values('3-105','���������','825');
insert into course values('3-245','����ϵͳ','804');
insert into course values('6-166','���ֵ�·','856');
insert into course values('9-888','�ߵ���ѧ','831');

#��ӳɼ���Ϣ��
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

-------��ѯ��ϰ
-- 1�� ��ѯstudent������м�¼��
mysql> select * from student;
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | ����      | ��   | 1977-09-01 00:00:00 | 95033 |
| 102 | ����      | ��   | 1975-10-02 00:00:00 | 95031 |
| 103 | ����      | Ů   | 1976-01-23 00:00:00 | 95033 |
| 104 | ���      | ��   | 1976-02-20 00:00:00 | 95033 |
| 105 | ����      | Ů   | 1975-02-10 00:00:00 | 95031 |
| 106 | ½��      | ��   | 1974-06-03 00:00:00 | 95031 |
| 107 | ������    | ��   | 1976-02-20 00:00:00 | 95033 |
| 108 | ��ȫ��    | Ů   | 1975-02-10 00:00:00 | 95031 |
| 109 | ������    | ��   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
9 rows in set (0.00 sec)

-- 2�� ��ѯstudent���е����м�¼��sname��ssex��class�С�
select sname,ssex,class from student;

mysql> select sname,ssex,class from student;
+-----------+------+-------+
| sname     | ssex | class |
+-----------+------+-------+
| ����      | ��   | 95033 |
| ����      | ��   | 95031 |
| ����      | Ů   | 95033 |
| ���      | ��   | 95033 |
| ����      | Ů   | 95031 |
| ½��      | ��   | 95031 |
| ������    | ��   | 95033 |
| ��ȫ��    | Ů   | 95031 |
| ������    | ��   | 95031 |
+-----------+------+-------+
9 rows in set (0.00 sec)

--3�� ��ѯ��ʦ���еĵ�λ�����ظ���depart�С�
select depart from teacher;

mysql> select depart from teacher;
+-----------------+
| depart          |
+-----------------+
| �����ϵ        |
| �����ϵ        |
| ���ӹ���ϵ      |
| ���ӹ���ϵ      |
+-----------------+
4 rows in set (0.00 sec)


---------(�ؼ��֣�distinct �ų��ظ�)----------
select distinct depart from teacher;

mysql> select distinct depart from teacher;
+-----------------+
| depart          |
+-----------------+
| �����ϵ        |
| ���ӹ���ϵ      |
+-----------------+
2 rows in set (0.01 sec)

--4����ѯscore���� �ɼ���60��80֮������м�¼��
--����һ����ѯ������Ҫʹ�ã�between...and.... ʵ��
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

select * from score where dgree between 80 and 60;(ֻ���Դ�С��)

mysql> select * from score where dgree between 80 and 60;
Empty set (0.00 sec)

--����������ѯ������Ҫʹ��'>'��'<'д
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

--5�� ��ѯscore���гɼ�Ϊ85�� 86��88�ļ�¼��
--��ʾ���߹�ϵ��ѯ��in �ؼ���ʹ��(���ڡ�����˼)
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

--6�� ��ѯstudent���С�95031"����Ա�Ϊ��Ů����ͬѧ��¼��
--or ��ʾ����
select * from student where class='95031' or ssex='Ů';

mysql> select * from student where class='95031' or ssex='Ů';
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 102 | ����      | ��   | 1975-10-02 00:00:00 | 95031 |
| 103 | ����      | Ů   | 1976-01-23 00:00:00 | 95033 |
| 105 | ����      | Ů   | 1975-02-10 00:00:00 | 95031 |
| 106 | ½��      | ��   | 1974-06-03 00:00:00 | 95031 |
| 108 | ��ȫ��    | Ů   | 1975-02-10 00:00:00 | 95031 |
| 109 | ������    | ��   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
6 rows in set (0.00 sec)

--7����class�����ѯstudent������м�¼��
--���򣬽����ʹ��order by��� desc ���� asc ����(Ĭ�����򣬲�ȥдҲ����)
select * from student order by class desc;

mysql> select * from student order by class desc;
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | ����      | ��   | 1977-09-01 00:00:00 | 95033 |
| 103 | ����      | Ů   | 1976-01-23 00:00:00 | 95033 |
| 104 | ���      | ��   | 1976-02-20 00:00:00 | 95033 |
| 107 | ������    | ��   | 1976-02-20 00:00:00 | 95033 |
| 102 | ����      | ��   | 1975-10-02 00:00:00 | 95031 |
| 105 | ����      | Ů   | 1975-02-10 00:00:00 | 95031 |
| 106 | ½��      | ��   | 1974-06-03 00:00:00 | 95031 |
| 108 | ��ȫ��    | Ů   | 1975-02-10 00:00:00 | 95031 |
| 109 | ������    | ��   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
9 rows in set (0.00 sec)

--����asc(��������������)
select * from student order by class;
select * from student order by class asc;

--8����cno���� dgree���� ��ѯscore������м�¼��
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

����cno���������������ͬ����dgree�Ľ�������

--9����ѯ��95031"���ѧ��������
--ͳ�ƹؼ��ʣ�count
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

--10����ѯscore���е���߷ֵ�ѧ��ѧ�źͿγ̺š� (�Ӳ�ѯ��������)
--�Ӳ�ѯ
select sno,cno from score where dgree=(select max(dgree) from score);

mysql> select sno,cno from score where dgree=(select max(dgree) from score);
+-----+-------+
| sno | cno   |
+-----+-------+
| 103 | 3-105 |
+-----+-------+
1 row in set (0.00 sec)

--1 �ҵ���߷�����
select max(dgree) from score;

mysql> select max(dgree) from score;
+------------+
| max(dgree) |
+------------+
|         92 |
+------------+
1 row in set (0.00 sec)

--2 �ҵ���߷����е� sno ��cno��
select sno,cno from score where dgree=(select max(dgree) from score);

--����������(limit a,b ����ʾ��a��ʼ������b�� ��Ϣ��ȡ)
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

--11����ѯÿ�ſε�ƽ���ɼ���
mysql> select *from Course;
+-------+-----------------+-----+
| cno   | cname           | tno |
+-------+-----------------+-----+
| 3-105 | ���������      | 825 |
| 3-245 | ����ϵͳ        | 804 |
| 6-166 | ���ֵ�·        | 856 |
| 9-888 | �ߵ���ѧ        | 831 |
+-------+-----------------+-----+
4 rows in set (0.01 sec)

--avg():��ƽ��ֵ
select avg(dgree) from score where cno='3-105';

mysql> select avg(dgree) from score where cno='3-105';
+------------+
| avg(dgree) |
+------------+
|    85.3333 |
+------------+
1 row in set (0.01 sec)

--������õ�ȫ��ƽ���ɼ���Ϣ
--group by ����
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

--12����ѯscore����������2��ѧ��ѡ�޵Ĳ���3��ͷ�Ŀγ̵�ƽ��������
--like '��%' ��ʾ�ԡ���ͷ�Ĳ�ѯ
--group by ... having ... (����where)
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

--������ִ�����Ϣ������ 
mysql> select cno,avg(dgree),count(*) from score group by cno having count(cno)>=2 and cno like'3%';
+-------+------------+----------+
| cno   | avg(dgree) | count(*) |
+-------+------------+----------+
| 3-105 |    85.3333 |        3 |
| 3-245 |    76.3333 |        3 |
+-------+------------+----------+
2 rows in set (0.00 sec)

--13����ѯ��������70��С��90��sno�С�
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

--14����ѯ����ѧ����sname��cno��degree�С�
--�����������
select sname,cno,dgree from student,score where student.sno=score.sno;

mysql> select sname,cno,dgree from student,score where student.sno=score.sno;
+-----------+-------+-------+
| sname     | cno   | dgree |
+-----------+-------+-------+
| ����      | 3-105 |    92 |
| ����      | 3-245 |    86 |
| ����      | 6-166 |    85 |
| ����      | 9-888 |    64 |
| ����      | 3-105 |    88 |
| ����      | 3-245 |    75 |
| ����      | 6-166 |    79 |
| ����      | 9-888 |    91 |
| ������    | 3-105 |    76 |
| ������    | 3-245 |    68 |
| ������    | 6-166 |    81 |
| ������    | 9-888 |    78 |
+-----------+-------+-------+
12 rows in set (0.00 sec)

mysql> select sno,sname from student;
+-----+-----------+
| sno | sname     |
+-----+-----------+
| 101 | ����      |
| 102 | ����      |
| 103 | ����      |
| 104 | ���      |
| 105 | ����      |
| 106 | ½��      |
| 107 | ������    |
| 108 | ��ȫ��    |
| 109 | ������    |
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

--15����ѯ����ѧ����sno��cname��degree�С�
select sno,cname,dgree from course,score where course.cno=score.cno;

mysql> select sno,cname,dgree from course,score where course.cno=score.cno;
+-----+-----------------+-------+
| sno | cname           | dgree |
+-----+-----------------+-------+
| 103 | ���������      |    92 |
| 105 | ���������      |    88 |
| 109 | ���������      |    76 |
| 103 | ����ϵͳ        |    86 |
| 105 | ����ϵͳ        |    75 |
| 109 | ����ϵͳ        |    68 |
| 103 | ���ֵ�·        |    85 |
| 105 | ���ֵ�·        |    79 |
| 109 | ���ֵ�·        |    81 |
| 103 | �ߵ���ѧ        |    64 |
| 105 | �ߵ���ѧ        |    91 |
| 109 | �ߵ���ѧ        |    78 |
+-----+-----------------+-------+
12 rows in set (0.00 sec)

--16����ѯ����ѧ����sname��cname��degree�С�
sname -> student
cname -> course
dgree -> score
--����������ͬ�ı����β�ѯ(�ұ��֮�����ͬ�ؼ���)��
select sname,cname,dgree from student,course,score where student.sno=score.sno and Course.cno=score.cno;

mysql> select sname,cname,dgree from student,course,score where student.sno=score.sno and Course.cno=score.cno;
+-----------+-----------------+-------+
| sname     | cname           | dgree |
+-----------+-----------------+-------+
| ����      | ���������      |    92 |
| ����      | ���������      |    88 |
| ������    | ���������      |    76 |
| ����      | ����ϵͳ        |    86 |
| ����      | ����ϵͳ        |    75 |
| ������    | ����ϵͳ        |    68 |
| ����      | ���ֵ�·        |    85 |
| ����      | ���ֵ�·        |    79 |
| ������    | ���ֵ�·        |    81 |
| ����      | �ߵ���ѧ        |    64 |
| ����      | �ߵ���ѧ        |    91 |
| ������    | �ߵ���ѧ        |    78 |
+-----------+-----------------+-------+
12 rows in set (0.00 sec)

--��ͬ�ؼ��ֵ�ʱ�����������壬��Ҫָ������
--�޸���ʾ�б�������as��
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
| ����      | ���������      |    92 | 103 | 3-105 |
| ����      | ���������      |    88 | 105 | 3-105 |
| ������    | ���������      |    76 | 109 | 3-105 |
| ����      | ����ϵͳ        |    86 | 103 | 3-245 |
| ����      | ����ϵͳ        |    75 | 105 | 3-245 |
| ������    | ����ϵͳ        |    68 | 109 | 3-245 |
| ����      | ���ֵ�·        |    85 | 103 | 6-166 |
| ����      | ���ֵ�·        |    79 | 105 | 6-166 |
| ������    | ���ֵ�·        |    81 | 109 | 6-166 |
| ����      | �ߵ���ѧ        |    64 | 103 | 9-888 |
| ����      | �ߵ���ѧ        |    91 | 105 | 9-888 |
| ������    | �ߵ���ѧ        |    78 | 109 | 9-888 |
+-----------+-----------------+-------+-----+-------+
12 rows in set (0.00 sec)

mysql> select sname,cname,dgree,student.sno as stu_sno,course.cno as cou_cno
    -> from student,course,score
    -> where student.sno=score.sno
    -> and Course.cno=score.cno;
+-----------+-----------------+-------+---------+---------+
| sname     | cname           | dgree | stu_sno | cou_cno |
+-----------+-----------------+-------+---------+---------+
| ����      | ���������      |    92 | 103     | 3-105   |
| ����      | ���������      |    88 | 105     | 3-105   |
| ������    | ���������      |    76 | 109     | 3-105   |
| ����      | ����ϵͳ        |    86 | 103     | 3-245   |
| ����      | ����ϵͳ        |    75 | 105     | 3-245   |
| ������    | ����ϵͳ        |    68 | 109     | 3-245   |
| ����      | ���ֵ�·        |    85 | 103     | 6-166   |
| ����      | ���ֵ�·        |    79 | 105     | 6-166   |
| ������    | ���ֵ�·        |    81 | 109     | 6-166   |
| ����      | �ߵ���ѧ        |    64 | 103     | 9-888   |
| ����      | �ߵ���ѧ        |    91 | 105     | 9-888   |
| ������    | �ߵ���ѧ        |    78 | 109     | 9-888   |
+-----------+-----------------+-------+---------+---------+
12 rows in set (0.00 sec)


--��ͬ�ֶε���ȵ���ϵ��
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
| ����      | ���������      |    92 | 103     | 103     | 3-105   | 3-105   |
| ����      | ���������      |    88 | 105     | 105     | 3-105   | 3-105   |
| ������    | ���������      |    76 | 109     | 109     | 3-105   | 3-105   |
| ����      | ����ϵͳ        |    86 | 103     | 103     | 3-245   | 3-245   |
| ����      | ����ϵͳ        |    75 | 105     | 105     | 3-245   | 3-245   |
| ������    | ����ϵͳ        |    68 | 109     | 109     | 3-245   | 3-245   |
| ����      | ���ֵ�·        |    85 | 103     | 103     | 6-166   | 6-166   |
| ����      | ���ֵ�·        |    79 | 105     | 105     | 6-166   | 6-166   |
| ������    | ���ֵ�·        |    81 | 109     | 109     | 6-166   | 6-166   |
| ����      | �ߵ���ѧ        |    64 | 103     | 103     | 9-888   | 9-888   |
| ����      | �ߵ���ѧ        |    91 | 105     | 105     | 9-888   | 9-888   |
| ������    | �ߵ���ѧ        |    78 | 109     | 109     | 9-888   | 9-888   |
+-----------+-----------------+-------+---------+---------+---------+---------+
12 rows in set (0.00 sec)

--17����ѯ��95031"��ѧ��ÿ�ſε�ƽ���֡�
select *from student where class='95031';

mysql> select *from student where class='95031';
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 102 | ����      | ��   | 1975-10-02 00:00:00 | 95031 |
| 105 | ����      | Ů   | 1975-02-10 00:00:00 | 95031 |
| 106 | ½��      | ��   | 1974-06-03 00:00:00 | 95031 |
| 108 | ��ȫ��    | Ů   | 1975-02-10 00:00:00 | 95031 |
| 109 | ������    | ��   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
5 rows in set (0.00 sec)
--��ѯscore���е�sno��Ϣ��student���е�sno��Ϣ��ͬ��(ʹ�ã�in)
--in ������where���ʽ�У��������ǲ�ѯĳ����Χ�ڵ����ݡ�
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

����һ��
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

��������
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

-- 18����ѯѡ�ޡ�3-105���γ̵ĳɼ����ڡ�109����ͬѧ��3-105���ɼ�������ͬѧ�ļ�¼��
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

--19����ѯ�ɼ�����ѧ��Ϊ��109�����γ̺�Ϊ��3-105"�ĳɼ������м�¼��
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

--20����ѯ��ѧ��Ϊ108��101��ͬѧͬ�����������ѧ����sno��sname��sbirthday�С�
--year():��ѯ�����
--in��in������where���ʽ�У��������ǲ�ѯĳ����Χ�ڵ����ݡ�
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
| 101 | ����      | ��   | 1977-09-01 00:00:00 | 95033 |
| 102 | ����      | ��   | 1975-10-02 00:00:00 | 95031 |
| 105 | ����      | Ů   | 1975-02-10 00:00:00 | 95031 |
| 108 | ��ȫ��    | Ů   | 1975-02-10 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
4 rows in set (0.00 sec)

--21����ѯ�����񡰽�ʦ�οε�ѧ���ɼ�
select tno from teacher where tname='����';

--����һ��
select * from score where cno=(select cno from course 
where tno=(select tno from teacher where tname='����'));

mysql> select * from score where cno=(select cno from course where tno=(select tno from teacher where tname='����'));
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 6-166 |    85 |
| 105 | 6-166 |    79 |
| 109 | 6-166 |    81 |
+-----+-------+-------+
3 rows in set (0.00 sec)

--��������
select sno,score.cno,dgree from teacher,score,course where teacher.tno=course.tno and course.cno=score.cno and tname='����';

mysql> select sno,score.cno,dgree from teacher,score,course
    -> where teacher.tno=course.tno and course.cno=score.cno and tname='����';
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 6-166 |    85 |
| 105 | 6-166 |    79 |
| 109 | 6-166 |    81 |
+-----+-------+-------+
3 rows in set (0.00 sec)

-- 22����ѯѡ��ĳ�γ̵�ͬѧ��������5�˵Ľ�ʦ������
--��������ȱʧ����Ҫ������ݣ�
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
| ��Ƽ   |
+--------+
1 row in set (0.00 sec)

-- 23����ѯ95033���95031��ȫ��ѧ���ļ�¼��
insert into student values('110','�ŷ�','��','1974-06-03','95038');

select * from student where class in (95033,95031);

mysql> select * from student where class in (95033,95031);
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | ����      | ��   | 1977-09-01 00:00:00 | 95033 |
| 102 | ����      | ��   | 1975-10-02 00:00:00 | 95031 |
| 103 | ����      | Ů   | 1976-01-23 00:00:00 | 95033 |
| 104 | ���      | ��   | 1976-02-20 00:00:00 | 95033 |
| 105 | ����      | Ů   | 1975-02-10 00:00:00 | 95031 |
| 106 | ½��      | ��   | 1974-06-03 00:00:00 | 95031 |
| 107 | ������    | ��   | 1976-02-20 00:00:00 | 95033 |
| 108 | ��ȫ��    | Ů   | 1975-02-10 00:00:00 | 95031 |
| 109 | ������    | ��   | 1974-06-03 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
9 rows in set (0.01 sec)

mysql> select * from student where class not in (95033,95031);
+-----+--------+------+---------------------+-------+
| sno | sname  | ssex | sbirthday           | class |
+-----+--------+------+---------------------+-------+
| 110 | �ŷ�   | ��   | 1974-06-03 00:00:00 | 95038 |
+-----+--------+------+---------------------+-------+
1 row in set (0.00 sec)

-- 24����ѯ������85�����ϳɼ��Ŀγ�Cno��
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

-- 25����ѯ���������ϵ����ʦ���̿γ̵ĳɼ���
select tno from teacher where depart='�����ϵ';

+-----+
| tno |
+-----+
| 804 |
| 825 |
+-----+

select cno from course where tno in (select tno from teacher where depart='�����ϵ');

+-------+
| cno   |
+-------+
| 3-245 |
| 3-105 |
+-------+

select * from score where cno in (select cno from course where tno in (select tno from teacher where depart='�����ϵ'));
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

-- 26����ѯ�������ϵ���롰���ӹ���ϵ����ְͬ�ƵĽ�ʦ��tname��prof��(��ʦ���ֺ�ְ��)
--union �󲢼�(�����ظ���)��union all (�������ظ���)
--not in  ���ڷ�Χ��
select prof from teacher where depart='���ӹ���ϵ';
select * from teacher where depart='�����ϵ' and prof not in (select prof from teacher where depart='���ӹ���ϵ');
+-----+--------+------+---------------------+-----------+--------------+
| tno | tname  | tsex | tbirthday           | prof      | depart       |
+-----+--------+------+---------------------+-----------+--------------+
| 804 | ���   | ��   | 1958-12-02 00:00:00 | ������    | �����ϵ     |
+-----+--------+------+---------------------+-----------+--------------+
select * from teacher where depart='���ӹ���ϵ' and prof not in (select prof from teacher where depart='�����ϵ');
+-----+--------+------+---------------------+--------+-----------------+
| tno | tname  | tsex | tbirthday           | prof   | depart          |
+-----+--------+------+---------------------+--------+-----------------+
| 856 | ����   | ��   | 1969-03-12 00:00:00 | ��ʦ   | ���ӹ���ϵ      |
+-----+--------+------+---------------------+--------+-----------------+

mysql> select * from teacher where depart='�����ϵ' and prof not in (select prof from teacher where depart='���ӹ���ϵ')
    -> union
    -> select * from teacher where depart='���ӹ���ϵ' and prof not in (select prof from teacher where depart='�����ϵ');
+-----+--------+------+---------------------+-----------+-----------------+
| tno | tname  | tsex | tbirthday           | prof      | depart          |
+-----+--------+------+---------------------+-----------+-----------------+
| 804 | ���   | ��   | 1958-12-02 00:00:00 | ������    | �����ϵ        |
| 856 | ����   | ��   | 1969-03-12 00:00:00 | ��ʦ      | ���ӹ���ϵ      |
+-----+--------+------+---------------------+-----------+-----------------+
2 rows in set (0.01 sec)

-- 27����ѯѡ�ޱ��Ϊ��3-105���γ��ҳɼ����ٸ���ѡ�ޱ��Ϊ��3-245����ͬѧ��Cno��Sno��dgree,
-- ����dgree�Ӹߵ��ʹ�������
--���٣� ������������һ�����ؼ��ʣ�any
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

-- 28����ѯѡ�ޱ��Ϊ��3-105���ҳɼ�����ѡ�ޱ��Ϊ��3-245���γ̵�ͬѧ��Cno��Sno��Degree.
--�ң���3-105�����Ĵ��ڡ�3-245����
--all ��ʾ���еĹ�ϵ
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

--29����ѯ���н�ʦ��ͬѧ��name��sex��birthday��
--������as
select tname as name,tsex as sex,tbirthday as birthday from teacher
union
select sname,ssex,sbirthday from student;

mysql> select tname,tsex,tbirthday from teacher
    -> union
    -> select sname,ssex,sbirthday from student;
+-----------+------+---------------------+
| tname     | tsex | tbirthday           |
+-----------+------+---------------------+
| ���      | ��   | 1958-12-02 00:00:00 |
| ��Ƽ      | Ů   | 1972-05-05 00:00:00 |
| ����      | Ů   | 1977-08-14 00:00:00 |
| ����      | ��   | 1969-03-12 00:00:00 |
| ����      | ��   | 1977-09-01 00:00:00 |
| ����      | ��   | 1975-10-02 00:00:00 |
| ����      | Ů   | 1976-01-23 00:00:00 |
| ���      | ��   | 1976-02-20 00:00:00 |
| ����      | Ů   | 1975-02-10 00:00:00 |
| ½��      | ��   | 1974-06-03 00:00:00 |
| ������    | ��   | 1976-02-20 00:00:00 |
| ��ȫ��    | Ů   | 1975-02-10 00:00:00 |
| ������    | ��   | 1974-06-03 00:00:00 |
| �ŷ�      | ��   | 1974-06-03 00:00:00 |
+-----------+------+---------------------+
14 rows in set (0.00 sec)

--30����ѯ���С�Ů����ʦ�͡�Ů��ͬѧ��name��sex��birthday.
select tname as name,tsex as sex,tbirthday as birthday from teacher where tsex='Ů'
union
select sname,ssex,sbirthday from student where ssex='Ů';

mysql> select tname as name,tsex as sex,tbirthday as birthday from teacher where tsex='Ů'
    -> union
    -> select sname,ssex,sbirthday from student where ssex='Ů';
+-----------+-----+---------------------+
| name      | sex | birthday            |
+-----------+-----+---------------------+
| ��Ƽ      | Ů  | 1972-05-05 00:00:00 |
| ����      | Ů  | 1977-08-14 00:00:00 |
| ����      | Ů  | 1976-01-23 00:00:00 |
| ����      | Ů  | 1975-02-10 00:00:00 |
| ��ȫ��    | Ů  | 1975-02-10 00:00:00 |
+-----------+-----+---------------------+
5 rows in set (0.00 sec)

-- 31����ѯ�ɼ��ȸÿγ�ƽ���ɼ��͵�ͬѧ�ĳɼ���
select cno,avg(dgree) from score group by cno;
select * from score;
a���                      b���
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
--������ʽ��score a,score b 
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

--32����ѯ�����ον�ʦ��Tname��Depart��
select tname,depart from teacher where tno in (select tno from course);

mysql> select tname,depart from teacher where tno in (select tno from course);
+--------+-----------------+
| tname  | depart          |
+--------+-----------------+
| ���   | �����ϵ        |
| ��Ƽ   | �����ϵ        |
| ����   | ���ӹ���ϵ      |
| ����   | ���ӹ���ϵ      |
+--------+-----------------+
4 rows in set (0.00 sec)

-- 33����ѯ������2�������İ�š�
select class from student where ssex='��' group by class having count(*)>1;

mysql> select class from student where ssex='��' group by class having count(*)>1;
+-------+
| class |
+-------+
| 95033 |
| 95031 |
+-------+
2 rows in set (0.01 sec)

-- 34����ѯstudent���в��ա� ������ͬѧ��¼��(not like ȡ��)
select * from student where sname not like '��%';

mysql> select * from student where sname not like '��%';
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 101 | ����      | ��   | 1977-09-01 00:00:00 | 95033 |
| 102 | ����      | ��   | 1975-10-02 00:00:00 | 95031 |
| 104 | ���      | ��   | 1976-02-20 00:00:00 | 95033 |
| 106 | ½��      | ��   | 1974-06-03 00:00:00 | 95031 |
| 108 | ��ȫ��    | Ů   | 1975-02-10 00:00:00 | 95031 |
| 109 | ������    | ��   | 1974-06-03 00:00:00 | 95031 |
| 110 | �ŷ�      | ��   | 1974-06-03 00:00:00 | 95038 |
+-----+-----------+------+---------------------+-------+
7 rows in set (0.01 sec)

-- 35����ѯstudent����ÿ��ѧ�������������䡣
-- ����= ��ǰ���-�������
select year(now());
mysql> select year(now());
+-------------+
| year(now()) |
+-------------+
|        2020 |
+-------------+
1 row in set (0.01 sec)

select sname,year(now())-year(sbirthday) as '����' from student;

mysql> select sname,year(now())-year(sbirthday) as '����' from student;
+-----------+--------+
| sname     | ����   |
+-----------+--------+
| ����      |     43 |
| ����      |     45 |
| ����      |     44 |
| ���      |     44 |
| ����      |     45 |
| ½��      |     46 |
| ������    |     44 |
| ��ȫ��    |     45 |
| ������    |     46 |
| �ŷ�      |     46 |
+-----------+--------+
10 rows in set (0.00 sec)

-- 36����ѯstudent����������С��sbirthday����ֵ��
--max() min() :��Сֵ
select max(sbirthday) as '���ֵ',min(sbirthday) as '��Сֵ' from student;

mysql> select max(sbirthday) as '���ֵ',min(sbirthday) as '��Сֵ' from student;
+---------------------+---------------------+
| ���ֵ              | ��Сֵ              |
+---------------------+---------------------+
| 1977-09-01 00:00:00 | 1974-06-03 00:00:00 |
+---------------------+---------------------+
1 row in set (0.00 sec)

-- 37���԰�ź�����Ӵ�С��˳���ѯstudent���е�ȫ����¼��(������ԽСԽ��������asc)
select * from student order by class desc,sbirthday asc;

mysql> select * from student order by class desc,sbirthday asc;
+-----+-----------+------+---------------------+-------+
| sno | sname     | ssex | sbirthday           | class |
+-----+-----------+------+---------------------+-------+
| 110 | �ŷ�      | ��   | 1974-06-03 00:00:00 | 95038 |
| 103 | ����      | Ů   | 1976-01-23 00:00:00 | 95033 |
| 104 | ���      | ��   | 1976-02-20 00:00:00 | 95033 |
| 107 | ������    | ��   | 1976-02-20 00:00:00 | 95033 |
| 101 | ����      | ��   | 1977-09-01 00:00:00 | 95033 |
| 106 | ½��      | ��   | 1974-06-03 00:00:00 | 95031 |
| 109 | ������    | ��   | 1974-06-03 00:00:00 | 95031 |
| 105 | ����      | Ů   | 1975-02-10 00:00:00 | 95031 |
| 108 | ��ȫ��    | Ů   | 1975-02-10 00:00:00 | 95031 |
| 102 | ����      | ��   | 1975-10-02 00:00:00 | 95031 |
+-----+-----------+------+---------------------+-------+
10 rows in set (0.00 sec)

-- 38����ѯ���С���ʦ�������ϵĿγ̡�
select * from course where tno in (select tno from teacher where tsex='��');

mysql> select * from course where tno in (select tno from teacher where tsex='��');
+-------+--------------+-----+
| cno   | cname        | tno |
+-------+--------------+-----+
| 3-245 | ����ϵͳ     | 804 |
| 6-166 | ���ֵ�·     | 856 |
+-------+--------------+-----+
2 rows in set (0.01 sec)

-- 39����ѯ��߷�ͬѧ��sno��cno��degree�С�
select *from score where dgree=(select max(dgree) from score);

mysql> select *from score where dgree=(select max(dgree) from score);
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 103 | 3-105 |    92 |
+-----+-------+-------+
1 row in set (0.00 sec)

-- 40����ѯ��"�����ͬ�Ա������ͬѧ��Sname��
select sname from student where ssex=(select ssex from student where sname='���');

mysql> select sname from student where ssex=(select ssex from student where sname='���');
+-----------+
| sname     |
+-----------+
| ����      |
| ����      |
| ���      |
| ½��      |
| ������    |
| ������    |
| �ŷ�      |
+-----------+
7 rows in set (0.00 sec)

-- <>  != :��ʾ���������
select sname from student where ssex=(select ssex from student where sname='���') and sname != '���';
+-----------+
| sname     |
+-----------+
| ����      |
| ����      |
| ½��      |
| ������    |
| ������    |
| �ŷ�      |
+-----------+

-- 41����ѯ��"�����ͬ�Ա�ͬ���ͬѧSname��
select sname from student where ssex=(select ssex from student where sname='���') 
and class=(select class from student where sname='���');

mysql> select sname from student where ssex=(select ssex from student where sname='���')
    -> and class=(select class from student where sname='���');
+-----------+
| sname     |
+-----------+
| ����      |
| ���      |
| ������    |
+-----------+
3 rows in set (0.00 sec)

-- 42����ѯ����ѡ�޼�������ۡ��γ̵ġ��С�ͬѧ�ĳɼ���
select * from score where cno=(select cno from course where cname='���������') 
and sno in (select sno from student where ssex='��');

mysql> select * from score where cno=(select cno from course where cname='���������')
    -> and sno in (select sno from student where ssex='��');
+-----+-------+-------+
| sno | cno   | dgree |
+-----+-------+-------+
| 101 | 3-105 |    90 |
| 102 | 3-105 |    91 |
| 104 | 3-105 |    89 |
| 109 | 3-105 |    76 |
+-----+-------+-------+
4 rows in set (0.01 sec)

-- 43������ʹ�������������һ��grade��:
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

--�ֲ�ѯ����ͬѧ��sno��cno��grade�С�
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

