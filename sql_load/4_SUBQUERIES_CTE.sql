--- Subquery

SELECT*
FROM(
    SELECT*
    FROM job_postings_fact
    where EXTRACT(MONTH FROM job_posted_date) = 1 
) AS january_jobs;


SELECT * FROM job_postings_fact


SELECT 
    job_id,
    job_title_short,
    job_location
FROM 
    job_postings_fact
WHERE 
    company_id IN (
        -- The database runs this inner query FIRST to get a list of AI company IDs
        SELECT company_id 
        FROM company_dim 
        WHERE name LIKE '%AI%'
    )
    AND job_title_short = 'Software Engineer';


SELECT 
    job_id,
    salary_year_avg,
    (SELECT MAX(salary_year_avg) FROM job_postings_fact) AS highest_market_salary
FROM 
    job_postings_fact;

-- CTE

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

Select * from january_jobs;

-- Get Company names whi give job without degree

SELECT
    company_id, 
    name as company_name
FROM company_dim
WHERE company_id IN (
    SELECT 
            company_id
    FROM 
            job_postings_fact
    WHERE 
            job_no_degree_mention = true
    ORDER BY
            company_id
)

/*
Find the companies that have the most job openings.
- Get the total number of job postings per company id (job_posting_fact)
- Return the total number of jobs with the company name (company_dim)
*/

WITH company_job_count AS (
SELECT 
    company_id ,
    COUNT(*) AS total_jobs
FROM 
    job_postings_fact  
GROUP BY
    company_id
)

Select company_dim.name As company_name,
company_job_count.total_jobs
FROM company_dim 
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC;

--PRACTICE PROBLEM--

--1

-- using CTE 
with top_skills AS (

SELECT 
    skill_id,
    COUNT(job_id) AS skill_count
FROM 
    skills_job_dim 
GROUP BY 
    skill_id
ORDER BY 
    skill_count DESC
LIMIT 5

)


Select skills_dim.skills from top_skills 
LEFT JOIN skills_dim ON  top_skills.skill_id = skills_dim.skill_id;


-- Using Subquery 

SELECT 
    skills_dim.skills -- Assuming the column is called skill_name or skills
FROM 
    skills_dim
INNER JOIN (
    -- Your corrected subquery goes here
    SELECT 
        skill_id,
        COUNT(job_id) AS skill_count
    FROM 
        skills_job_dim 
    GROUP BY 
        skill_id
    ORDER BY 
        skill_count DESC
    LIMIT 5
) AS top_skills 
    ON skills_dim.skill_id = top_skills.skill_id;


/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/

with remote_job_skills AS (

SELECT 

      skill_id,
      count(*) as skill_count
FROM
    skills_job_dim AS skills_to_job
INNER JOIN
    job_postings_fact AS job_postings 
ON
    skills_to_job.job_id = job_postings.job_id
WHERE
    job_postings.job_work_from_home = true
GROUP BY
    skill_id
)

Select skills.skill_id, 
    skills as skill_name,
    skill_count
from
remote_job_skills 
INNER JOIN skills_dim As skills 
ON remote_job_skills.skill_id = skills.skill_id
ORDER BY
    skill_count DESC
limit 5;