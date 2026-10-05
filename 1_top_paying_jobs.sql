/* What are the top-paying data analyst roles?
 - top ten highest paying data analyst jobs that are available remotly
 - remove postings with null salaries*/

SELECT
    jpf.job_id,
    jpf.job_title AS title,
    jpf.job_location AS location,    
    jpf.job_schedule_type AS schedule_type,
    jpf.job_posted_date,
    jpf.salary_year_avg AS salary,
    cd.name AS company_name 
FROM 
    job_postings_fact jpf
LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_location = 'Anywhere' AND
    jpf.salary_year_avg IS NOT NULL
ORDER BY 
    salary DESC
LIMIT(10);