/*
Question: What are the 10 highest-paying Data Analyst job postings?

Scope:
- Job category: Data Analyst
- Location listed as 'Anywhere'
- Annual salary must be available

Results are ordered by annual salary, highest first.
*/

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



/*[
  {
    "job_id": 226942,
    "title": "Data Analyst",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-02-20 15:13:33",
    "salary": "650000.0",
    "company_name": "Mantys"
  },
  {
    "job_id": 547382,
    "title": "Director of Analytics",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-08-23 12:04:42",
    "salary": "336500.0",
    "company_name": "Meta"
  },
  {
    "job_id": 552322,
    "title": "Associate Director- Data Insights",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-06-18 16:03:12",
    "salary": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 99305,
    "title": "Data Analyst, Marketing",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-12-05 20:00:40",
    "salary": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 1021647,
    "title": "Data Analyst (Hybrid/Remote)",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-01-17 00:17:23",
    "salary": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 168310,
    "title": "Principal Data Analyst (Remote)",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-08-09 11:00:01",
    "salary": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 731368,
    "title": "Director, Data Analyst - HYBRID",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-12-07 15:00:13",
    "salary": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 310660,
    "title": "Principal Data Analyst, AV Performance Analysis",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-01-05 00:00:25",
    "salary": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 1749593,
    "title": "Principal Data Analyst",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-07-11 16:00:05",
    "salary": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 387860,
    "title": "ERM Data Analyst",
    "location": "Anywhere",
    "schedule_type": "Full-time",
    "job_posted_date": "2023-06-09 08:01:04",
    "salary": "184000.0",
    "company_name": "Get It Recruit - Information Technology"
  }
]*/

