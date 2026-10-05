/* What the the most in demand skills for Data Analysts*/


SELECT
    sd.skills,
    COUNT(sjd.job_id) AS demand_count
FROM
    job_postings_fact jpf 
    INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst'
GROUP BY
    sd.skills
ORDER BY 
        demand_count DESC
LIMIT(5);


/*[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]*/

/*SQL leads demand, appearing in 92,628 job postings.
Excel ranks second, ahead of Python—spreadsheet skills remain prominent in these results.
Python is third, with 57,326 postings.
Tableau appears more often than Power BI: 46,554 versus 39,468 postings.*/