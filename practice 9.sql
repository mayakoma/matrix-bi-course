-- Q1
create proc SP_ProductList AS
BEGIN
	select distinct DP.EnglishProductName, FIS.UnitPrice
	from [dbo].[DimProduct] DP left join [dbo].[FactInternetSales] FIS
		on DP.ProductKey = FIS.ProductKey
	where FIS.UnitPrice is not null
	order by DP.EnglishProductName
END

--Q2
EXEC SP_ProductList;

--Q3

alter proc SP_ProductList AS
BEGIN
	select distinct DP.EnglishProductName, FIS.UnitPrice
	from [dbo].[DimProduct] DP left join [dbo].[FactInternetSales] FIS
		on DP.ProductKey = FIS.ProductKey
	where FIS.UnitPrice is not null
	order by  FIS.UnitPrice DESC
END

--Q4
EXEC SP_ProductList;

--Q5
alter proc SP_ProductList 
(
	@minPrice float = 0
)
AS
BEGIN
	select distinct DP.EnglishProductName, FIS.UnitPrice
	from [dbo].[DimProduct] DP left join [dbo].[FactInternetSales] FIS
		on DP.ProductKey = FIS.ProductKey
	where FIS.UnitPrice > @minPrice
		order by  FIS.UnitPrice DESC
END

--Q6
EXEC SP_ProductList 2050.2;
EXEC SP_ProductList 3050.2;

--Q7
alter proc SP_ProductList 
(
	@minPrice float = 0,
	@maxPrice float
)
AS
BEGIN
	select distinct DP.EnglishProductName, FIS.UnitPrice
	from [dbo].[DimProduct] DP left join [dbo].[FactInternetSales] FIS
		on DP.ProductKey = FIS.ProductKey
	where FIS.UnitPrice < @maxPrice
		and FIS.UnitPrice > @minPrice
		order by  FIS.UnitPrice DESC
END

--Q8
EXEC SP_ProductList 0,2050.2;
EXEC SP_ProductList 1000,3050.2;


--Q9
alter proc SP_ProductList 
(
	@minPrice float = 0,
	@maxPrice float,
	@name varchar(50)
)
AS
BEGIN
	select distinct DP.EnglishProductName, FIS.UnitPrice
	from [dbo].[DimProduct] DP left join [dbo].[FactInternetSales] FIS
		on DP.ProductKey = FIS.ProductKey
	where FIS.UnitPrice <= @maxPrice 
		and FIS.UnitPrice >= @minPrice
		and DP.EnglishProductName like '%'+@name+'%'
		order by  FIS.UnitPrice DESC
END

--Q10
EXEC SP_ProductList 100, 3000, 'la';

--Q11
alter proc SP_ProductList 
(
	@minPrice float = 0,
	@maxPrice float,
	@name varchar(50)
)
AS
BEGIN
	select distinct DP.EnglishProductName, FIS.UnitPrice
	from [dbo].[DimProduct] DP left join [dbo].[FactInternetSales] FIS
		on DP.ProductKey = FIS.ProductKey
	where ((FIS.UnitPrice <= @maxPrice or @maxPrice is null)
		and FIS.UnitPrice >= @minPrice)
		and DP.EnglishProductName like '%'+@name+'%'
		order by  FIS.UnitPrice DESC
END

--Q12
EXEC SP_ProductList @maxPrice=null ,@name= 'mou';
EXEC SP_ProductList 1000, 3000 ,'mou';