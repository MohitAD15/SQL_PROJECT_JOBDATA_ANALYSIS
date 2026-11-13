/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/

--1. Way1 (Concise Way)
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC;

--2. Way2 - Using CTE's

WITH skills_demand AS(
Select 
    skdm.skill_id,
    skdm.skills,
    COUNT(skjb.job_id) AS demand_count
from job_postings_fact tp
INNER JOIN skills_job_dim skjb ON tp.job_id = skjb.job_id 
INNER JOIN skills_dim skdm ON skjb.skill_id = skdm.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = True
    AND salary_year_avg IS NOT NULL
GROUP BY
    skdm.skill_id
), average_salary AS(
Select 
    skdm.skill_id,
    ROUND(AVG(tp.salary_year_avg),4) AS avg_salary
from job_postings_fact tp
INNER JOIN skills_job_dim skjb ON tp.job_id = skjb.job_id 
INNER JOIN skills_dim skdm ON skjb.skill_id = skdm.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = True
    AND salary_year_avg IS NOT NULL
GROUP BY
    skdm.skill_id
)


SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    average_salary DESC
