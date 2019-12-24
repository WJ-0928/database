create table 汽车基本信息表
(
汽车编号 char(10) primary key,
汽车种类 char(10),
最大载客量 int,
线路号 char(10)
)

create table 车票信息表
(
车票编号 char(10) primary key,
售票情况 char(10),
票价 int,
线路号 char(10)
)

create table 线路信息表
(
线路号 char(10) primary key,
出发地 char(10),
目的地 char(10),
出发时间 char(10),
所需时间 int
)

create table 乘客信息表
(出发时间 char(10),
出发地 char(10),
目的地 char(10),
汽车编号 char(10) primary key,
线路号 char(10)
)


/*索引*/

/* 为汽车基本信息表创建索引*/

create unique index im_in
on 汽车基本信息表(汽车编号)

/* 为线路信息表创建索引*/

create unique index il_il
on 线路信息表(线路号)

/* 为车票信息表创建索引*/

create unique index id_ix
on 车票信息表(车票编号)

/* 为乘客信息表创建索引*/

create unique index ih_ig
on 乘客信息表(汽车编号)


/*视图*/

/*为汽车基本信息表创建视图*/

create view view_1
as
select 汽车编号,汽车种类,最大载客量,线路号
from 汽车基本信息表

/*为线路信息表创建视图*/

create view view_2
as
select 线路号,出发地,目的地,出发时间,所需时间
from 线路信息表


/*为车票信息表创建视图*/

create view view_3
as
select 车票编号,售票情况,票价,线路号
from 车票信息表

/*为乘客信息表创建视图*/

create view view_4
as
select 出发时间,出发地,目的地,汽车编号,线路号
from 乘客信息表



/*录入数据*/

insert
into 车票信息表
values('001','良好','25','101')

insert
into 车票信息表
values('002','良好','30','102')

insert
into 车票信息表
values('003','稀疏','45','103')

insert
into 车票信息表
values('004','拥挤','80','104')

insert
into 车票信息表
values('005','稀疏','19','105')

insert
into 车票信息表
values('006','良好','101','106')

insert
into 汽车基本信息表
values ('1','A','25','101')

insert
into 汽车基本信息表
values ('2','B','50','102')

insert
into 汽车基本信息表
values ('3','C','20','103')

insert
into 汽车基本信息表
values ('4','D','46','104')

insert
into 汽车基本信息表
values ('5','E','55','105')

insert
into 汽车基本信息表
values ('6','F','35','106')

insert
into 线路信息表
values ('101','扶风','宝鸡','9:00','2')

insert
into 线路信息表
values ('102','宁夏','西安','18:00','1')

insert
into 线路信息表
values ('103','西安','扶风','9:30','4')

insert
into 线路信息表
values ('104','宝鸡','扶风','10:00','2')

insert
into 线路信息表
values ('105','宝鸡','扶风','10:05','3')

insert
into 线路信息表
values ('106','扶风','宁夏','13:00','5')



insert
into 乘客信息表
values ('8:45','扶风','宝鸡','1','101')

insert
into 乘客信息表
values ('12:45','扶风','宁夏','6','106')

insert
into 乘客信息表
values ('18:05','宁夏','西安','2','102')

insert
into 乘客信息表
values ('10:00','宝鸡','扶风','5','105')

insert
into 乘客信息表
values ('9:05','西安','扶风','3','103')



/*创建存储过程*/
create proc proc_zg
as
select 车票编号,票价
from 车票信息表
where 线路号='103'

/*创建触发器*/

create trigger insert_qi
on 车票信息表
after insert
as 
select*
from 车票信息表
insert into 车票信息表(车票编号,票价)
values('001','25')


create trigger insert_che
on 汽车基本信息表
after insert
as 
select*
from 汽车基本信息表
insert into 汽车基本信息表(汽车编号,线路号)
values('106','5')

create trigger insert_xian
on 线路信息表
after insert
as 
select*
from 线路信息表
insert into 线路信息表(线路号,所需时间)
values('106','5')


create trigger insert_cheng
on 乘客信息表
after insert
as 
select*
from 乘客信息表
insert into 乘客信息表(出发时间,线路号)
values('18:05','102')



/*查询汽车编号为2的出发时间*/
select 出发时间
from 乘客信息表
where 汽车编号='2'

/*查询路线号为102的售票情况和票价*/
select 售票情况,票价
from 车票信息表
where 线路号='102'

/*查询路线号为104的汽车种类和最大载客量*/
select 汽车种类,最大载客量
from 汽车基本信息表
where 线路号='104'

/*查询乘客的出发时间，路线号，目的地*/
select 出发时间,线路号,目的地
from 乘客信息表
order by 线路号

/*查询票价在10到50之间的车票编号*/
select 车票编号
from 车票信息表
where 票价
between 10 and 50

/*查询出发地为武汉的目的地和路线号*/
select 目的地,线路号
from 线路信息表
where 出发地='扶风'



/* 通过课程设计实验，我发现自己对数据库课程的兴趣有了很大的提高,
而且对课本的知识更加的了解并有了一定的掌握，通过这次实验，
我懂得了如何创建索引、视图、存储过程以及触发器。
几天的数据库课程设计很快就结束了，在这短暂的几天时间里，发现自己学会了很多课外的东西。
数据库设计主要讨论数据库设计的方法和步骤应注意的事项。
概念结构设计采用的是实体属性分析法。
实体属性分析法是从总体的概念入手，从分析一个单位的事物活动开始。
总而言之，这次的课程设计我学到很多有用且很有实践意义的课外知识。
*/
