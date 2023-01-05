-- Q1
declare @CourseName varchar(50)='Data Master';
print @CourseName;

--Q2
declare @unit int =10;
set @unit -= 3;
print @unit;

--Q3
declare @youngestWorker varchar(50);
select @youngestWorker = trim(w.FIRST_NAME)+' '+trim(w.LAST_NAME)
from [dbo].[Worker] w 
where w.WORKER_ID = (select top 1 WORKER_REF_ID 
					 from [dbo].[Personal_Information] 
					 where WORKER_age is not null
					 order by WORKER_age)

select @youngestWorker as full_name;
 
--Q4
begin
declare @sentence varchar(100)='';
goto section3;
section1: set @sentence += 'a student ';
section2: set @sentence += 'in DataMaster ' goto section4;
section3: set @sentence += 'I am ' goto section1;
section4: set @sentence += 'class';
end
print @sentence

--Q5
create Table MyTable (
	colA int identity(1,1),
	colB varchar (10)
)
go
insert into MyTable(colB)
Values('test')
go 7
select * from MyTable;

--Q6
create Table MyNewTable(
	colA int identity(1,1),
	colB varchar(50)
)

declare @rowNum int;
select @rowNum = count(*) from MyTable;

while (@rowNum > 0)
begin
	insert into MyNewTable (colB)
	values ('test');
	set @rowNum -=1;
end

select * from MyNewTable;

--Q7
declare @avgAge int;
declare @ageClassification varchar(10);

select @avgAge = avg([WORKER_age])
from [dbo].[Personal_Information]

if (@avgAge > 30)
	set @ageClassification = '30 Above'
else
	set @ageClassification = '30 Below'

select @avgAge as avgAge, @ageClassification as classification

