/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve.
*/


Select 
    skills,
    ROUND(AVG(salary_year_avg),4) AS avg_salary
from job_postings_fact tp
INNER JOIN skills_job_dim skjb ON tp.job_id = skjb.job_id 
INNER JOIN skills_dim skdm ON skjb.skill_id = skdm.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;