use PythonFiles


--Assignment-1 in DA With Python

SELECT TOP 5 * FROM Salaries

--How many different year value are there? P+, t+

SELECT [Year], COUNT([Year])
FROM Salaries
GROUP BY [Year]
ORDER BY COUNT([Year]) DESC


--Print out max and avg Totalpay    P+, T-
SELECT MAX(TotalPay) as TotalPay
FROM Salaries


SELECT AVG(TotalPay) as TotalPay2
FROM Salaries

SELECT MIN(TotalPay) as TotalPay
FROM Salaries

--How many records are there which have TotalPay bigger than avg TotalPay? --

SELECT  COUNT(TotalPay) as CountOfBigger
FROM Salaries
GROUP BY TotalPay
HAVING COUNT(TotalPay) > AVG(TotalPay)

--How much does ALBERT PARDINI make (including benefits)?  --
SELECT EmployeeName, TotalPayBenefits
FROM Salaries
WHERE EmployeeName = 'Albert Pardini'


SELECT EmployeeName, TotalPayBenefits
FROM Salaries
WHERE EmployeeName = 'David P Kucia'



--Who is lowest paid person
SELECT EmployeeName, MIN(TotalPayBenefits) MinPay
FROM Salaries
GROUP BY EmployeeName
ORDER BY MinPay, EmployeeName

SELECT * FROM Salaries

--What are the unique Jobs in dataset?
SELECT DISTINCT JobTitle
FROM Salaries


SELECT COUNT(DISTINCT JobTitle)
FROM Salaries


--List 3 most uncommon Jobs
SELECT TOP 3 JobTitle, COUNT(JobTitle) as CountOfJobTitle 
FROM Salaries
GROUP BY JobTitle
ORDER BY COUNT(JobTitle) ASC


SELECT  JobTitle, COUNT(JobTitle) as CountOfJobTitle 
FROM Salaries
WHERE JobTitle ='VICTIM & WITNESS TECHNICIAN '
GROUP BY JobTitle
ORDER BY COUNT(JobTitle) ASC

--How many people earned more than avg in 2012
SELECT * FROM Salaries


SELECT COUNT(EmployeeName) 
FROM Salaries
WHERE TotalPayBenefits > (
							SELECT AVG(TotalPayBenefits)
							FROM Salaries
							WHERE Year = 2012
						)


SELECT AVG(TotalPayBenefits)
FROM Salaries
WHERE Year = 2012


--Print out the names of the employees who earn more than min but less than avg  ???
SELECT EmployeeName, MIN(TotalPayBenefits)
FROM Salaries

HAVING TotalPayBenefits > (
							SELECT MIN(TotalPayBenefits)
							FROM Salaries
							
						   )
GROUP BY EmployeeName
AND TotalPayBenefits <  (
							SELECT AVG(TotalPayBenefits)
							FROM Salaries
							
						)
GROUP BY EmployeeName

--How many people have the word Manager in their job title? +
SELECT COUNT(JobTitle) 
FROM Salaries
WHERE JobTitle LIKE '%Manager%'


--Take Id,EmployeeName,JobTitle,TotalPay and TotalPayBenefits columns with iloc and assign it as sal_new dataframe
SELECT TOP 5 * FROM Salaries
SELECT TOP 5 Id, EmployeeName, Jobtitle, TotalPay, TotalPayBenefits
FROM Salaries



