SELECT [CustomerKey]
      ,[GeographyKey]
      ,[CustomerAlternateKey]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[NameStyle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Suffix]
      ,[Gender]
      ,[EmailAddress]
      ,[YearlyIncome]
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
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]
      ,[DateFirstPurchase]
      ,[CommuteDistance]
  FROM [AdventureWorks2019].[dbo].[DimCustomer]

---Number of Customers
  SELECT COUNT(DISTINCT [CustomerKey]) Nm_Cust
  FROM [AdventureWorks2019].[dbo].[DimCustomer]

--Query to represent the full name
SELECT [CustomerKey]
      ,[GeographyKey]
      ,[CustomerAlternateKey]
      ,ISNULL([Title],' ') + ' ' + ISNULL([FirstName],' ') + ' '+ ISNULL([MiddleName],' ') + ' ' + ISNULL([LastName],' ') + ' ' + ISNULL(Suffix,' ') FullName
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[EmailAddress]
      ,[YearlyIncome]
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
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]
      ,[DateFirstPurchase]
      ,[CommuteDistance]
  FROM [AdventureWorks2019].[dbo].[DimCustomer]
  --where [NameStyle] != '0

--Query to get Age from Birthdate
 SELECT [CustomerKey]
      ,[GeographyKey]
      ,[CustomerAlternateKey]
      ,ISNULL([Title],' ') + ' ' + ISNULL([FirstName],' ') + ' '+ ISNULL([MiddleName],' ') + ' ' + ISNULL([LastName],' ') + ' ' + ISNULL(Suffix,' ') FullName
      ,DATEDIFF(YEAR,BirthDate,GETDATE()) Age
      ,[MaritalStatus]
      ,[Gender]
      ,[EmailAddress]
      ,[YearlyIncome]
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
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]
      ,[DateFirstPurchase]
      ,[CommuteDistance]
  FROM [AdventureWorks2019].[dbo].[DimCustomer]

--Query to Express the Gender and the MaritalStatus well
SELECT [CustomerKey]
      ,[GeographyKey]
      ,[CustomerAlternateKey]
      ,ISNULL([Title],' ') + ' ' + ISNULL([FirstName],' ') + ' '+ ISNULL([MiddleName],' ') + ' ' + ISNULL([LastName],' ') + ' ' + ISNULL(Suffix,' ') FullName
      ,DATEDIFF(YEAR,BirthDate,GETDATE()) Age
      ,CASE WHEN MaritalStatus = 'S' THEN 'Single'
       ELSE 'Married'
       END MaritalStatus
      ,CASE WHEN Gender = 'M' THEN 'Male'
       ELSE 'Female'
       END Gender
      ,[EmailAddress]
      ,[YearlyIncome]
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
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]
      ,[DateFirstPurchase]
      ,[CommuteDistance]
  FROM [AdventureWorks2019].[dbo].[DimCustomer]

--Correct Data
  SELECT [CustomerKey]
      ,DC.[GeographyKey]
      ,DG.[City]
      ,DG.[StateProvinceCode]
      ,DG.[StateProvinceName]
      ,DG.[CountryRegionCode]
      ,DG.[EnglishCountryRegionName]
      ,DG.[SpanishCountryRegionName]
      ,DG.[FrenchCountryRegionName]
      ,DG.[PostalCode]
      ,DG.[SalesTerritoryKey]
      --,DG.[IpAddressLocator]
      ,DC.[CustomerAlternateKey]
      ,ISNULL([Title],' ') + ' ' + ISNULL([FirstName],' ') + ' '+ ISNULL([MiddleName],' ') + ' ' + ISNULL([LastName],' ') + ' ' + ISNULL(Suffix,' ') FullName
      ,DATEDIFF(YEAR,BirthDate,GETDATE()) Age
      ,CASE WHEN MaritalStatus = 'S' THEN 'Single'
       ELSE 'Married'
       END MaritalStatus
      ,CASE WHEN Gender = 'M' THEN 'Male'
       ELSE 'Female'
       END Gender
      ,DC.[EmailAddress]
      ,DC.[YearlyIncome]
      ,DC.YearlyIncome/12 Salary
      ,DC.[TotalChildren]
      ,DC.[NumberChildrenAtHome]
      ,DC.[EnglishEducation]
      ,DC.[SpanishEducation]
      ,DC.[FrenchEducation]
      ,DC.[EnglishOccupation]
      ,DC.[SpanishOccupation]
      ,DC.[FrenchOccupation]
      ,DC.[HouseOwnerFlag]
      ,DC.[NumberCarsOwned]
      ,DC.AddressLine1 + ' | ' + ISNULL(AddressLine2,' ') Address
      ,DC.[Phone]
      ,DC.[DateFirstPurchase]
      ,DC.[CommuteDistance]
      FROM [AdventureWorks2019].[dbo].[DimCustomer] DC
      LEFT OUTER JOIN [AdventureWorks2019].[dbo].[DimGeography] DG
      ON DC.GeographyKey = DG.GeographyKey
      --WHERE EnglishCountryRegionName IS NULL

  --Cust with cars 
  SELECT [CustomerKey]
        ,[GeographyKey]
        ,ISNULL([Title],' ') + ' ' + ISNULL([FirstName],' ') + ' '+ ISNULL([MiddleName],' ') + ' ' + ISNULL([LastName],' ') + ' ' + ISNULL(Suffix,' ') FullName
        FROM [AdventureWorks2019].[dbo].[DimCustomer]
        WHERE NumberCarsOwned != 0
  SELECT COUNT(DISTINCT CustomerKey) Custcar
         FROM [AdventureWorks2019].[dbo].[DimCustomer]
         WHERE NumberCarsOwned != 0

--Num of house owners
  SELECT COUNT(DISTINCT CustomerKey) HouseOwner
         FROM [AdventureWorks2019].[dbo].[DimCustomer]
         WHERE HouseOwnerFlag != 0

  SELECT MIN(DATEDIFF(YEAR,BirthDate,GETDATE())) MinAge
        ,MAX(DATEDIFF(YEAR,BirthDate,GETDATE())) MaxAge
         FROM [AdventureWorks2019].[dbo].[DimCustomer]

--MAX,MIN,AVG,SUM OF SALARY
  SELECT ROUND(MAX(YearlyIncome/12),0) MaximumSalary
        ,ROUND(MIN(YearlyIncome/12),0) MinimumSalary
        ,ROUND(AVG(YearlyIncome/12),0)AverageSalary
        ,ROUND(SUM(YearlyIncome/12),0) TotalSalary
        FROM [AdventureWorks2019].[dbo].[DimCustomer]

--Region,City by NumCust
  SELECT DG.[EnglishCountryRegionName]
        ,DG.[City]
        ,COUNT(DG.[EnglishCountryRegionName]) NumCust
        FROM [AdventureWorks2019].[dbo].[DimCustomer] DC
        LEFT OUTER JOIN [AdventureWorks2019].[dbo].[DimGeography] DG
        ON DC.GeographyKey = DG.GeographyKey
        GROUP BY DG.[City],DG.[EnglishCountryRegionName]
