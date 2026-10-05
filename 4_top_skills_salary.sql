/* What are the top skills based on salary*/


SELECT                
    ROUND(AVG(jpf.salary_year_avg), 0) AS average_salary,
    sd.skills
FROM 
    job_postings_fact jpf
    INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.salary_year_avg IS NOT NULL AND
    jpf.job_work_from_home = TRUE
GROUP BY
    sd.skills
ORDER BY 
    average_salary DESC
LIMIT(25);


/*[
  {
    "average_salary": "208172",
    "skills": "pyspark"
  },
  {
    "average_salary": "189155",
    "skills": "bitbucket"
  },
  {
    "average_salary": "160515",
    "skills": "couchbase"
  },
  {
    "average_salary": "160515",
    "skills": "watson"
  },
  {
    "average_salary": "155486",
    "skills": "datarobot"
  },
  {
    "average_salary": "154500",
    "skills": "gitlab"
  },
  {
    "average_salary": "153750",
    "skills": "swift"
  },
  {
    "average_salary": "152777",
    "skills": "jupyter"
  },
  {
    "average_salary": "151821",
    "skills": "pandas"
  },
  {
    "average_salary": "145000",
    "skills": "elasticsearch"
  },
  {
    "average_salary": "145000",
    "skills": "golang"
  },
  {
    "average_salary": "143513",
    "skills": "numpy"
  },
  {
    "average_salary": "141907",
    "skills": "databricks"
  },
  {
    "average_salary": "136508",
    "skills": "linux"
  },
  {
    "average_salary": "132500",
    "skills": "kubernetes"
  },
  {
    "average_salary": "131162",
    "skills": "atlassian"
  },
  {
    "average_salary": "127000",
    "skills": "twilio"
  },
  {
    "average_salary": "126103",
    "skills": "airflow"
  },
  {
    "average_salary": "125781",
    "skills": "scikit-learn"
  },
  {
    "average_salary": "125436",
    "skills": "jenkins"
  },
  {
    "average_salary": "125000",
    "skills": "notion"
  },
  {
    "average_salary": "124903",
    "skills": "scala"
  },
  {
    "average_salary": "123879",
    "skills": "postgresql"
  },
  {
    "average_salary": "122500",
    "skills": "gcp"
  },
  {
    "average_salary": "121619",
    "skills": "microstrategy"
  }
]*/


/*
PySpark ranks first, with an average annual salary of 208,172, followed by Bitbucket at 189,155.
pandas, Jupyter and NumPy all appear in the top 12, linking Python-related tools with high-paying roles.
scikit-learn also makes the list, with an average salary of 125,781.
All 25 listed skills have average salaries above 120,000 among the selected work-from-home Data Analyst postings.
One useful limitation: the query doesn’t show how many jobs mention each skill. A high average could come from only a few postings.*/