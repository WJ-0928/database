 /*
Create table SStudent
(
Sno CHAR(5) primary key ,  
Sname CHAR(10) NOT NULL, 
Ssex  CHAR(2), 
Sage int, 
Sdept  CHAR(4)) 

Create table SC
(
Sno CHAR(5), 
Cno CHAR(2), 
Grade INT NULL, 
constraint PK_SnoCno primary key (Sno,Cno)
) 


Alter table SStudent add id char(18) unique (id) 

alter table SStudent add constraint CK_Sex check (Ssex in ('男' ,'女')) 

 alter table SStudent add constraint CK_Sno_Format check (Sno like '[0-9][0-9][0-9][0-9][0-9]') 


 alter table SStudent 
 add constraint CK_ID_Format check 
 (
 (id like '[0-9][0-9][0-9][0-9][0-9][0-9][1-2][0-9][0-9][0-9][0-1][0-9][0-3][0-9][0-9][0-9][0-9]_') 
 OR (id like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-1][0-9][0-3][0-9][0-9][0-9][0-9]')
 ) 




 alter table SStudent 
 add constraint CK_ID_Format2 check 
 (
 len(id)=18 
 and 
 ( (convert(smallint,substring(id,7,4) )>=1900)
  and(convert(smallint,substring(id,7,4) )<=2050)) 
 ) 


 Alter table SStudent
 add constraint CK_age check 
 (Ssex='男' and Sage>=22 or Ssex='女' and Sage>=20 ) 

 alter table SC
  add  constraint  FP_Sno 
  foreign key (Sno) references Student(Sno ) 


  Insert 
  into SStudent 
  values('95003','张三','男',24,'CS','42222919901012903X') 
  insert
  into SStudent 
  values('95001','李四','女',21,'CS','422229199510129031') 


 Insert 
  into SStudent 
  values('95002','小哈','男',22,'CS','42222919901012903Y') 
  insert
  into SStudent 
  values('95002','安陌','女',19,'CS','422229199510129021') 


  insert 
  into SC 
  values('95002', '10',65)
  insert 
  into SC 
  values('95002', '10',90) 


  insert 
  into SStudent 
  values('95009','张匀','大',20,'CS', '42222919901012904X') 

  insert 
  into SC 
  values('98998', '10',98) 


  alter table Salary
  add constraint CK_Income 
  check
  (0<=income 
  and income<=9999)

  
 create proc StuScoreInfo
as select Sstudent.sno,
from student,sc,course
where student.sno=sc.sno and course.cno=sc.cno