select * from[dbo].[orders]
select * from[dbo].[customer]
select * from[dbo].[salesman]

-- 22
select *
from [dbo].[orders]
where [salesman_id] = (select [salesman_id]
						from [dbo].[salesman]
						where [name] like 'Paul Adam')

--23
select *
from [dbo].[orders]
where [salesman_id] in (select [salesman_id]
						from [dbo].[salesman]
						where [city] like 'london')

--24
select *
from [dbo].[customer]
where [grade] > (select avg([grade])
				 from [dbo].[customer]
				 where city = 'New York')
-- 25
select * 
from [dbo].[orders]
where [salesman_id] in (select distinct [salesman_id]
						from [dbo].[orders]
						where [customer_id]=3007)

--26
select * 
from [dbo].[orders]
where [salesman_id] in (select [salesman_id]
						from [dbo].[salesman]
						where city = 'New York')

--27
select [salesman_id],[name]
from [dbo].[salesman]
where [salesman_id] in (select [salesman_id]
						from [dbo].[orders]
						group by [salesman_id]
						having count([ord_no]) > 1)

