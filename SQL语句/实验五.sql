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



create view IS_连接
as
select Name,DepartmentName,Income
from Employee,Deparments,Salary
where Employee.EmployeeID=Salary.EmployeeID and Employee.DepartmentID=Deparments.DepartmentID


select *
from IS_连接




use xinxi
create view Id_虚字段(EmployeeID ,Name,年龄 )
as 
select EmployeeID ,Name,DATEDIFF(YEAR,Birthday,GETDATE())
from Employee

select *
from Id_虚字段

create view ISS_嵌套
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
where DepartmentName='财务部'
))))

select *
from ISS_嵌套


查询
select *
from IS_Employee




更新
update IS_Employee
set Name='安陌'

select *
from IS_Employee

删除
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
values('3004','安陌','2000-09-28')