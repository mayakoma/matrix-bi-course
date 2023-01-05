select *
from [dbo].[Worker];

select [FIRST_NAME],[LAST_NAME],[SALARY]
from [dbo].[Worker];

select distinct [DEPARTMENT]
from [dbo].[Worker];

select top 3 [WORKER_REF_ID],[WORKER_age]
from [dbo].[Personal_Information]
where [WORKER_age] is not null
order by [WORKER_age];

select FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT
from [dbo].[Worker]
order by SALARY, JOINING_DATE;

select FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT
from [dbo].[Worker]
where FIRST_NAME IN ('Satish','Vipul','Monika');

select [WORKER_REF_ID] ,[WORKER_age]
from  [dbo].[Personal_Information]
where WORKER_age is not null
order by WORKER_age;

select [WORKER_REF_ID]
from [dbo].[Personal_Information]
where WORKER_age is null;

select [FIRST_NAME],[LAST_NAME],[SALARY]
from [dbo].[Worker]
where SALARY > 200000;

select [FIRST_NAME],[LAST_NAME],[SALARY]
from [dbo].[Worker]
where SALARY > 200000 OR DEPARTMENT ='HR';

select  [WORKER_REF_ID], [WORKER_age]
from [dbo].[Personal_Information]
where WORKER_age > 30 AND sex = 'Male';

select [FIRST_NAME],[LAST_NAME]
from [dbo].[Worker]
where SALARY Between 200000 and 400000;

select [FIRST_NAME],[LAST_NAME],[SALARY],[JOINING_DATE],[DEPARTMENT]
from [dbo].[Worker]
where DEPARTMENT = 'Admin';

select [FIRST_NAME],[LAST_NAME]
from [dbo].[Worker]
where FIRST_NAME like '%R%';

select [FIRST_NAME],[LAST_NAME]
from [dbo].[Worker]
where FIRST_NAME not like '%V%';

select [FIRST_NAME],[LAST_NAME]
from [dbo].[Worker]
where FIRST_NAME like '%A';
