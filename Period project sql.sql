/*

MENSTRUAL CYCLE PORTOFLIO PROJECT

Goal: to understand how my menstrual cycle has been behaving since 2017.
I asked several questions such as:
- Whats the average days that my period last?
- Which months I didn't get a period?
- How consistent has it been?
- How does a month look like on average?
- What's the average fluid per period?
- What's been the longest period?
- What has been the longest that I have not had a period?
 etc.
 
 I will be stating the questions before the queries


*/

CREATE TABLE public.period
(	
	id numeric(5) NOT NULL,
	date date,
	period character varying,
	PRIMARY KEY (id)
);

SELECT * FROM period


SELECT COUNT(*)
FROM period
WHERE date BETWEEN '2017-01-01' AND '2023-12-31'
AND period IS NOT NULL

-- Total days registered vs total days with period

SELECT 'Total days registered: ' || count(date) AS total_days, ' Total days with period: ' || count(period) AS period_days
FROM period


SELECT count(date) AS total_days, count(period) AS period_days
FROM period

SELECT * FROM period


-- Days with period in January 2017 is: 

SELECT 'Days with period in Jan17 is ' || COUNT(period)
FROM period
WHERE date BETWEEN '2017-01-01' AND '2017-01-31'

-- Whats the average days that my period last each month?

SELECT COUNT(period) AS period_days_in_total, (count(period)/73) AS average_lenght_per_month --73 is the amount of months in the data
FROM period

-- Average days that my period last each year 


(SELECT COUNT(period), 
	   'AVG period in 2017 is ' || (count(period)/12) AS average_lenght_per_month 
FROM period
WHERE date BETWEEN '2017-01-01' AND '2017-12-31') 
UNION
(SELECT COUNT(period) AS period_days_in_total, 
	   'AVG period in 2018 is ' || (count(period)/12) AS average_lenght_per_month
FROM period
WHERE date BETWEEN '2018-01-01' AND '2018-12-31')
UNION
(SELECT COUNT(period) AS period_days_in_total, 
	   'AVG period in 2019 is ' || (count(period)/12) AS average_lenght_per_month
FROM period
WHERE date BETWEEN '2019-01-01' AND '2019-12-31')
UNION
(SELECT COUNT(period) AS period_days_in_total, 
	   'AVG period in 2020 is ' || (count(period)/12) AS average_lenght_per_month
FROM period
WHERE date BETWEEN '2020-01-01' AND '2020-12-31')
UNION
(SELECT COUNT(period) AS period_days_in_total, 
	   'AVG period in 2021 is ' || (count(period)/12) AS average_lenght_per_month
FROM period
WHERE date BETWEEN '2021-01-01' AND '2021-12-31')
UNION
(SELECT COUNT(period) AS period_days_in_total, 
	   'AVG period in 2022 is ' || (count(period)/12) AS average_lenght_per_month
FROM period
WHERE date BETWEEN '2022-01-01' AND '2022-12-31')
UNION
(SELECT COUNT(period) AS period_days_in_total, 
	   'AVG period in 2023 is ' || (count(period)/12) AS average_lenght_per_month
FROM period
WHERE date BETWEEN '2023-01-01' AND '2023-12-31')
ORDER BY 2

--Average days that my period last each year (without concat) 


(SELECT 
 	TO_CHAR(DATE_TRUNC('year', date), 'YYYY'),
 	  COUNT(period), 
	  (count(period)/12) AS average_lenght_per_year
FROM period
WHERE date BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY DATE_TRUNC('year', date)
) 
UNION
(SELECT 
 	TO_CHAR(DATE_TRUNC('year', date), 'YYYY'),
 	  COUNT(period) AS period_days_in_total, 
	  (count(period)/12) AS average_lenght_per_year
FROM period
WHERE date BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY DATE_TRUNC('year', date)
)
UNION
(SELECT 
 	TO_CHAR(DATE_TRUNC('year', date), 'YYYY'),
 	  COUNT(period) AS period_days_in_total, 
	  (count(period)/12) AS average_lenght_per_year
FROM period
WHERE date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY DATE_TRUNC('year', date)
)
UNION
(SELECT 
 	TO_CHAR(DATE_TRUNC('year', date), 'YYYY'),
 	  COUNT(period) AS period_days_in_total, 
	  (count(period)/12) AS average_lenght_per_year
FROM period
WHERE date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY DATE_TRUNC('year', date)
)
UNION
(SELECT 
 	TO_CHAR(DATE_TRUNC('year', date), 'YYYY'),
 	  COUNT(period) AS period_days_in_total, 
	  (count(period)/12) AS average_lenght_per_year
FROM period
WHERE date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY DATE_TRUNC('year', date)
) 
UNION
(SELECT 
 	TO_CHAR(DATE_TRUNC('year', date), 'YYYY'),
 	  COUNT(period) AS period_days_in_total, 
	  (count(period)/12) AS average_lenght_per_year
FROM period
WHERE date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY DATE_TRUNC('year', date)
)
UNION
(SELECT 
 	TO_CHAR(DATE_TRUNC('year', date), 'YYYY'),
 	  COUNT(period) AS period_days_in_total, 
	  (count(period)/12) AS average_lenght_per_year
FROM period
WHERE date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY DATE_TRUNC('year', date)
)  
ORDER BY 1

--Which months I didn't get a period? 

SELECT TO_CHAR (date, 'yyyy/mm') AS months_without_period, COUNT(period) AS period_days
FROM period
GROUP BY TO_CHAR (date, 'yyyy/mm')
HAVING COUNT(period) = 0
ORDER BY 1

-- Shows every month with the count of period days

SELECT TO_CHAR (date, 'yyyy/mm') AS period_days, COUNT(period) AS count_period_days 
FROM period
GROUP BY TO_CHAR (date, 'yyyy/mm')
--HAVING COUNT(period) = 0
ORDER BY 1

-- Shows months with more than average period days

SELECT TO_CHAR (date, 'yyyy/mm') AS months_without_period, COUNT(period) AS period_days 
FROM period
GROUP BY TO_CHAR (date, 'yyyy/mm')
--HAVING COUNT(period) = 0
HAVING COUNT(period) > 4
ORDER BY 1

-- Shows months with less than average period days

SELECT TO_CHAR (date, 'yyyy/mm') AS months_without_period, COUNT(period) AS period_days 
FROM period
GROUP BY TO_CHAR (date, 'yyyy/mm')
--HAVING COUNT(period) = 0
HAVING COUNT(period) < 4
ORDER BY 1


-- Which years is the data from?

SELECT DISTINCT(EXTRACT (YEAR FROM date))
from period
ORDER BY 1

SELECT AGE(date)
FROM period

select * from period

-- how many days has it been medium, heavy and spotting period?

	SELECT COUNT(period), period
	FROM period
	WHERE period ILIKE 'spotting'
	GROUP BY period
UNION 
	SELECT COUNT(period), period
	FROM period
	WHERE period ILIKE 'LIGHT'
	GROUP BY period
union 
	SELECT COUNT(period), period
	FROM period
	WHERE period ILIKE 'medium'
	GROUP BY period
UNION 
	SELECT COUNT(period), period
	FROM period
	WHERE period ILIKE 'heavy'
	GROUP BY period
