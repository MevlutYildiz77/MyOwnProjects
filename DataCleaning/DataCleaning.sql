CREATE DATABASE MovieProject

use MovieProject
--CREATE TABLE movies1
SELECT * FROM movies
SELECT * FROM MovieProject.dbo.movies

BULK INSERT movies
FROM 'C:\Users\TOSHIBA\Desktop\CLARUSWAY\MyQwnProjects\data_clean_with_SQL\movies.csv'
WITH (FORMAT = 'CSV'
      , FIRSTROW=2
	  --, FIELDQUOTE = '"'
	  , FIELDTERMINATOR = ','
	  , ROWTERMINATOR = '0x0a');


--DROP TABLE movies


-------------------------------------------------------------
--df=pd.read.csv

SELECT * FROM movies


--df.head()

SELECT  TOP 5 * 
FROM movies



--df.shape

CREATE TABLE #tmpTableSizes
(
    tableName varchar(100),
    numberofRows varchar(100),
    reservedSize varchar(50),
    dataSize varchar(50),
    indexSize varchar(50),
    unusedSize varchar(50)
)
insert #tmpTableSizes
EXEC sp_MSforeachtable @command1="EXEC sp_spaceused '?'"


select  * from #tmpTableSizes
order by cast(LEFT(reservedSize, LEN(reservedSize) - 4) as int)  desc


sp_spaceused 'movies'     --sp_spaceused ‘Tablename’



SELECT 
    t.NAME AS TableName,    
    p.rows AS RowCounts,
    CONVERT(DECIMAL,SUM(a.total_pages)) * 8 / 1024 / 1024 AS TotalSpaceGB, 
    SUM(a.used_pages)  * 8 / 1024 / 1024 AS UsedSpaceGB , 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 / 1024 / 1024 AS UnusedSpaceGB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.NAME = 'movies'
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
    UsedSpaceGB DESC, t.Name



SELECT COUNT(*) FROM movies



SELECT 
    t.NAME AS TableName,
    s.Name AS SchemaName,
    p.rows AS RowCounts,
    SUM(a.total_pages) * 8 AS TotalSpaceKB, 
    CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalSpaceMB,
    SUM(a.used_pages) * 8 AS UsedSpaceKB, 
    CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB,
    CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS UnusedSpaceMB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
    t.Name



SELECT 
   CASE WHEN (GROUPING(sob.name)=1) THEN 'All_Tables'
   ELSE ISNULL(sob.name, 'unknown') END AS TableName,
   SUM(sys.length) AS ByteLength
FROM sysobjects sob, syscolumns sys
WHERE sob.xtype='u' AND sys.id = sob.id
GROUP BY sob.name
WITH CUBE
ORDER BY SUM(sys.length) DESC

--df.[COLUMN].value_counts()

SELECT MOVIES, COUNT(*) as CountofMovie FROM movies GROUP BY MOVIES ORDER BY CountofMovie DESC
SELECT      YEAR, COUNT(*) as CountofYear FROM movies GROUP BY YEAR ORDER BY CountofYear DESC
SELECT	   GENRE, COUNT(*) as CountofGENRE FROM movies GROUP BY GENRE ORDER BY CountofGENRE DESC
SELECT	   RATING, COUNT(*) as CountofRATING FROM movies GROUP BY RATING ORDER BY CountofRATING DESC
--SELECT	   ONE-LINE, COUNT(*) as CountofONE-LINE FROM movies GROUP BY ONE-LINE ORDER BY CountofONE-LINE DESC
SELECT	   STARS, COUNT(*) as CountofSTARS FROM movies GROUP BY STARS ORDER BY CountofSTARS DESC
SELECT	   VOTES, COUNT(*) as CountofVOTES FROM movies GROUP BY VOTES ORDER BY CountofVOTES DESC
SELECT	   RunTime, COUNT(*) as CountofRuntime FROM movies GROUP BY RunTime ORDER BY CountofRuntime DESC
SELECT	   Gross, COUNT(*) as CountofGross FROM movies GROUP BY Gross ORDER BY CountofGross DESC


--df[df.MOVIES == '#Realityhigh']
SELECT * 
FROM movies
WHERE MOVIES = '#Realityhigh'


--df.isnull().sum()*100/df.shape[0]

SELECT 100.0 * (COUNT(*) - COUNT(MOVIES)) / COUNT(*) AS MOVIESNullPercent,
100.0 * (COUNT(*) - COUNT(YEAR)) / COUNT(*) AS YEARNullPercent,
100.0 * (COUNT(*) - COUNT( GENRE)) / COUNT(*) AS GENRENullPercent,
100.0 * (COUNT(*) - COUNT(RATING)) / COUNT(*) AS RATINGNullPercent,
--100.0 * (COUNT(*) - COUNT(ONE-LINE)) / COUNT(*) AS ONE-LINENullPercent,
100.0 * (COUNT(*) - COUNT( STARS)) / COUNT(*) AS STARSNullPercent,
100.0 * (COUNT(*) - COUNT(VOTES)) / COUNT(*) AS VOTESNullPercent,
100.0 * (COUNT(*) - COUNT( RunTime)) / COUNT(*) AS RunTimeNullPercent,
100.0 * (COUNT(*) - COUNT( Gross)) / COUNT(*) AS GrossNullPercent
FROM movies

SELECT 100.0 * SUM(CASE WHEN MOVIES IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS MOVIESPercent FROM movies
SELECT 100.0 * SUM(CASE WHEN YEAR IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS YEARPercent FROM movies
SELECT 100.0 * SUM(CASE WHEN GENRE IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS GENREPercent FROM movies
SELECT 100.0 * SUM(CASE WHEN RATING IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS RATINGPercent FROM movies
--SELECT 100.0 * SUM(CASE WHEN ONE-LINE IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS ONE-LINEPercent FROM movies
SELECT 100.0 * SUM(CASE WHEN STARS IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS STARSPercent FROM movies
SELECT 100.0 * SUM(CASE WHEN VOTES IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS VOTESPercent FROM movies
SELECT 100.0 * SUM(CASE WHEN RunTime IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS RunTimePercent FROM movies
SELECT 100.0 * SUM(CASE WHEN Gross IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS GrossPercent FROM movies









