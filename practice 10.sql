--Q1
select 
	rank () over (partition by worker_ref_id order by [BONUS_AMOUNT] DESC) as Rank,
	dense_rank () over ( partition by worker_ref_id order by [BONUS_AMOUNT] DESC) as DRank,
	[WORKER_REF_ID],
	[BONUS_AMOUNT]
from [dbo].[Bonus];

-- Q2
select 
	distinct FIRST_VALUE([FIRST_NAME]) 
		over(partition by [DEPARTMENT] order by [JOINING_DATE]) as first_worker,
	[DEPARTMENT]
from [dbo].[employees]

--Q3
select 
	row_number() over (partition by [Car_ID] order by [Event_time]) as rowNumber,
	[Car_ID],
	[Event_time],[GeoID]
from [dbo].[Trips_events];


--Q4
-- option 1 lag \ lead 
with next_trip_table AS(
select 
	Car_ID,
	[Event_time],
	lead([Event_time],1) over(partition by [Car_ID] order by [Event_time]) as next_trip
from [dbo].[Trips_events]
)
select Car_ID, sum(DATEDIFF(MINUTE,[Event_time],next_trip)) as tripDuration
from next_trip_table
group by [Car_ID];

-- same but different writing
select car_id, sum (TripDuration) as TripDuration
from (
select  *,  
	datediff(mi, LAG (event_time,1) over (Partition by car_id order by event_time),[Event_time]) as TripDuration
FROM [SQLPractice].[dbo].[Trips_events]) a
group by car_id

-- option 2
select distinct 
	Car_ID,
	datediff(mi, FIRST_VALUE(event_time) over (Partition by car_id order by event_time),
		FIRST_VALUE(event_time) over (Partition by car_id order by event_time desc)) as TripDuration
FROM [SQLPractice].[dbo].[Trips_events] 

