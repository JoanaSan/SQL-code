/* Portfolio Project:
Top 50 video games sold
Practice purpose only
*/

SELECT * FROM sales_video_games


UPDATE sales_video_games
SET publisher = 'Electronic Arts'
WHERE rank = 37 

-- Show the data 

SELECT * 
FROM sales_video_games
ORDER BY 3 DESC

-- Developers with more than 1 game released --2

SELECT DISTINCT(developer), COUNT(developer) 
FROM sales_video_games
group by developer
HAVING count(developer) >=2
ORDER BY 2 DESC
LIMIT 10

-- Publishers with more than 1 game released --3

SELECT DISTINCT(publisher), 
	    COUNT(publisher)
FROM sales_video_games
group by publisher
having count(publisher) >=2
ORDER BY 2 DESC
LIMIT 10

-- Oldest game released among the Top 10 most sold video games - 4

SELECT * 
FROM sales_video_games
ORDER BY 6 ASC
LIMIT 10

-- Newest video game released among the Top 10 most sold video games - 5

SELECT * 
FROM sales_video_games
ORDER BY 6 DESC
LIMIT 10


-- Are there any games among the Top 43 that were released the same year? 
--If so, show only the years with more than 1 game released --6 

SELECT DATE_PART('YEAR', initial_release_date) AS initial_release_date, COUNT(DATE_PART('YEAR', initial_release_date))
FROM sales_video_games
GROUP BY DATE_PART('YEAR', initial_release_date)
HAVING COUNT(DATE_PART('YEAR', initial_release_date)) >=2
ORDER BY 2 DESC
LIMIT 10

-- Confirm the data 

SELECT * FROM sales_video_games
WHERE DATE_PART('YEAR', initial_release_date) = 2006

-- AVG sale of all games 

SELECT AVG(sales)
FROM sales_video_games
WHERE series NOT ILIKE 'minecraft'

update sales_video_games
SET developer = 'Electronic Arts'
where rank IN ('37', '3')

select developer from sales_video_games
