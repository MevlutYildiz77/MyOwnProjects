USE PythonFiles

--Assignment-2

--CREATE PROCEDURE
GO
CREATE PROC SeaAllData
AS
BEGIN
SELECT * 
FROM  data
ORDER BY InvoiceNo
END

EXECUTE SeaAllData 'HAND'
--OR
SELECT TOP 5 * FROM data

--INFO ++
SELECT COLUMN_NAME ,DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'data'
GROUP BY COLUMN_NAME ,DATA_TYPE
; 


SELECT  COUNT(InvoiceNo) as InvoiceNo, COUNT(StockCode) as StockCode, COUNT(Description) as Description, 
		COUNT(Quantity) as Quantity, COUNT(InvoiceDate) as InvoiceDate, COUNT(UnitPrice) as UnitPrice,
		COUNT(CustomerID) as CustomerID, COUNT(Country) as Country
      
FROM data

-----
SELECT  COLUMN_NAME , DATA_TYPE, COUNT(InvoiceNo) as InvoiceNo, COUNT(StockCode) as StockCode, COUNT(Description) as Description, 
		COUNT(Quantity) as Quantity, COUNT(InvoiceDate) as InvoiceDate, COUNT(UnitPrice) as UnitPrice,
		COUNT(CustomerID) as CustomerID, COUNT(Country) as Country
      
--FROM  data
FROM INFORMATION_SCHEMA.COLUMNS, data
WHERE 
     TABLE_SCHEMA = 'dbo' AND
     TABLE_NAME   = 'data' AND 
     COLUMN_NAME  = 'InvoiceNo' --AND 'StockCode' AND 'Description'AND 'Quantity'AND 'InvoiceDate' AND 'UnitPrice' AND 'CustomerID' AND 'Country'

GROUP BY DATA_TYPE

--SELECT * FROM sys.syscolumns

exec sp_help data

SELECT * FROM INFORMATION_SCHEMA.COLUMNS


SELECT  DATA_TYPE as InvoiceNo
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_SCHEMA = 'dbo' AND
     TABLE_NAME   = 'data' AND 
     COLUMN_NAME  = 'InvoiceNo' 


SELECT  DATA_TYPE as StockCode
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_SCHEMA = 'dbo' AND
     TABLE_NAME   = 'data' AND 
     COLUMN_NAME  = 'StockCode' 


SELECT TYPE_NAME(system_type_id) 
FROM sys.columns 
WHERE name = 'InvoiceNo' --AND 'StockCode' AND 'Description'AND 'Quantity'AND 'InvoiceDate' AND 'UnitPrice' AND 'CustomerID' AND 'Country'
AND [object_id] = OBJECT_ID('[dbo].[data]');





--What is the average Purchase Price?  ---
SELECT AVG(UnitPrice) as AvgPurchasePrice 
FROM data

--What were the highest and lowest purchase prices? ---
SELECT MAX(UnitPrice) as MaxPurchasePrice 
FROM data

SELECT MIN(UnitPrice) as MinPurchasePrice 
FROM data

--List the country names and number of records belongs to each country  +++.HER 3ÜNDE DE AYNI
SELECT Country, COUNT(Country) as CountOfCountry
FROM data 
GROUP BY Country 
ORDER BY CountOfCountry DESC

--How many records are as Country United Kingdom? +++ .HER 3ÜNDE DE AYNI

SELECT Country,  COUNT(InvoiceNo) as InvoiceNo, COUNT(StockCode) as StockCode, COUNT(Description) as Description, 
		COUNT(Quantity) as Quantity, COUNT(InvoiceDate) as InvoiceDate, COUNT(UnitPrice) as UnitPrice,
		COUNT(CustomerID) as CustomerID, COUNT(Country) as Country
FROM data
WHERE Country = 'United Kingdom'
GROUP BY Country

--Create a column named Total which shows the total amount of spend using UnitPrice and Quantity (rAKAMLAR doðru, 2 vrgüül kayma problemi var)


SELECT InvoiceNo, StockCode, Description, InvoiceDate, CustomerID, Country, Quantity, UnitPrice,
  SUM(Quantity * UnitPrice) AS Total
FROM data
GROUP BY InvoiceNo, StockCode, Description, InvoiceDate, CustomerID, Country, Quantity, UnitPrice
ORDER BY InvoiceNo;




--Show total spending amount according to the Countries  ----
SELECT Country, SUM(Quantity * UnitPrice) as TotalSpending
FROM data
GROUP BY Country
ORDER BY TotalSpending DESC


SELECT Country, SUM(Total) as TotalSpending
FROM data
GROUP BY Country
ORDER BY TotalSpending DESC


--Calculate average of spending according to country with apply function?  (Rakamalar Tutmuyor)---
SELECT Country, AVG(Quantity * UnitPrice) as TotalSpending
FROM data
GROUP BY Country
ORDER BY Country

--Calculate average,mean,max of spending according to country with agg function? (Rakamlar tutmuyor)
SELECT Country, MIN(Quantity * UnitPrice) as MinTotalSpending,
MAX(Quantity * UnitPrice) as MaxTotalSpending,
AVG(Quantity * UnitPrice) as AvgTotalSpending
FROM data
GROUP BY Country
ORDER BY Country

--What is the max Total spending in whole dataset and show the records of that spending ? +++
SELECT TOP 1  InvoiceNo,  StockCode,  Description, 
		 Quantity,  InvoiceDate,  UnitPrice,
		 CustomerID, Country, 

MAX(Quantity * UnitPrice) as total
FROM data
group by InvoiceNo,  StockCode,  Description, 
		 Quantity,  InvoiceDate,  UnitPrice,
		 CustomerID, Country 
ORDER BY total DESC

--How many people who live in Spain spend more than average Total ? -----
SELECT COUNT(CustomerID)
FROM data

--GROUP BY CustomerID
--ORDER BY COUNT(CustomerID)


HAVING Country = ( SELECT * FROM data
				   WHERE Country = 'Spain'
				 )

AND SUM(Quantity * UnitPrice) > (
								SELECT AVG(Quantity * UnitPrice) as avg
								FROM data
								)
GROUP BY CustomerID
ORDER BY CustomerID

--Convert datatype of InvoiceDate to datetime and assign it to new column name InvoiceDate2 ----
SELECT * FROM data

SELECT CONVERT(DATE, InvoiceDate) as 'InvoiceDate2'
SELECT CAST(InvoiceDate AS DATE) as 'InvoiceDate2'




--Take only date values (year-month-day) from InvoiceDate2 and assign it to a new column named date
SELECT InvoiceDte,
       STRFTIME('%Y', hire_date) AS year

--drop InvoiceDate2 and InvoiceDate columns permanently *


--Remove A, B, G and E from StockCode in first 5 rows with a string method


--take only Total and date columns with loc and craete a new df named ecom2 


-- take only InvoiceNo and CustomerID and total columns with iloc and craete a new df named ecom3 



--Combine ecom2 and ecom3 with concat 


--Combine ecom2 and ecom3 with merge 



--Combine ecom2 and ecom3 with join




