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
Big-data skills lead the salary ranking: PySpark tops the list at 208,172, while Databricks and Scala also feature, suggesting high-paying roles involving large-scale data processing.
Python and machine learning skills feature strongly: Pandas, NumPy and Jupyter support cleaning and analysing data, while Watson, DataRobot and scikit-learn support predictive modelling.
Some analyst roles involve broader technical work: GitLab, Kubernetes and Airflow suggest responsibilities involving code, infrastructure and automation. However, without posting counts, high average salaries may reflect only a few jobs.*/