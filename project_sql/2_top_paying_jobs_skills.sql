/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name as Company_name
FROM 
    job_postings_fact jb
LEFT JOIN company_dim cd ON jb.company_id = cd.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

Select 
    tp.*, -- will select columns only from  top_paying_jobs CTE table and not from inner join tables
    skdm.skills
from top_paying_jobs tp
INNER JOIN skills_job_dim skjb ON tp.job_id = skjb.job_id 
INNER JOIN skills_dim skdm ON skjb.skill_id = skdm.skill_id
ORDER BY
    salary_year_avg DESC
