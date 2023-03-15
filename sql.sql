create table emp(
    id int comment '编号',
    workno varchar(10) comment '工号',
    name varchar(10) comment '姓名',
    gender char(1) comment '性别',
    age tinyint unsigned comment '年龄',
    idcard char(18) comment '身份证号',
    entrydate date comment '入职时间'
) comment '员工表';    #创建表结构

alter table emp add nickname varchar(20) comment '昵称';     #添加

alter table emp change nickname username varchar(30) comment '用户名';    #修改

alter table emp drop username;     #删除

alter table emp rename to employer;    #修改表名

drop table if exists tb_user;

truncate table employer;    #删除表后重建，留下表结构

insert into employer values (3,'3','韦一笑','男',38,'123256789012345679','2002-01-01'),(4,'4','赵敏','女',18,'123456789012345688','1001-01-01');

insert into employer values (1,'1','张无忌','男',18,'123256789012345679','2000-01-01')；

select * from employer;

update employer set name='Itheima' where id=1;

UPDATE employer SET NAME='小昭',gender='女' WHERE id=1;

UPDATE employer SET entrydate='2008-01-01';

DELETE FROM employer WHERE gender='女';

delete from employer;

SELECT DISTINCT workaddress '工作地址' FROM emp; #去重

select * from emp where age=88;

select * from emp where age<20;

select * from emp where age<=20;

select * from emp where idcard is null;

select * from emp where idcard is not null;

select * from emp where age !=88;

select * from emp where age <> 88;   #不等于

select * from emp where age >= 15 && age <= 20;

select * from emp where age >= 15 and age <= 20;

select * from emp where age between 15 and 20;  #小值在前，大值在后

select * from emp where gender = '女' and age <25;

select * from emp where age=18 or age=20 or age=40;

select * from emp where age in(18,20,40);
 
select * from emp where name like '__';  #查询名字为2个字的员工

select * from emp where name like '__';  #身份证最后一位是X的

select count(*) from emp;

select count(id) from emp;
 
#常见聚合函数，count统计数量，max最大值，min最小值，avg平均值，sum求和
#语法 select 聚合函数(字段列表) from 表名; null不参与聚合函数计算

select avg(age) from emp; #求平均年龄

select max(age) from emp;

select min(age) from emp;

select * from emp where workaddress='西安';

select sum(age) from emp where workaddress='西安';

select gender,count(*) from emp group by gender;

select gender,avg(age) from emp group by gender;

select workaddress,count(*) from emp where age<40 group by workaddress;

select workaddress,count(*) from emp where age<45 group by workaddress having count(*)>=3;

#分组查询，执行顺序：where>聚合函数>having

select gender,count(*) from emp group by gender;

select gender,avg(age) from emp group by gender;

select workaddress,count(*) address_count from emp where age<45 group by workaddress having address_count>=3;

select * from emp order by age asc; #年龄升序

select * from emp order by age desc; #降序

select * from emp order by entrydate desc;

select * from emp order by age asc,entrydate desc;

#分页查询，索引从零开始，select 字段列表 from 表名 limit 起始索引,查询记录数;

select * from emp limit 0,10;

select * from emp limit 10,10; #查询第二页，起始数：(页码减1)*页展示记录数

select * from emp where gender='女' and age in(20,21,22,23);

select * from emp where gender='男' and age between 20 and 40 and name like '___';

select gender,count(*) from emp where age < 60 group by gender;

select name,age,entrydate from emp where age<=35 order by age asc,entrydate desc;

select * from emp where gender='男' and age between 20 and 40 order by age asc,entrydate desc limit 5;

#DQL编写顺序select >from >where> group by>having>order by>limit
#DQL执行顺序from>where>group by>having>select>order by>limit

select name,age from emp where age>15 order by age asc;

select e.name,e.age from emp e where e.age>15 order by age asc; #别名e

create user 'itcast'@'localhost' identified by '123456';

create user 'heima'@'%' identified by '123456';  #主机名可以使用%通配

alter user 'heima'@'%' identified with mysql_native_password by '1234';  #修改密码

drop user 'itcast'@'localhost';

show grants for 'heima'@'%';

grant all on itcast.* to 'heima'@'%';

revoke all on itcast.* from 'heima'@'%';

select concat('hello',' MySQL');  #拼接字符串

select lower('Hello');

select upper('Hello');

select lpad('01',5,'-');  #左填充

select rpad('01',5,'-');  #右填充

select trim('  Hello  MySQL  ');  #去除首尾空格

select substring('Hello MySQL',1,5);  #从第1个字符开始截取，截取5个

select ceil(1.1);   #向上取整

select floor(1.9);  #向下取整

select mod(9,4);  #取余

select rand();   #0-1之间的随机数

select round(2.345,2);  #四舍五入保留2位

select round(rand()*1000000,0);  #产生一个6位的随机数，有bug

select lpad(round(rand()*1000000,0),6,0);

select curdate();

select curtime();

select now();

select year(now());

select date_add(now(),interval 70 day);  #往后推70天

select date_add(now(),interval 70 month);

select datediff('2021-10-01','2021-02-01');  #两个时间之间相差的天数

select name,datediff(curdate(),entrydate) from emp;

select name,datediff(curdate(),entrydate) as 'entrydays' from emp order by entrydays desc;

select if(false,'ok','error');

select ifnull(null,'Default');

select name,case workaddress when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end from emp;

select name,(case workaddress when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end) as '工作地址' from emp;

 create table score(
    id int comment 'ID',
    name varchar(20) comment '姓名',
    math int comment '数学',
    english int comment '英语',
    chinese int comment '语文'
    ) comment '学员成绩表';

insert into score(id,name,math,english,chinese) values (1,'Tom',67,88,95),(2,'Rose',23,66,90),(3,'Jack',56,98,76);

select id,name,math,english,chinese from score;

select 
  id,
  name,
  math,(case when math>=85 then '优秀' when math >=60 then '及格' else '不及格' end) as '数学',
  english,(case when english>=85 then '优秀' when english >=60 then '及格' else '不及格' end) as '英语',
  chinese,(case when chinese>=85 then '优秀' when chinese >=60 then '及格' else '不及格' end) as '语文'
from score;

create table user(
    id int primary key auto_increment comment '主键',
    name varchar(10) not null unique comment '姓名',
    age int check (age >0 && age<=120) comment '年龄',
    status char(1) default '1' comment '状态',
    gender char(1) comment '性别'
    ) comment '用户表';

insert into user(name,age,status,gender) values ('Tom1',19,'1','男'),('Tom2',25,'0','男');

alter table emp add constraint fk_emp_id foreign key(dept_id) references dept(id); #添加关联ID

alter table emp drop foreign key fk_emp_id;  #删除外键

alter table emp add constraint fk_emp_dept_id foreign key(dept_id) references dept(id) on update cascade on delete cascade;

update dept set id=6 where id=5;  #更新Id

delete from dept where id=1;   #删除表中的一行

create table tb_user_edu(
    id int auto_increment primary key comment '主键ID',
    degree varchar(20) comment '学历',
    major varchar(50) comment '专业',
    primaryschool varchar(50) comment '小学',
    middleschool varchar(50) comment '中学',
    university varchar(50) comment '大学',
    userid int unique comment '用户ID',
    constraint fk_userid foreign key (userid) references tb_user(id)
    ) comment '用户教育信息表

select * from emp,dept;  #多表查询

select * from emp,dept where emp.dept_id=dept.id;

select emp.name,dept.name from emp,dept where emp.dept_id=dept.id;

select e.name,d.name from emp e,dept d where e.dept_id=d.id;

select e.name,d.name from emp e inner join dept d on e.dept_id=d.id;

select e.*,d.name from emp e left outer join dept d on e.dept_id=d.id;

select d.*,e.* from emp e right outer join dept d on e.dept_id=d.id;

select a.name,b.name from emp a,emp b where a.managerid=b.id;

select a.name '员工' ,b.name '领导' from emp a left join emp b on a.managerid=b.id;

select * from emp where salary<5000;
select * from emp where age>50;

select * from emp where salary<5000 union all select * from emp where age>50;
select * from emp where salary<5000 union select * from emp where age>50; #去重

联合查询的多张表的列数必须保持一致，字段类型也需要保持一致

select id from dept where name='销售部';
select * from emp where dept_id=4;
select * from emp where dept_id=(select id from dept where name='销售部');

select entrydate from emp where name='方东白';
select * from emp where entrydate>'2009-02-12';
select * from emp where entrydate>(select entrydate from emp where name='方东白');

select id from dept where name='销售部' or name='市场部';
select * from emp where dept_id in (2,4);
select * from emp where dept_id in (select id from dept where name='销售部' or name='市场部');

select * from dept where name='财务部';
select salary from emp where dept_id=3;
select * from emp where salary>all(select salary from emp where dept_id=(select * from dept where name='财务部'));

select salary,managerid from emp where name='张无忌';
select * from emp where salary=12500 and managerid=1;
select * from emp where (salary,managerid)=(select salary,managerid from emp where name='张无忌');

create table salgrade(grade int,losal int,hisal int)comment '薪资等级表';
insert into salgrade values(1,0,3000);
insert into salgrade values(2,3001,5000);
insert into salgrade values(3,5001,8000);
update salgrade set losal=3001 where grade=2;  #修改表内容
delete from salgrade where grade=4;  #删除表内容
insert into salgrade values(6,15001,20000),(7,20001,25000);

select e.name,e.age,d.name from emp e,dept d where e.dept_id=d.id;





























