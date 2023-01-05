select Count(*) as number_of_worker
from [dbo].[Worker]
where DEPARTMENT='Admin'

select 
	avg(SALARY) as avg_salary, 
	sum(SALARY) as sum_salary
from [dbo].[Worker]

select 
	min(SALARY) as min_salary, 
	max(SALARY) as max_salary
from [dbo].[Worker]

select 
	min([JOINING_DATE]) as min_join_date, 
	max([JOINING_DATE]) as max_join_date
from [dbo].[Worker]

select 
	DEPARTMENT, 
	avg(SALARY) as avg_salary, 
	sum(SALARY) as sum_salary
from [dbo].[Worker]
Group by DEPARTMENT;

select 
	DEPARTMENT,
	sum(Salary)/Count(salary) as avg_salary
from [dbo].[Worker]
group by DEPARTMENT

select 
	count(*) as number_of_worker,
	DEPARTMENT
from [dbo].[Worker]
group by DEPARTMENT
order by count(*) DESC

select 
	count(*) as number_of_worker, 
	DEPARTMENT
from [dbo].[Worker]
group by DEPARTMENT
having count(*) > 5

select 
	count(*) as number_of_worker,
	DEPARTMENT
from [dbo].[Worker]
where DEPARTMENT <> 'HR'
group by DEPARTMENT
having count(*) >= 4




