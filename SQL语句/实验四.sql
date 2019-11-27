/*
create table S
(SNO char(2) primary key not NULL,
SNAME varchar(20),
STATUS char(4),
CITY char(10)
)

create table P
(PNO char(2) primary key not NULL,
PNAME varchar(20),
COLOR char(4),
WEIGHT int
)


create table J
(JNO char(2) primary key not NULL,
JNAME varchar(20),
CITY char(10)
)

create table SPJ
(SNO char(2) primary key not NULL,
PNO char(2)  not NULL,
JNO char(2) not NULL,
QTY int
)
*/
/*
insert
into S
values('s6','华誉','40','广州');

insert
into J(JNO,JNAME)
values('j8','传感器厂')

*/
create table count
(SNO char(4) not null unique,
TotelQTY int
)

insert 
into count
select sno,sum(qty)
from SPJ
group by sno


UPDATE P
set COLOR='绿',WEIGHT=60
where PNO='P6';


update top (4) SPJ
set QTY=300


update S
set STATUS=STATUS+100
where CITY like '%京%'or CITY like '%津%'


update SPJ
set QTY=2000
where SNO='J2'and JNO=
(select JNO
from J
where JNAME like '一汽'
)


update P
set COLOR='浅红'
where COLOR='红'


update SPJ
set SNO='s3'
where SNO='s5'and PNO='p6'and JNO='j4'


alter table SPJ
add SDATE datetime

update SPJ
set SDATE=getdate()



delete
from s
where CITY='广州'

delete 
from SPJ
where PNO in
(select PNO
from P
where PNAME like '螺%')

delete
from P
where PNAME like '螺%'


delete 
from SPJ
where (SNO='s3'or SNO='S4')and JNO in
(select JNO
from J
where JNAME='三建')
and PNO in
(select PNO
from P
where PNAME='螺母'or PNAME='螺丝刀')