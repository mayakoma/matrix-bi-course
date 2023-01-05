-- Q1
alter table [dbo].[Personal_Information]
add expirience Int;

select * from [dbo].[Personal_Information];

--Q3
select 
	[WORKER_REF_ID],
	[expirience], 
	(case
		when [expirience] <= 2 then 'junior'
		when [expirience] > 2 and [expirience] <=7 then 'senior'
		when [expirience] > 7 then 'master'
		else null
	end) as expirience_level
from [dbo].[Personal_Information];

--Q4
select 
	[WORKER_REF_ID],
	[sex],
	[WORKER_age], 
	(case
		when [WORKER_age] < 30 then '20-30'
		when [WORKER_age] between 30 and 35 then '30-35'
		when [WORKER_age] > 35 then '+35'
		else 'Unknown'
	end) as ages_group
from [dbo].[Personal_Information];

-- Q5
select 
	[WORKER_REF_ID],
	[sex] as Gender,
	[WORKER_age], 
	(case
		when [WORKER_age] < 30 then '20-30'
		when [WORKER_age] between 30 and 35 then '30-35'
		when [WORKER_age] > 35 then '+35'
		else 'Unknown'
	end) as age_group
from [dbo].[Personal_Information]
order by [WORKER_age] DESC;

-- Q5.1
select 
	[WORKER_REF_ID],
	[sex] as Gender,
	[WORKER_age], 
	(case
		when [WORKER_age] < 30 then '20-30'
		when [WORKER_age] between 30 and 35 then '30-35'
		when [WORKER_age] > 35 then '+35'
		else 'Unknown'
	end) as age_group
from [dbo].[Personal_Information]
where [WORKER_age] is not null
order by [WORKER_age] DESC;

select * from [dbo].[employees];

--Q6
select 
	[FIRST_NAME],
	[LAST_NAME],
	[SALARY],
	[DEPARTMENT],
	(case
		when [SALARY] between 100000 and 350000 then '100-350'
		when [SALARY] > 350000 then '+350'
		else 'NA'
	end) as salary_clasification
from [dbo].[employees]
where 
	[DEPARTMENT] <> 'Administration'
	and ([FIRST_NAME]  like '%A%' or [LAST_NAME]  like '%A%');

-- Q6 correct result
select 
	[FIRST_NAME],
	[LAST_NAME],
	[SALARY],
	[DEPARTMENT],
	case
		when [DEPARTMENT] <> 'Administration'
			and ([FIRST_NAME]  like '%A%' or [LAST_NAME]  like '%A%') 
		then
			(case
				when [SALARY] between 100000 and 350000 then '100-350'
				when [SALARY] > 350000 then '+350'
			end) 
			else 'NA'
	end as salary_clasification
from [dbo].[employees];

	;