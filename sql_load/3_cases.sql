--Create table for job posted in Jan,Feb and March

CREATE TABLE january_jobs AS
Select * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;


CREATE TABLE february_jobs AS
Select * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;


CREATE TABLE march_jobs AS
Select * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

/*
Label new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'Local'
- Otherwise 'Onsite'
*/

--1.
SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact

--2.

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;

Select salary_year_avg from job_postings_fact 
WHERE salary_year_avg IS NOT NULL LIMIT 15;

SELECT 
    job_id,
    salary_year_avg,
    CASE
        WHEN salary_year_avg < 70000 THEN 'Low Salary'
        WHEN salary_year_avg BETWEEN 70000 AND 110000 THEN 'STANDARD'
        WHEN salary_year_avg > 110000 THEN 'HIGH Salary'
    END AS salary_brackets
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL -- Highly recommended to filter out empty salaries!
ORDER BY
    salary_year_avg DESC;