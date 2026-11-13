/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
*/

--1. Way1

WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON
        job_postings.job_id = skills_to_job.job_id  -- cut off in image
    WHERE
        job_postings.job_work_from_home = True AND
        job_postings.job_title_short = 'Data Analyst'  -- closing quote cut off
    GROUP BY
        skill_id
)

SELECT
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id  -- cut off in image
ORDER BY
    skill_count DESC
LIMIT 5;

--2. Way2 (Important)

Select 
    skills,
    COUNT(skjb.job_id) AS demand_count
from job_postings_fact tp
INNER JOIN skills_job_dim skjb ON tp.job_id = skjb.job_id 
INNER JOIN skills_dim skdm ON skjb.skill_id = skdm.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;