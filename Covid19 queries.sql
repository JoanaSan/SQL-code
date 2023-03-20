/*
Covid 19 Data Exploration 
Goal: To Analyse the Covid 19 in United States, Mexico and Sweden and see how different the virus was in the three countries

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

CREATE TABLE CovidDeaths (
	iso_code text,
	continent text,
	location text,
	date date,
	total_cases NUMERIC,
	new_cases NUMERIC,
	new_cases_smoothed NUMERIC
	total_cases_per_million NUMERIC,
	new_cases_per_million NUMERIC, 
	new_cases_smoothed_per_million NUMERIC, 
	total_deaths_per_million NUMERIC, 
	new_deaths_per_million NUMERIC,  
	new_deaths_smoothed_per_million NUMERIC, 
	reproduction_rate NUMERIC, 
	icu_patients NUMERIC, 
	icu_patients_per_million NUMERIC,  
	hosp_patients NUMERIC, 
	hosp_patients_per_million NUMERIC,  
	weekly_icu_admissions NUMERIC,  
	weekly_icu_admissions_per_million NUMERIC,  
	weekly_hosp_admissions NUMERIC, 	
	weekly_hosp_admissions_per_million NUMERIC, 
	new_tests NUMERIC,  
	total_tests NUMERIC, 
	total_tests_per_thousand NUMERIC,  	
	new_tests_per_thousand NUMERIC,  
	new_tests_smoothed NUMERIC,  
	new_tests_smoothed_per_thousand NUMERIC, 
	positive_rate NUMERIC, 
	ests_per_case NUMERIC, 
	total_vaccinations NUMERIC, 
	people_vaccinated NUMERIC, 
	people_fully_vaccinated NUMERIC, 
	new_vaccinations NUMERIC, 	
	new_vaccinations_smoothed NUMERIC, 	
	total_vaccinations_per_hundred NUMERIC, 	
	people_vaccinated_per_hundred NUMERIC, 
	people_fully_vaccinated_per_hundred NUMERIC, 
	new_vaccinations_smoothed_per_million NUMERIC, 	
	stringency_index NUMERIC, 
	population NUMERIC, 
	population_density NUMERIC, 	
	median_age NUMERIC, 	
	aged_65_older NUMERIC, 	
	aaed_70_older NUMERIC, 	
	gdp_per_capita NUMERIC, 	
	extreme_poverty NUMERIC, 	
	cardiovasc_death_rate NUMERIC, 	
	diabetes_prevalence NUMERIC, 	
	female_smokers NUMERIC, 	
	male_smokers NUMERIC, 	
    handwashing_facilities NUMERIC, 	
	hospital_beds_per_thousand NUMERIC, 	
	life_expectancy NUMERIC, 	
	human_development_index NUMERIC
);

SELECT * FROM CovidDeaths
WHERE continent is not null

CREATE TABLE covidvaccinations (
	iso_code TEXT,
	continent TEXT,
	location TEXT,
	date DATE,
	new_tests NUMERIC,
	total_tests	NUMERIC,
	total_tests_per_thousand NUMERIC,
	new_tests_per_thousand	NUMERIC,
	new_tests_smoothed	NUMERIC,
	new_tests_smoothed_per_thousand	NUMERIC,
	positive_rate NUMERIC,
	tests_per_case	NUMERIC,
	tests_units TEXT,	
	total_vaccinations	NUMERIC,
	people_vaccinated NUMERIC,
	people_fully_vaccinated	NUMERIC,
	new_vaccinations NUMERIC,
	new_vaccinations_smoothed NUMERIC,
	total_vaccinations_per_hundred NUMERIC,
	people_vaccinated_per_hundred NUMERIC,
	people_fully_vaccinated_per_hundred NUMERIC,
	new_vaccinations_smoothed_per_million NUMERIC,
	stringency_index NUMERIC,
	population_density NUMERIC,
	median_age NUMERIC,
	aged_65_older NUMERIC,
	aged_70_older NUMERIC,	
	gdp_per_capita	NUMERIC,
	extreme_poverty	NUMERIC,
	cardiovasc_death_rate NUMERIC,
	diabetes_prevalence NUMERIC,
	female_smokers	NUMERIC,
	male_smokers	NUMERIC,
	handwashing_facilities	NUMERIC,
	hospital_beds_per_thousand	NUMERIC,
	life_expectancy	NUMERIC,
	human_development_index NUMERIC
);

SELECT * FROM covidvaccinations

SELECT *
FROM coviddeaths
WHERE continent is not null
ORDER BY 3,4

SELECT *
FROM covidvaccinations
ORDER BY 3,4


ALTER TABLE coviddeaths
	ALTER COLUMN total_cases TYPE NUMERIC,
	ALTER COLUMN new_cases  TYPE NUMERIC,
	ALTER COLUMN total_deaths TYPE NUMERIC,
	ALTER COLUMN new_deaths TYPE NUMERIC;
	
-- Total Cases vs Total Deaths AND likelihood of dying if you contract COVID
SELECT location, date, total_cases, total_deaths, total_deaths/total_cases*100 AS DeathPercentage
FROM coviddeaths
ORDER BY 1,2

-- Likelihood of dying if you get COVID in USA
SELECT location, date, total_cases, total_deaths, total_deaths/total_cases*100 AS DeathPercentage
FROM coviddeaths
WHERE location ILIKE '%stateS%'
AND continent IS NOT NULL
ORDER BY 1,2

-- Likelihood of dying if you get COVID in MEXICO
SELECT location, date, total_cases, total_deaths, total_deaths/total_cases*100 AS DeathPercentage
FROM coviddeaths
WHERE location ILIKE '%MEXICO%'
AND continent IS NOT NULL
ORDER BY 1,2

-- Likelihood of dying if you get COVID in SWEDEN
SELECT location, date, total_cases, total_deaths, total_deaths/total_cases*100 AS DeathPercentage
FROM coviddeaths
WHERE location ILIKE '%SWEDEN%'
AND continent IS NOT NULL
ORDER BY 1,2

-- Total cases vs Population
-- Shows percentage of population that got COVID in the USA

SELECT location, date, total_cases, population, (total_cases/population)*100 AS PercentPopulationInfected
FROM coviddeaths
WHERE location ILIKE '%states%'
AND continent is not null
ORDER BY 1,2

-- Shows percentage of population that got COVID in MEXICO

SELECT location, date, total_cases, population, (total_cases/population)*100 AS PercentPopulationInfected
FROM coviddeaths
WHERE location ILIKE '%MEXICO%'
AND continent is not null
ORDER BY 1,2

-- Shows percentage of population that got COVID in SWEDEN

SELECT location, date, total_cases, population, (total_cases/population)*100 AS PercentPopulationInfected
FROM coviddeaths
WHERE location ILIKE '%SWEDEN%'
AND continent IS NOT NULL
ORDER BY 1,2


-- Looking at countries with HIGHEST INFECTION COUNT compared to population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 
	AS PercentPopulationInfected
FROM coviddeaths
--WHERE location ILIKE '%SWEDEN%'
WHERE continent IS NOT NULL
GROUP BY population, location
ORDER BY 4 DESC

-- Shows the COUNTRIES with the HIGHEST DEATH COUNT PER POPULATION

SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY 2 DESC

-- Breaking it down by CONTINENT with the HIGHEST DEATH COUNT PER POPULATION

SELECT continent, MAX(total_deaths) AS TotalDeathCount
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 2 DESC

-- Percentage of death globally. There's a 2% probability of dying from COVID worldwide

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE continent IS NOT NULL
--GROUP BY  date
ORDER BY 1,2


-- Total population vs vaccinations 

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(VAC.NEW_VACCINATIONS) OVER (Partition by dea.location ORDER BY dea.location, dea.date)
FROM coviddeaths dea
JOIN covidvaccinations vac
	ON dea.location = vac.location
	AND dea.date = dea.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3
LIMIT 10000

-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac


-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

