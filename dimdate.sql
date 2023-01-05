/*  
date_ID int yyyymmdd
FullDate Date 2020-01-05
Week_day varchar(20) Day()
Month_ID int 1-12
Month_Desc varchar(20) month's name
Calendar_month_desc varchar(50) May-2020
Year_ID int YYYY
Quarter_Id int 1-4
Quarter_desc varchar(20) Q1-2020
Current_Month_ind bit 1 if this month 0 if not 
Current_year_ind bit 
MonthSortOrder int 202001 (01/2020)
*/

Create Proc DimDate AS 
Begin
	declare @currentDate Date = (SELECT CONVERT(Date,GETDATE()));
	declare @beginDate Date = (SELECT DATEADD(YYYY, -3,CONVERT(Date, GETDATE())));

	Drop Table if Exists DimDateTable;
	
	create table dimDateTable(
		Date_ID int,
		FullDate Date,
		Week_day varchar(20),
		Month_ID int,
		Month_Desc varchar(20),
		Calendar_month_desc varchar(50),
		Year_ID int,
		Quarter_Id int,
		Quarter_desc varchar(20),
		Current_Month_ind bit,
		Current_year_ind bit,
		MonthSortOrder int
	);

	while (@currentDate > @beginDate)
		begin
			 insert into dimDateTable
			 values( 
				cast(CONVERT(int,CONVERT(varchar(10), @beginDate, 112)) as int),
				@beginDate,
				DATENAME(WEEKDAY, @beginDate),
				cast(MONTH(@beginDate) as int),
				DATENAME(MONTH, @beginDate),
				DATENAME(MONTH, @beginDate)+'-'+cast(Year(@beginDate) as varchar(10)),
				Year(@beginDate),
				DATEPART(q,@beginDate),
				'Q'+cast(DATEPART(q,@beginDate) as varchar(1))+'-'+cast(Year(@beginDate) as varchar(10)),
				case when MONTH(@beginDate)= MONTH(GETDATE()) 
						and YEAR(@beginDate) = YEAR(GETDATE()) then 1
						else 0 end,
				case when YEAR(@beginDate) = YEAR(GETDATE()) then 1
						else 0 end,
				cast(DATEPART(YY,@beginDate)as varchar(4))+  right('0'+cast(DATEPART(MM, @beginDate) as varchar(2)),2)
			 )		
			set @beginDate =  DATEADD(dd, 1,@beginDate)
		end
End
exec DimDate
select * from dimDateTable