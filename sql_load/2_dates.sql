SELECT 
    '2023-02-19'::DATE, --CONVERTED FROM STRING TO DATE FORMAT
    '123'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;

-- Combined Example
SELECT 
      job_title_short AS title,
      job_location AS location,
      job_posted_date :: DATE AS DATE_VAL,
      job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' As date_time,
      EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
limit 5;

-- Use CASE of the Concept

SELECT
      COUNT(job_id) AS job_posted_count,
      EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
        month
ORDER BY
        job_posted_count DESC;      

--PRACTICE PROBLEM
--1
SELECT
      job_schedule_type,
      AVG(salary_year_avg) AS avg_yearly_salary,
      AVG(salary_hour_avg) AS avg_hourly_salary
FROM
      job_postings_fact
WHERE 
      job_posted_date::DATE > '2023-06-01'  -- You do the extraction right here!
GROUP BY
      job_schedule_type;

SELECT * 
FROM
    job_postings_fact
limit 5;

--2 

SELECT
      COUNT(job_id) AS job_posted_count,
      EXTRACT(MONTH from job_posted_date  AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month
FROM
      job_postings_fact
WHERE 
      EXTRACT(YEAR from job_posted_date) = 2023
GROUP BY
        month
ORDER BY
        month DESC;
           

--3

Select * from company_dim

Select DISTINCT cp.name 
from company_dim cp INNER JOIN job_postings_fact jb 
ON cp.company_id = jb.company_id
WHERE 
    EXTRACT(MONTH FROM job_posted_date) IN (4,5,6) and
    EXTRACT(YEAR FROM job_posted_date) = 2023 and
    jb.job_health_insurance = true


SELECT DISTINCT
    cp.name 
FROM 
    company_dim AS cp 
INNER JOIN 
    job_postings_fact AS jb 
    ON cp.company_id = jb.company_id
WHERE 
    EXTRACT(QUARTER FROM jb.job_posted_date) = 2 
    AND EXTRACT(YEAR FROM jb.job_posted_date) = 2023 
    AND jb.job_health_insurance = true;


