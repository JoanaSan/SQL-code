/*

PERSONAL EXPENSES PORTFOLIO PROJECT

The client is a couple who lived in Sweden but moved to USA on October 22. They are interested in knowing how much 
they have spent in both bank accounts (Sweden and USA), specifically by cathegories.

-- I extracted the data from both bank accounts and created a cathegory spreadsheet. 
-- I used Excel Spreadsheets for cleaning, PostgreSQL for organizing and extracting specific data 
and Tableau for Visualization.
-- Excel Spreadsheets was used for removing duplicates, filtering and sorting the data.
-- The month of October'22 arrows an abnormal result which was when a one-time payment and withdraw happened,
these were removed on certain visual analysis for better understanding.  

*/

-- Create tables

CREATE TABLE public."Swedbank"
(
    id numeric(5) NOT NULL,
    transaction_date date,
    name character varying(100),
    concept numeric(3),
    amount numeric(10),
    balance numeric(10),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Swedbank"
    OWNER to postgres;
ALTER TABLE IF EXISTS public."Swedbank"
    OWNER to postgres;

select * from "swedbank"

alter table "Swedbank"
	rename to swedbank

select * from swedbank

CREATE TABLE public."BOFA"
(
    id numeric(3) NOT NULL,
    transaction_day date,
    concept numeric(3),
    description character varying(100),
    amount numeric(10),
    balance numeric(10),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."BOFA"
    OWNER to postgres;
	
select * from "BOFA"

ALTER TABLE "BOFA"
	RENAME TO bofa
	
select * from bofa

select * from concept
ORDER BY 1

-- Alter data 

UPDATE concept
SET concept = 'gas'
WHERE id = 11

UPDATE concept
SET concept = 'car'
WHERE id = 17

INSERT INTO concept (id, concept)
	VALUES 
		(22, 'rent and services');
	 	(23, 'credit card payment')

select * from concept

-- Alter name of table and columns 

ALTER TABLE IF EXISTS public.concept
    RENAME TO category;
	
ALTER TABLE IF EXISTS public.swedbank
    RENAME concept TO category_id;

ALTER TABLE IF EXISTS public.swedbank
    RENAME transaction_day TO transaction_date;

ALTER TABLE IF EXISTS public.bofa
    RENAME transaction_day TO transaction_date;

SELECT * FROM bofa

ALTER TABLE IF EXISTS public.bofa
    RENAME concept TO category_id;

SELECT * FROM bofa

select sum(amount), swedbank.category_id, category.category
from swedbank
LEFT JOIN category ON swedbank.category_id = category.category_id
GROUP BY amount, swedbank.category_id, category.category

-- Sum of all expenses done by category SWEDBANK **TABLEAU**

	SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 1
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 2)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 3)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 4)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 5)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 6)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 7)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 8)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 9)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 10)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 11)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 12)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 13)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 14)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 15)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 16)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 17)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 18)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 19)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 20)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 21)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 22)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM swedbank
		 WHERE swedbank.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 23)
ORDER BY 1

-- Total income on Swedbank **TABLEAU**

SELECT swedbank.category_id,category, SUM(amount)
FROM swedbank
JOIN category
ON swedbank.category_id = category.category_id
WHERE swedbank.category_id = 6
GROUP BY swedbank.category_id, category

-- How many payments were done by Daniel?

SELECT *
FROM swedbank
WHERE category_id = 6
AND name ILIKE '%isak%'
ORDER BY amount DESC

-- How many payments were done by Karen?

SELECT *
FROM swedbank
WHERE category_id = 6
AND name ILIKE '%joana%'
ORDER BY amount DESC


-- Total income made by Daniel

SELECT SUM(amount)
FROM swedbank
WHERE category_id = 6
AND name ILIKE '%isak%'

-- Total income made by Karen?

SELECT SUM(amount)
FROM swedbank
WHERE category_id = 6
AND name ILIKE '%joana%'

select * from swedbank

-- Expenses done every month without income **TABLEAU**


	SELECT SUM(amount), TO_CHAR(
	TO_DATE (9::text, 'MM'), 'Mon21'
	) AS "Date" 
	FROM swedbank
	WHERE category_id != 6 
	AND transaction_date BETWEEN '2021-09-01' AND '2021-09-30' 
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (10::text, 'MM'), 'Mon21'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2021-10-01' AND '2021-10-31')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (11::text, 'MM'), 'Mon21'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2021-11-01' AND '2021-11-30')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (12::text, 'MM'), 'Mon21'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2021-12-01' AND '2021-12-31')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (1::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-01-01' AND '2022-01-31')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (2::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-02-01' AND '2022-02-28')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (3::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-03-01' AND '2022-03-31')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (4::text, 'MM'), 'Mon22'
	) AS "Month Name"
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-04-01' AND '2022-04-30')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (5::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-05-01' AND '2022-05-31')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (6::text, 'MM'),'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-06-01' AND '2022-06-30')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (7::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-07-01' AND '2022-07-31')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (8::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-08-01' AND '2022-08-31')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (9::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-09-01' AND '2022-09-30')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (10::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-10-01' AND '2022-10-31')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (11::text, 'MM'), 'Mon22'
	)
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-11-01' AND '2022-11-30')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (12::text, 'MM'), 'Mon22'
	) 
	FROM swedbank
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-12-01' AND '2022-12-31')
ORDER BY 2 DESC


-- Expenses by month
SELECT 
	EXTRACT (month FROM transaction_date) AS month,
	SUM(amount) AS expenses_month
FROM swedbank
GROUP BY EXTRACT(month FROM transaction_date)
ORDER BY 1;

select * from swedbank
select * from bofa


-- Bofa table

-- Sum of all expenses done by category BOFA **TABLEAU**

	SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 1
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 2)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 3)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 4)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 5)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 6)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 7)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 8)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 9)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 10)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 11)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 12)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 13)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 14)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 15)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 16)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 17)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 18)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 19)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 20)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 21)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 22)
UNION
	(SELECT *,
		(SELECT SUM(amount)
		 FROM bofa
		 WHERE bofa.category_id = category.category_id) AS expend
	FROM category
	GROUP BY category_id
	HAVING category_id = 23)
ORDER BY expend DESC

SELECT * FROM bofa
WHERE category_id = 17

UPDATE bofa
SET category_id = 6
WHERE id = 72

-- Total income on BOFA **TABLEAU**

SELECT SUM(amount), category_id
FROM bofa
WHERE category_id = 6
GROUP BY category_id

-- How many payments were done by Daniel?

SELECT *
FROM bofa
WHERE category_id = 6
AND description ILIKE '%daniel%'
ORDER BY amount DESC


-- How many payments were done by Karen?

SELECT *
FROM bofa
WHERE category_id = 6
AND description ILIKE '%karen%'
ORDER BY amount DESC


-- Total income made by Isak

SELECT SUM(amount)
FROM bofa
WHERE category_id = 6
AND description ILIKE '%daniel%'

-- Total income made by Karen

SELECT SUM(amount)
FROM bofa
WHERE category_id = 6
AND description ILIKE '%karen%'

select * from swedbank
select * from bofa

-- Expenses done every month without income **TABLEAU**

SELECT SUM(amount), TO_CHAR(
	TO_DATE (10::text, 'MM'), 'Mon22'
	) AS "Date"
	FROM bofa
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-10-01' AND '2022-10-31'
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (11::text, 'MM'), 'Mon22'
	) 
	FROM bofa
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-11-01' AND '2022-11-30')
UNION 
	(SELECT SUM(amount), TO_CHAR(
	TO_DATE (12::text, 'MM'), 'Mon22'
	)
	FROM bofa
	WHERE category_id !=6
	AND transaction_date BETWEEN '2022-12-01' AND '2022-11-30')
ORDER BY 2 DESC



-- Expenses by month
SELECT 
	EXTRACT (month FROM transaction_date) AS month,
	SUM(amount) AS expenses_month
FROM bofa
GROUP BY EXTRACT(month FROM transaction_date)
ORDER BY 1;

-- Convert numeric month to characters
SELECT TO_CHAR(
	TO_DATE (12::text, 'MM'), 'Mon YY'
	) AS "Month Name"
FROM bofa

--Extract month from timestamp

SELECT 
	EXTRACT (MONTH FROM TIMESTAMP '2022-12-01'), 
	EXTRACT (YEAR FROM TIMESTAMP '2022-12-01')

select * from swedbank
select * from bofa

