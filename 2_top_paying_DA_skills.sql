/* what skills are associated with top paying DA jobs.*/
  

WITH top_paying_DA_jobs AS (
    SELECT
        jpf.job_id,
        jpf.job_title AS title,
        jpf.job_location AS location,         
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
    LIMIT(10)
)


SELECT
    tpdj.*,
    skills
FROM
    top_paying_DA_jobs tpdj 
    INNER JOIN skills_job_dim sjd ON tpdj.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
ORDER BY 
        salary DESC;

/*[
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "salary": "255829.5",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "title": "Data Analyst, Marketing",
    "location": "Anywhere",
    "salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "title": "Data Analyst, Marketing",
    "location": "Anywhere",
    "salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "title": "Data Analyst, Marketing",
    "location": "Anywhere",
    "salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "title": "Data Analyst, Marketing",
    "location": "Anywhere",
    "salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "title": "Data Analyst, Marketing",
    "location": "Anywhere",
    "salary": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "title": "Data Analyst (Hybrid/Remote)",
    "location": "Anywhere",
    "salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "title": "Data Analyst (Hybrid/Remote)",
    "location": "Anywhere",
    "salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "title": "Data Analyst (Hybrid/Remote)",
    "location": "Anywhere",
    "salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "title": "Data Analyst (Hybrid/Remote)",
    "location": "Anywhere",
    "salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "title": "Data Analyst (Hybrid/Remote)",
    "location": "Anywhere",
    "salary": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "salary": "205000.0",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "salary": "189309.0",
    "company_name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "salary": "189000.0",
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "salary": "189000.0",
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "salary": "189000.0",
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "salary": "189000.0",
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "salary": "189000.0",
    "company_name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "salary": "189000.0",
    "company_name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "salary": "189000.0",
    "company_name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "salary": "189000.0",
    "company_name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "salary": "186000.0",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "title": "ERM Data Analyst",
    "location": "Anywhere",
    "salary": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "title": "ERM Data Analyst",
    "location": "Anywhere",
    "salary": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "title": "ERM Data Analyst",
    "location": "Anywhere",
    "salary": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  }
]*/


/*- SQL is the most common skill, appearing in all 8 jobs with recorded skills.
- Python follows closely, appearing in 7 jobs.
- Tableau is the leading visualisation tool, appearing in 6 jobs, compared with Power BI in 2.
- R appears in 4 jobs, while Excel, pandas and Snowflake each appear in 3.
These counts cover 8 of the original 10 jobs; the other two didn’t appear in the skill-join results.*/