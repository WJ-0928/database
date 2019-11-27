/*
CREATE TRIGGER tri_UPDATE_DELETE_sc 
ON SC 
FOR UPDATE,DELETE 
AS

IF UPDATE(score) 
BEGIN 
SELECT INSERTED.Cno,DELETED.score AS ԭ�ɼ�,
INSERTED.score AS �³ɼ� 
FROM DELETED ,INSERTED 
WHERE DELETED.Sno=INSERTED.Sno 
END


ELSE IF COLUMNS_UPDATED( )=0 
BEGIN  

SELECT ��ɾ����ѧ��=DELETED.Sno,DELETED.Cno,
DELETED.score AS ԭ�ɼ� 
FROM DELETED 
END
ELSE 
PRINT "�����˷ǳɼ��У�"
 

UPDATE SC 
SET score=score+5 
WHERE Cno='101'


UPDATE SC 
SET Cno='113' 
WHERE Cno='103' 


DELETE SC  
WHERE Cno='102' 


ALTER TABLE SC 
ADD CONSTRAINT CK_�ɼ� 
CHECK(score>=0 AND score<=100) 


UPDATE SC  
SET score=120 
WHERE Cno='108'

UPDATE SC 
SET score=90 
WHERE Cno='108' 


DROP TRIGGER tri_UPDATE_DELETE_sc 


create table class
(
ID char(9) not null,
sname char(8) not null,
age smallint,
sex char(1),
primary key(ID)
);

create TRIGGER TRI_INSERT
on class
for insert
as
declare @ssum int
select @ssum=(select count(class.ID)
                from class)
if(@ssum <=30)
   begin
      print'������'
      select *
      from class
   end
else
    begin
	   print'��������'
	   rollback
	end

*/
create table SC_log
(
ID char(3),
CID char(3),
oldGrade INT,
newGrade INT,
primary KEY(ID)
);


create trigger tri_UPDATE
on SC
for update
as
declare @ID char(3),@CID char(3),@oldGrade int,@newGrade int
if update(score)
begin
   select
    @ID=inserted.Sno,@CID=inserted.Cno,@oldGrade=deleted.score,@newGrade=inserted.score
   from deleted,inserted
   where inserted.Sno=deleted.Sno
   insert into SC_log
   values (@ID,@CID,@oldGrade,@newGrade)
   select *
   from SC_log
end


