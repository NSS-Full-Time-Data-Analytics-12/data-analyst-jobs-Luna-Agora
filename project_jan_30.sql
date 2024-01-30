SELECT *
FROM data_analyst_jobs;

SELECT COUNT(title)
FROM data_analyst_jobs;
--1. 1793

SELECT *
FROM data_analyst_jobs
LIMIT 10;
--2. exxonmobil

SELECT COUNT(location), location
FROM data_analyst_jobs
WHERE location IN('TN', 'KY')
GROUP BY location;
--3. TN:21 KY:6

SELECT
	COUNT(CASE WHEN star_rating > 4 THEN '1' END) AS four_star_plus
FROM data_analyst_jobs
WHERE location IN ('TN');
--4. 3

SELECT
	COUNT(CASE WHEN review_count > 499 AND review_count < 1001 THEN 'x' END) AS rev_count_500_to_1000
FROM data_analyst_jobs;
--5. 151

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;
--6. NEbraska

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;
--7. 881

SELECT COUNT(DISTINCT title) AS unique_cali_jobs
FROM data_analyst_jobs
WHERE location IN ('CA');
--8. 230

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;
--9. 41

SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC;
--10. 6-way tie general motors, unilever, microsoft, nike, american express, kaiser permanate (4.1999998090)

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--11. 774

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%'
	AND title NOT ILIKE '%analytics%';
--12.a. 4 
--12.b. tableau

--BONUS--
SELECT domain, days_since_posting, COUNT(title) as num_jobs
FROM data_analyst_jobs
WHERE days_since_posting > 21 
	AND domain IS NOT null
	AND skill ILIKE '%SQL%'
GROUP BY domain, days_since_posting
ORDER BY num_jobs DESC;
--bonus--
--1.Banks&Finantial_Services//51--
--2.Internet&Software//49--
--3.Consulting&Buisiness_Services//44--
--4.Health_Care//44--
--Number of jobs: 188--


