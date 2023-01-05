select * from [dbo].[Title] 
select * from [dbo].[Bonus]
select * from [dbo].[Worker]
select * from [dbo].[Personal_Information]
select * from [dbo].[employees]

--1
select  
	trim(w.FIRST_NAME)+' '+trim(w.LAST_NAME) as full_name,
	isnull(p.[WORKER_age], (select avg([WORKER_age]) from [dbo].[Personal_Information])) as worker_age
from [dbo].[Personal_Information] p left join [dbo].[Worker] w
	ON p.WORKER_REF_ID = w.WORKER_ID;

--2
select max([SALARY])as second_salary from [dbo].[Worker] 
where [SALARY]  <> (select max([SALARY]) from [dbo].[Worker])

--Option B
Select top 1 Salary
from Worker
where Salary not in (Select top 1 Salary from Worker order by Salary desc)
order by Salary desc

--3
with unionWorker as
(select * 
from [dbo].[Worker]
	union all (select * from [dbo].[employees]))
select avg(salary) as avg_salary from unionWorker

--4
select * 
from [dbo].[Worker] 
where SALARY = (select max([SALARY])as second_salary from [dbo].[Worker] 
where [SALARY]  <> (select max([SALARY]) from [dbo].[Worker]))


--5
select 
	trim(w.FIRST_NAME)+' '+trim(w.LAST_NAME) as full_name,
	sum(b.BONUS_AMOUNT) as bonus_amount
from [dbo].[Worker] w
	 join [dbo].[Bonus] b on w.WORKER_ID = b.WORKER_REF_ID
group by [FIRST_NAME],[LAST_NAME]
having sum(b.BONUS_AMOUNT) > (select avg(BONUS_AMOUNT) from [dbo].[Bonus]);

--6
select [WORKER_REF_ID], Max([BONUS_DATE]) last_bonus
from [dbo].[Bonus]
group by [WORKER_REF_ID];

--7
select *
from [dbo].[Worker]
where [WORKER_ID] in 
	(select distinct[WORKER_REF_ID] 
	from [dbo].[Personal_Information] 
	where [sex]='female');

--8
select 
	avg(sum_bonus_amount) as avg_bonus,
	min(sum_bonus_amount) as min_bonus,
	max(sum_bonus_amount) as max_bonus
from (select [WORKER_REF_ID], sum([BONUS_AMOUNT]) as sum_bonus_amount
from [dbo].[Bonus]
group by [WORKER_REF_ID]) as sum_bonus;

--9
with all_salaries As
(select * from [dbo].[Worker]
union all 
select * from [dbo].[employees])
select  trim([FIRST_NAME]) +' '+trim([LAST_NAME]) as full_name, [SALARY]
from all_salaries

--10
SELECT Trim([FIRST_NAME])+' '+Trim([LAST_NAME]) as FullName FROM worker
Union 
SELECT Trim([FIRST_NAME])+' '+Trim([LAST_NAME]) as FullName FROM employees

select * from [dbo].[Agents_Orders];

--11
WITH AgentsSales as(	SELECT Agent_Code, sum (ORD_Amount) as Amount	FROM  [dbo].[Agents_Orders]	GROUP BY Agent_Code), Max_Amount as(	SELECT MAX(Amount) as MaxAmount	FROM AgentsSales)SELECT Agent_Code, Amount from AgentsSales a join Max_Amount bON a.Amount=B.MaxAmount

