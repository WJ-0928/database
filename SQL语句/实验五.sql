/*
create view IS_Employee
AS
select EmployeeID,Name,Birthday
from Employee

select *from IS_Employee

create view SSEX
as
select *
from Employee
where Sex='1'


select *
from SSEX


create view IS_DepartmentID
as
select Name,PhoneNumber,EmailAddress 
from Employee
where DepartmentID='2'

select *
from IS_DepartmentID



create view IS_����
as
select Name,DepartmentName,Income
from Employee,Deparments,Salary
where Employee.EmployeeID=Salary.EmployeeID and Employee.DepartmentID=Deparments.DepartmentID


select *
from IS_����




use xinxi
create view Id_���ֶ�(EmployeeID ,Name,���� )
as 
select EmployeeID ,Name,DATEDIFF(YEAR,Birthday,GETDATE())
from Employee

select *
from Id_���ֶ�

create view ISS_Ƕ��
as
select *
from Employee
where EmployeeID
in
(
select EmployeeID
from Salary
where Income> all
(select Income
from Salary
where EmployeeID in
(select EmployeeID 
from Employee
where DepartmentID=
(select DepartmentID
from Deparments 
where DepartmentName='����'
))))

select *
from ISS_Ƕ��


��ѯ
select *
from IS_Employee




����
update IS_Employee
set Name='��İ'

select *
from IS_Employee

ɾ��
alter table Salary
drop CONSTRAINT FK__Salary__OutCome__145C0A3F
delete 
from IS_Employee
where EmployeeID='2002'

select*
from IS_Employee
*/


insert 
into IS_Employee
values('3004','��İ','2000-09-28')