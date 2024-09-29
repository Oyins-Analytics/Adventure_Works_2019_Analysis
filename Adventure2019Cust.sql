SELECT [CustomerKey]
      ,[GeographyKey]
      ,[CustomerAlternateKey]
	  ,CONCAT([Title],' ',[FirstName],' ',[MiddleName],' ',[LastName]) AS FullName
      --,[NameStyle]
      ,[BirthDate]
	  --,GETDATE() AS CurrentDATE
	  ,DATEDIFF(YEAR,[BirthDate],GETDATE()) AS Age 
	  ,CASE WHEN DATEDIFF(YEAR,[BirthDate],GETDATE())  <= 55 THEN 'Youth'
	        WHEN DATEDIFF(YEAR,[BirthDate],GETDATE())  <= 70 THEN 'Elder'
			ELSE 'Aged'
			END AgeCat
	  ,CASE WHEN [MaritalStatus] = 'M' THEN 'Married'
	   ELSE 'Single'
	   END MaritalStatus
      ,--[Suffix]
       --[Gender]
	   CASE WHEN [Gender] = 'M' THEN 'Male'
	   ELSE 'Female'
	   END Gender
      ,[EmailAddress]
      ,[YearlyIncome]
	  ,[YearlyIncome]/12 AS Salary
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation]
      ,[SpanishEducation]
      ,[FrenchEducation]
      ,[EnglishOccupation]
      ,[SpanishOccupation]
      ,[FrenchOccupation]
      ,[HouseOwnerFlag]
      ,[NumberCarsOwned]
      --,[AddressLine1]
      --,[AddressLine2]
	  ,CONCAT([AddressLine1],' |',[AddressLine2]) AS AddressLine
      ,[Phone]
      ,[DateFirstPurchase]
      ,[CommuteDistance]
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer]
 --where [EmailAddress] LIKE adventure-works%
