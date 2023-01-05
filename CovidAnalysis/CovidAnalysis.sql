 use PythonFiles



 SELECT * FROM covid

 --HOW MANY LOCATÝON ARE THERE DIFFERENTLY?
 SELECT DISTINCT location, COUNT(location) as CountOfLocation
 FROM covid
 GROUP BY location
 order by CountOfLocation DESC


 SELECT COUNT(location) as CountOfLocation
 FROM covid

 --WHICH COUNTRY HAS THE MOST total_cases?
 SELECT TOP 5 location, MAX(total_cases) as CountOfTotalCase
 FROM covid
 GROUP BY location
 ORDER BY CountOfTotalCase DESC

 --WHICH COUNTRY HAS THE MOST total_death?
 SELECT TOP 7 location, MAX(total_deaths) as CountOfTotalDeaths
 FROM covid
 GROUP BY location
 ORDER BY CountOfTotalDeaths DESC

 --WHICH COUNTRY HAS THE MOST reproduction_rate?
 SELECT TOP 7 location, MAX(reproduction_rate) as AmountOfReproductionRate
 FROM covid
 GROUP BY location
 ORDER BY AmountOfReproductionRate DESC

 --WHICH COUNTRY HAS THE MOST AND THE LEAST total_test?
 SELECT TOP 7 location, MAX(total_tests) as AmountOfTotalTest
 FROM covid
 GROUP BY location
 ORDER BY AmountOfTotalTest DESC


 SELECT  location, MIN(total_tests) as RatetOfPositiveRate
 FROM covid
 GROUP BY location
 ORDER BY RatetOfPositiveRate

  --WHICH COUNTRY HAS THE MOST AND THE LEAST positive_rate?
 SELECT TOP 7 location, MAX(positive_rate) as RatetOfPositiveRate
 FROM covid
 GROUP BY location
 ORDER BY RatetOfPositiveRate DESC

 SELECT  location, MIN(positive_rate) as RatetOfPositiveRate
 FROM covid
 GROUP BY location
 ORDER BY RatetOfPositiveRate 

  --WHICH COUNTRY HAS THE MOST AND THE LEAST total_vaccinations?
 SELECT TOP 10 location, MAX(total_vaccinations) as CountOfTotalVaccination
 FROM covid
 GROUP BY location
 ORDER BY CountOfTotalVaccination DESC


SELECT TOP 25 location, MIN(total_vaccinations) as CountOfTotalVaccination
 FROM covid
 GROUP BY location
 ORDER BY CountOfTotalVaccination 

 --WHICH COUNTRY HAS THE MOST AND THE LEAST total_vaccinations?
 SELECT TOP 10 location, MAX(total_vaccinations) as CountOfPeopleVaccinated
 FROM covid
 GROUP BY location
 ORDER BY CountOfPeopleVaccinated DESC


SELECT TOP 32 location, MIN(total_vaccinations) as CountOfPeopleVaccinated
 FROM covid
 GROUP BY location
 ORDER BY CountOfPeopleVaccinated 

 --WHICH COUNTRY HAS THE MOST AND THE LEAST population?
 SELECT TOP 10 location, MAX(population) as CountOfPopulation
 FROM covid
 GROUP BY location
 ORDER BY CountOfPopulation DESC


SELECT TOP 32 location, MIN(population) as CountOfPopulation
 FROM covid
 GROUP BY location
 ORDER BY CountOfPopulation


  --WHICH COUNTRY HAS THE MOST AND THE LEAST aged_65_older?
 SELECT TOP 10 location, MAX(aged_65_older) as CountOfaged_65_older
 FROM covid
 GROUP BY location
 ORDER BY CountOfaged_65_older DESC


SELECT TOP 50 location, MIN(aged_65_older) as CountOfaged_65_older
 FROM covid
 GROUP BY location
 ORDER BY CountOfaged_65_older

  --WHICH COUNTRY HAS THE MOST AND THE LEAST aged_70_older?
 SELECT TOP 10 location, MAX(aged_70_older) as CountOfaged_70_older
 FROM covid
 GROUP BY location
 ORDER BY CountOfaged_70_older DESC


SELECT TOP 50 location, MIN(aged_70_older) as CountOfaged_70_older
 FROM covid
 GROUP BY location
 ORDER BY CountOfaged_70_older


  --WHICH COUNTRY HAS THE MOST AND THE LEAST gdp_per_capita?
 SELECT TOP 10 location, MAX(gdp_per_capita) as AmountOfgdp_per_capita
 FROM covid
 GROUP BY location
 ORDER BY AmountOfgdp_per_capita DESC


SELECT TOP 50 location, MIN(gdp_per_capita) as AmountOfgdp_per_capita
 FROM covid
 GROUP BY location
 ORDER BY AmountOfgdp_per_capita


   --WHICH COUNTRY HAS THE MOST AND THE LEAST cardiovasc_death_rate?
 SELECT TOP 10 location, MAX(cardiovasc_death_rate) as RateOfgdp_per_capita
 FROM covid
 GROUP BY location
 ORDER BY RateOfgdp_per_capita DESC


SELECT TOP 50 location, MIN(cardiovasc_death_rate) as RateOfgdp_per_capita
 FROM covid
 GROUP BY location
 ORDER BY RateOfgdp_per_capita


   --WHICH COUNTRY HAS THE MOST AND THE LEAST diabetes_prevalence?
 SELECT TOP 10 location, MAX(diabetes_prevalence) as AmountOfdiabetes_prevalence
 FROM covid
 GROUP BY location
 ORDER BY AmountOfdiabetes_prevalence DESC


SELECT TOP 50 location, MIN(diabetes_prevalence) as AmountOfdiabetes_prevalence
 FROM covid
 GROUP BY location
 ORDER BY AmountOfdiabetes_prevalence


   --WHICH COUNTRY HAS THE MOST AND THE LEAST female_smokers?
 SELECT TOP 10 location, MAX(female_smokers) as AmountOffemale_smokers
 FROM covid
 GROUP BY location
 ORDER BY AmountOffemale_smokers DESC


SELECT TOP 50 location, MIN(female_smokers) as AmountOffemale_smokers
 FROM covid
 GROUP BY location
 ORDER BY AmountOffemale_smokers

   --WHICH COUNTRY HAS THE MOST AND THE LEAST male_smokers?
 SELECT TOP 10 location, MAX(male_smokers) as AmountOfmale_smokers
 FROM covid
 GROUP BY location
 ORDER BY AmountOfmale_smokers DESC


SELECT TOP 50 location, MIN(male_smokers) as AmountOfmale_smokers
 FROM covid
 GROUP BY location
 ORDER BY AmountOfmale_smokers

    --WHICH COUNTRY HAS THE MOST AND THE LEAST hospital_beds_per_thousand?
 SELECT TOP 10 location, MAX(hospital_beds_per_thousand) as AmountOfhospital_beds_per_thousand
 FROM covid
 GROUP BY location
 ORDER BY AmountOfhospital_beds_per_thousand DESC


SELECT TOP 50 location, MIN(hospital_beds_per_thousand) as AmountOfhospital_beds_per_thousand
 FROM covid
 GROUP BY location
 ORDER BY AmountOfhospital_beds_per_thousand


    --WHICH COUNTRY HAS THE MOST AND THE LEAST life_expectancy?
 SELECT TOP 10 location, MAX(life_expectancy) as AmountOflife_expectancy
 FROM covid
 GROUP BY location
 ORDER BY AmountOflife_expectancy DESC


SELECT TOP 50 location, MIN(life_expectancy) as AmountOflife_expectancy
 FROM covid
 GROUP BY location
 ORDER BY AmountOflife_expectancy

     --WHICH COUNTRY HAS THE MOST AND THE LEAST human_development_index?
 SELECT TOP 10 location, MAX(human_development_index) as AmountOfhuman_development_index
 FROM covid
 GROUP BY location
 ORDER BY AmountOfhuman_development_index DESC


SELECT TOP 50 location, MIN(human_development_index) as AmountOfhuman_development_index
 FROM covid
 GROUP BY location
 ORDER BY AmountOfhuman_development_index



















