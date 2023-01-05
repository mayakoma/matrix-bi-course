select 
	[dept_num],
	sum([quantity]) as amount
from [dbo].[Items]
Group by [dept_num]

select 
	[dept_num],
	sum(Price * quantity) as total_sales
from [dbo].[Items]
Group by [dept_num]

select 
	[dept_num],
	avg(Price) as avg_price
from [dbo].[Items]
Group by [dept_num]

select 
	[dept_num],
	sum([quantity]) as amount
from [dbo].[Items]
Group by [dept_num]
having sum([quantity]) > 200 
order by sum([quantity]) DESC

select 
	[dept_num],
	sum([quantity]) as amount
from [dbo].[Items]
where price < 200
Group by [dept_num]
