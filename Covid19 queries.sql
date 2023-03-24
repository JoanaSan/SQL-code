/*
Covid 19 Data Exploration 
Goal: To Analyse the Covid 19 in United States, Mexico and Sweden and see how different the virus was in the three countries

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

SELECT * FROM covidvaccinations

SELECT *
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE continent is not null
ORDER BY 3,4

SELECT *
FROM ProjectPortfolio.dbo.CovidVaccinations
ORDER BY 3,4

-- Total Cases vs Total Deaths AND likelihood of dying if you contract COVID
SELECT location, date, total_cases, total_deaths, total_deaths/total_cases*100 AS DeathPercentage
FROM ProjectPortfolio.dbo.CovidDeaths
ORDER BY 1,2

-- Likelihood of dying if you get COVID in USA
SELECT location, date, total_cases, total_deaths, total_deaths/total_cases*100 AS DeathPercentage
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE location LIKE '%stateS%'
AND continent IS NOT NULL
ORDER BY 1,2

-- Likelihood of dying if you get COVID in MEXICO
SELECT location, date, total_cases, total_deaths, total_deaths/total_cases*100 AS DeathPercentage
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE location LIKE '%MEXICO%'
AND continent IS NOT NULL
ORDER BY 1,2

-- Likelihood of dying if you get COVID in SWEDEN
SELECT location, date, total_cases, total_deaths, total_deaths/total_cases*100 AS DeathPercentage
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE location LIKE '%SWEDEN%'
AND continent IS NOT NULL
ORDER BY 1,2

-- Total cases vs Population
-- Shows percentage of population that got COVID in the USA

SELECT location, date, total_cases, population, (total_cases/population)*100 AS PercentPopulationInfected
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE location LIKE '%states%'
AND continent is not null
ORDER BY 1,2

-- Shows percentage of population that got COVID in MEXICO

SELECT location, date, total_cases, population, (total_cases/population)*100 AS PercentPopulationInfected
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE location LIKE '%mexico%'
AND continent is not null
ORDER BY 1,2

-- Shows percentage of population that got COVID in SWEDEN

SELECT location, date, total_cases, population, (total_cases/population)*100 AS PercentPopulationInfected
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE location LIKE '%sweden%'
AND continent is not null
ORDER BY 1,2


-- Looking at countries with HIGHEST INFECTION COUNT compared to population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 
	AS PercentPopulationInfected
FROM ProjectPortfolio.dbo.CovidDeaths
--WHERE location like '%SWEDEN%'
WHERE continent IS NOT NULL
GROUP BY population, location
ORDER BY 4 DESC

-- Shows the COUNTRIES with the HIGHEST DEATH COUNT PER POPULATION

SELECT location, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY 2 DESC

-- Breaking it down by CONTINENT with the HIGHEST DEATH COUNT PER POPULATION

SELECT continent, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM ProjectPortfolio.dbo.CovidDeaths
WHERE continent IS not NULL
GROUP BY continent
ORDER BY 2 DESC

-- Percentage of death globally. There's a 2% probability of dying from COVID worldwide

select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast
	(new_deaths as int))/SUM(New_cases)*100 as Deathpercentage
FROM ProjectPortfolio.dbo.CovidDeaths
--where location like %states%
WHERE continent is not null
--group by date
order by 1,2

-- Total population vs vaccinations 

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location order by dea.location,
	dea.date)
FROM ProjectPortfolio.dbo.CovidDeaths dea
JOIN ProjectPortfolio.dbo.CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(convert(int,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location,
	dea.date) as RollingPeopleVaccinated
, (RollingPeopleVaccinated(population)*100
FROM ProjectPortfolio.dbo.CovidDeaths dea
JOIN ProjectPortfolio.dbo.CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3



-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM ProjectPortfolio.dbo.CovidDeaths dea
Join ProjectPortfolio.dbo.CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *,(RollingPeopleVaccinated/Population)*100
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
FROM ProjectPortfolio.dbo.CovidDeaths dea
Join ProjectPortfolio.dbo.CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, 
	dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM ProjectPortfolio.dbo.CovidDeaths dea
Join ProjectPortfolio.dbo.CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

SELECT * FROM PercentPopulationVaccinated

