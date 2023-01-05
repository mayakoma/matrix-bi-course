/*
[dbo].[Title]
[dbo].[Bonus]
[dbo].[Worker]
[dbo].[Personal_Information]
*/
select * from [dbo].[Title]
select * from [dbo].[Bonus]
select * from [dbo].[Worker]
select * from [dbo].[Personal_Information]

-- Q1
select t1.WORKER_TITLE, count(t2.[WORKER_REF_ID]) as number_of_worker
from [dbo].[Title] t1
	inner join [dbo].[Title] t2
		on t1.WORKER_REF_ID = t2.WORKER_REF_ID
group by t1.WORKER_TITLE

-- option 2 without join
select 
	WORKER_TITLE, 
	count([WORKER_REF_ID]) as number_of_worker
from [dbo].[Title]
group by WORKER_TITLE

--Q2
select 
	count(distinct [WORKER_REF_ID]) as get_Bonus
from [dbo].[Bonus] b
	inner join [dbo].[Worker] w
		on b.WORKER_REF_ID = w.WORKER_ID
-- option 2 without join
select count(distinct [WORKER_REF_ID]) as get_Bonus
from [dbo].[Bonus]
--Q3
select 
	w.FIRST_NAME,
	w.LAST_NAME,
	t.WORKER_TITLE
from [dbo].[Worker] w 
	left join [dbo].[Title] t
		on w.WORKER_ID = t.WORKER_REF_ID

--Q4
select 
	w.FIRST_NAME,
	w.LAST_NAME,
	t.WORKER_TITLE
from [dbo].[Worker] w 
	inner join [dbo].[Title] t
		on w.WORKER_ID = t.WORKER_REF_ID
		and t.WORKER_TITLE = 'manager'

-- Q5
select 
	w.FIRST_NAME,
	w.LAST_NAME,
	DATEDIFF(yyyy,w.JOINING_DATE, GETDATE()) as seniority,
	t.WORKER_TITLE
from [dbo].[Worker] w 
	inner join [dbo].[Title] t
		on w.WORKER_ID = t.WORKER_REF_ID

--Q6
select 
	lower(w.FIRST_NAME) as first_name,
	lower(w.LAST_NAME) as last_name,
	sum(b.[BONUS_AMOUNT]) as bonus_amount
from [dbo].[Worker] w
	inner join  [dbo].[Bonus] b
		on b.WORKER_REF_ID = w.WORKER_ID
group by 
	w.FIRST_NAME,
	w.LAST_NAME

--Q7
select 
	trim(lower(w.FIRST_NAME))+' '+trim(lower(w.LAST_NAME)) as full_name,
	w.DEPARTMENT,
	t.WORKER_TITLE,
	avg(b.[BONUS_AMOUNT]) as bonus_amount
from [dbo].[Bonus] b
	 join [dbo].[Worker] w
		on b.WORKER_REF_ID = w.WORKER_ID
	 join [dbo].[Title] t
		on w.WORKER_ID = t.WORKER_REF_ID
group by 
	w.FIRST_NAME,
	w.LAST_NAME,
	w.DEPARTMENT,
	t.WORKER_TITLE

--Q8
select
	trim(lower(w.FIRST_NAME))+' '+trim(lower(w.LAST_NAME)) as full_name,
	w.JOINING_DATE,
	w.SALARY,
 	isnull(sum(b.BONUS_AMOUNT),0)
from [dbo].[Worker] w 
	left join [dbo].[Bonus] b
		on w.WORKER_ID = b.WORKER_REF_ID
group by 
	w.FIRST_NAME,
	w.LAST_NAME,
	w.JOINING_DATE,
	w.SALARY 

--Q9
select
	w.FIRST_NAME,
	w.LAST_NAME
from [dbo].[Worker] w 
	left join [dbo].[Bonus] b
		on w.WORKER_ID = b.WORKER_REF_ID
where b.BONUS_AMOUNT is null


--Q10
select 
	avg([WORKER_age]) as avg_age
from [dbo].[Personal_Information]

--Q11
select 
	p.sex as Gender, 
	count(w.WORKER_ID) as amount
from [dbo].[Worker] w
	inner join [dbo].[Personal_Information] p
		on w.WORKER_ID = p.WORKER_REF_ID
		and p.sex is not null
group by p.sex

--Q12
select 
	w.FIRST_NAME,
	w.LAST_NAME,
	w.SALARY,
	p.WORKER_age,
	p.sex as Gender
from [dbo].[Worker] w
	left join [dbo].[Personal_Information] p
		on w.WORKER_ID = p.WORKER_REF_ID

--Q13
select
	avg(cast(p.WORKER_age as float)) as age,
	t.WORKER_TITLE
from [dbo].[Worker] w
	left join [dbo].[Personal_Information] p
		on w.WORKER_ID = p.WORKER_REF_ID
	left join [dbo].[Title] t 
		on w.WORKER_ID = t.WORKER_REF_ID
group by t.WORKER_TITLE

--Q14
select 
	w1.FIRST_NAME,
	w2.FIRST_NAME,
	w1.DEPARTMENT
from [dbo].[Worker] w1 
	 join [dbo].[Worker] w2
		on w1.DEPARTMENT=w2.DEPARTMENT
		and w1.WORKER_ID <> w2.WORKER_ID

--Q15
select 
	w.WORKER_ID,
	concat(trim(e.FIRST_NAME),' ',trim(e.LAST_NAME)) as full_name,
	p.WORKER_age,
	p.sex as gender
from [dbo].[Worker] w 
	left join [dbo].[employees] e
		on w.WORKER_ID = e.employee_ID
	left join [dbo].[Personal_Information] p
		on w.WORKER_ID = p.[WORKER_REF_ID]

		