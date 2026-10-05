/*What is the most optimal skill
  - most demanded skill
  - most paid skill
  - Work From Home Data analyst roles with specific yearly salaries*/

WITH skill_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS demand_count
    FROM
        job_postings_fact jpf 
        INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
        INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE
        jpf.job_title_short = 'Data Analyst' AND
        jpf.salary_year_avg IS NOT NULL AND
        jpf.job_work_from_home = TRUE
    GROUP BY
        sd.skill_id
),

top_salary_skill AS (
    SELECT 
        sd.skill_id,               
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
        sd.skill_id
)

select 
    ds.skill_id,
    tss.skills AS skill_name,
    ds.demand_count,
    tss.average_salary
FROM
    top_salary_skill tss
INNER JOIN skill_demand ds 
ON tss.skill_id = ds.skill_id
WHERE ds.demand_count > 10
ORDER BY
    tss.average_salary DESC, ds.demand_count DESC  
LIMIT(25) ;



/*[
  {
    "skill_id": 8,
    "skill_name": "go",
    "demand_count": "27",
    "average_salary": "115320"
  },
  {
    "skill_id": 234,
    "skill_name": "confluence",
    "demand_count": "11",
    "average_salary": "114210"
  },
  {
    "skill_id": 97,
    "skill_name": "hadoop",
    "demand_count": "22",
    "average_salary": "113193"
  },
  {
    "skill_id": 80,
    "skill_name": "snowflake",
    "demand_count": "37",
    "average_salary": "112948"
  },
  {
    "skill_id": 74,
    "skill_name": "azure",
    "demand_count": "34",
    "average_salary": "111225"
  },
  {
    "skill_id": 77,
    "skill_name": "bigquery",
    "demand_count": "13",
    "average_salary": "109654"
  },
  {
    "skill_id": 76,
    "skill_name": "aws",
    "demand_count": "32",
    "average_salary": "108317"
  },
  {
    "skill_id": 4,
    "skill_name": "java",
    "demand_count": "17",
    "average_salary": "106906"
  },
  {
    "skill_id": 194,
    "skill_name": "ssis",
    "demand_count": "12",
    "average_salary": "106683"
  },
  {
    "skill_id": 233,
    "skill_name": "jira",
    "demand_count": "20",
    "average_salary": "104918"
  },
  {
    "skill_id": 79,
    "skill_name": "oracle",
    "demand_count": "37",
    "average_salary": "104534"
  },
  {
    "skill_id": 185,
    "skill_name": "looker",
    "demand_count": "49",
    "average_salary": "103795"
  },
  {
    "skill_id": 2,
    "skill_name": "nosql",
    "demand_count": "13",
    "average_salary": "101414"
  },
  {
    "skill_id": 1,
    "skill_name": "python",
    "demand_count": "236",
    "average_salary": "101397"
  },
  {
    "skill_id": 5,
    "skill_name": "r",
    "demand_count": "148",
    "average_salary": "100499"
  },
  {
    "skill_id": 78,
    "skill_name": "redshift",
    "demand_count": "16",
    "average_salary": "99936"
  },
  {
    "skill_id": 187,
    "skill_name": "qlik",
    "demand_count": "13",
    "average_salary": "99631"
  },
  {
    "skill_id": 182,
    "skill_name": "tableau",
    "demand_count": "230",
    "average_salary": "99288"
  },
  {
    "skill_id": 197,
    "skill_name": "ssrs",
    "demand_count": "14",
    "average_salary": "99171"
  },
  {
    "skill_id": 92,
    "skill_name": "spark",
    "demand_count": "13",
    "average_salary": "99077"
  },
  {
    "skill_id": 13,
    "skill_name": "c++",
    "demand_count": "11",
    "average_salary": "98958"
  },
  {
    "skill_id": 186,
    "skill_name": "sas",
    "demand_count": "63",
    "average_salary": "98902"
  },
  {
    "skill_id": 7,
    "skill_name": "sas",
    "demand_count": "63",
    "average_salary": "98902"
  },
  {
    "skill_id": 61,
    "skill_name": "sql server",
    "demand_count": "35",
    "average_salary": "97786"
  },
  {
    "skill_id": 9,
    "skill_name": "javascript",
    "demand_count": "20",
    "average_salary": "97587"
  }
]*/



/*Python and Tableau show a strong balance of demand and salary: Python appears in 236 postings, averaging 101,397, while Tableau appears in 230, averaging 99,288—the highest demand counts in these results.
Cloud and big-data skills command higher average salaries: Snowflake (112,948), Hadoop (113,193) and Azure (111,225) exceed Python’s average, but appear in fewer postings (22–37). This suggests higher-paying, more specialised opportunities.
The highest salary doesn’t mean the most opportunities: Go leads at 115,320, but appears in only 27 postings. Your query filters out skills with 10 or fewer postings, yet still ranks by salary first—so this is a salary-led shortlist, not an equal balance of pay and demand.*/