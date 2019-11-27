create proc StuScoreInfo0
as select student.sno,sname,Ssex,cname,cname,credit  
from student,sc,course
where student.sno=sc.sno and course.cno=sc.cno


exec StuScoreInfo0


CREATE PROC stu__info
@ssno VARCHAR(20)
AS
SELECT * 
FROM student
WHERE Sno=@ssno
GO
     EXEC stu_info 170101


CREATE PROC StuScoreInfo2
@NAME1 VARCHAR(20),
@NAME2 VARCHAR(20)
AS
SELECT sname,cname,score
FROM  student,course,sc
WHERE student.sno=sc.sno and course.cno=sc.cno and 
  student.sno=@NAME1 and course.cname=@NAME2 

   GO
EXEC StuScoreInfo2 '170201','����ϵͳ'



create PROC sscore
@cname char(20)='��ɢ��ѧ'
as
begin 
select score as '��ɢ��ѧ�ɼ�',
count(case when score>=90 then 1 end)as'90����',
count(case when score>=80 and score<90 then 1 end)as'80~90֮��',
count(case when score>=60 and score<80 then 1 end)as'60~80֮��',
count(case when score<60  then 1 end)as'60֮��'
from SC,course
where SC.cNo=course.cNo and course.cName=@cname
group by score
end
Return  
go
Go
exec sscore



create proc TheAvg
@NAME VARCHAR(20)
as
select AVG(score)ƽ��ֵ from Course,SC
where sc.Cno=Course.cno and Course.Cname=@NAME

go
exec TheAvg '��ɢ��ѧ'
