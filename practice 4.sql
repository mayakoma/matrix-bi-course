-- Q1
select *
from [dbo].[Worker]
where Year([JOINING_DATE]) >= 2015

--Q2
select *
from [dbo].[Worker]
where 
	Year([JOINING_DATE]) = 2014
	and Month([JOINING_DATE]) = 2

-- Q2 option 2
select *
from [dbo].[Worker]
where [JOINING_DATE] between '2014-02-01' and '2014-02-28'

-- Q3
select avg([SALARY]) as avg_salary, DEPARTMENT
from [dbo].[Worker]
where 
	Year([JOINING_DATE]) = 2016
group by DEPARTMENT

-- Q4
select 
	count([WORKER_ID]) as number_of_worker,
	avg([SALARY]) as avg_salary,
	Year([JOINING_DATE])
from [dbo].[Worker]
group by 
	Year([JOINING_DATE])

--Q5
select SUBSTRING([FIRST_NAME],1,3), left(first_name,3)
from [dbo].[Worker]	

-- Q6
select DATEDIFF(dd, min([JOINING_DATE]), max([JOINING_DATE])) as differente_at_days
from [dbo].[Worker]	

--Q7
select 
	*, 
	DATEDIFF(yyyy, [JOINING_DATE], GETDATE()) as seniority
from [dbo].[Worker]	

--Q8
select 
	[FIRST_NAME],
	[LAST_NAME],
	[JOINING_DATE],
	DATEADD(yyyy, 1,[JOINING_DATE]) as new_date
from [dbo].[Worker]

--Q9
select 
	upper([FIRST_NAME]) as first_name,
	lower([LAST_NAME]) as last_name
from [dbo].[Worker]

--Q10
select	
	count([WORKER_ID]) as num_of_employees, 
	DEPARTMENT
from [dbo].[Worker]
where MONTH(JOINING_DATE) between 7 and 9
group by DEPARTMENT

--Q11
select 
	[FIRST_NAME],
	[LAST_NAME]
from [dbo].[Worker]
where len([FIRST_NAME]) > 5

--Q12
select 
	[FIRST_NAME],
	 charindex('i', [FIRST_NAME]) as i_index
from [dbo].[Worker]

--Q13
select 
	[FIRST_NAME],
	[LAST_NAME]
from [dbo].[Worker]
where 
	charindex('a', [FIRST_NAME]) = len([FIRST_NAME])
	or charindex('a', [LAST_NAME]) = len([LAST_NAME])

-- option 2
select 
	[FIRST_NAME],
	[LAST_NAME]
from [dbo].[Worker]
where 
	RIGHT(trim(first_name), 1) = 'a'
	or RIGHT(trim(LAST_NAME), 1) = 'a'

--Q14
select 
	round(avg(
	case 
		when [FIRST_NAME] like 'v%' 
			then cast(salary as float)
	end),4) as avg_salary
from [dbo].[Worker]

-- option 2 good
select 
	cast(avg(cast(salary as float)) as numeric(10,4)) as avg_salary
from [dbo].[Worker]
where [FIRST_NAME] like 'v%' 

-- Q15
select 
	cast([SALARY] as varchar(20)) as string_salary
from [dbo].[Worker]

--Q16
select 
	CONCAT(trim([FIRST_NAME]),cast([SALARY] as varchar(20))) as name_salary
from [dbo].[Worker]

--Q16
select 
	CONCAT(trim([FIRST_NAME]),[SALARY]) as name_salary
from [dbo].[Worker]

--Q17
select 
	CONCAT(trim([FIRST_NAME]),' makes ',cast([SALARY] as varchar(20)),' per year') as name_salary
from [dbo].[Worker]
