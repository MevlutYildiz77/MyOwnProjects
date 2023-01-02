use PythonFiles

SELECT * FROM adult_eda

--write all ? rows in workclass column
SELECT *
FROM adult_eda
WHERE workclass IN ('?')

--REPLACE '?' WITH 'Unknown' STATEMENT
SELECT REPLACE(workclass, '?', 'Unknown') as workclass
FROM adult_eda

update adult_eda set workclass = replace(workclass, '?', 'Unknown');
commit;

select * from adult_eda

--Find rows of df["hours-per-week"] == 99)
SELECT *
FROM adult_eda
WHERE hours_per_week = 99

--How many of each race are represented in this dataset?
SELECT race, COUNT(race) as CountOfEachRace
FROM adult_eda
GROUP BY race
ORDER BY CountOfEachRace DESC

--What is the average age of men/women?
SELECT sex, AVG(age)as AverageOfEachSex
FROM adult_eda
GROUP BY sex
ORDER BY AverageOfEachSex DESC

--What is the percentage of people who have a Bachelor's degree?
SELECT education, COUNT(education) as CountsOfEducationKinds
FROM adult_eda
GROUP BY education
ORDER BY CountsOfEducationKinds DESC


--What percentage of people with advanced education (Bachelors, Masters, or Doctorate) make more than 50K? ---
SELECT  COUNT(salary) as salary
FROM adult_eda
WHERE education IN('Bachelors', 'Masters', 'Doctorates')
AND salary > '50k'

ORDER BY salary

SELECT  COUNT(salary) as salary_order
FROM adult_eda
WHERE salary > '50K'
GROUP BY education
ORDER BY salary_order

--What country has the highest percentage of people that earn >50K?  --
SELECT native_country, COUNT(MAX(salary))as MaxSalary
FROM adult_eda
WHERE salary = '>50K'
GROUP BY native_country
ORDER BY MaxSalary