# Data Analyst Job Market Analysis Using SQL

## Introduction

This project explores Data Analyst job postings to understand which jobs offer the highest salaries, which skills employers request most often, and how skill demand compares with average salary.

I used five SQL queries to answer these questions, covering both the broader Data Analyst job market and work-from-home opportunities.

## Questions Explored

1. What are the highest-paying Data Analyst jobs?
2. Which skills are associated with those jobs?
3. What are the most in-demand skills for Data Analysts?
4. Which skills are associated with the highest average salaries for remote roles?
5. Which skills offer high average salaries while appearing in more than ten remote job postings?

## Tools and SQL Concepts

- PostgreSQL
- Filtering with `WHERE`
- Joining tables using `INNER JOIN` and `LEFT JOIN`
- Common Table Expressions (CTEs)
- Aggregations using `COUNT`, `AVG`, and `ROUND`
- Grouping and sorting using `GROUP BY` and `ORDER BY`
- Limiting results using `LIMIT`

## Database Structure

The analysis uses four tables:

| Table | Purpose |
| --- | --- |
| `job_postings_fact` | Job titles, locations, salaries, and other posting details |
| `company_dim` | Company information |
| `skills_dim` | Skill names and identifiers |
| `skills_job_dim` | Links job postings to their associated skills |

A job can be linked to multiple skills, so skill counts should not be added together to calculate the total number of jobs.

## Analysis and Findings

### 1. Highest-Paying Data Analyst Jobs

**File:** `1_top_paying_DA_jobs.sql`

This query identifies the ten highest-paying postings categorised as Data Analyst, with a location of `Anywhere` and a recorded annual salary.

The five highest results were:

| Company | Job Title | Annual Salary |
| --- | --- | ---: |
| Mantys | Data Analyst | 650,000 |
| Meta | Director of Analytics | 336,500 |
| AT&T | Associate Director- Data Insights | 255,829.5 |
| Pinterest Job Advertisements | Data Analyst, Marketing | 232,423 |
| Uclahealthcareers | Data Analyst (Hybrid/Remote) | 217,000 |

**Key insights:**

- Salaries across the ten results range from **184,000 to 650,000**. The Mantys figure stands well above the others and should be checked before treating it as a typical salary.
- Six of the ten titles include **Director, Associate Director, or Principal**, showing that senior roles feature heavily.
- All ten postings are full-time, and SmartAsset appears twice.

### 2. Skills Associated with the Highest-Paying Jobs

**File:** `2_top_paying_DA_skills.sql`

This query joins the ten highest-paying postings to their recorded skills. Eight of the ten jobs appear in the joined results.

| Skill | Number of Matched Jobs |
| --- | ---: |
| SQL | 8 |
| Python | 7 |
| Tableau | 6 |
| R | 4 |
| Excel | 3 |
| Pandas | 3 |
| Snowflake | 3 |
| Power BI | 2 |

**Key insights:**

- **SQL appears in all eight matched jobs**, followed by Python in seven.
- **Tableau is the most frequently mentioned visualisation tool** in this sample, appearing in six jobs.
- Cloud and data-processing tools also appear, suggesting that some high-paying roles involve broader technical responsibilities.

These counts summarise the query output. The query itself returns one row per job–skill association. The two missing jobs have no matching records returned by the skill joins.

### 3. Most In-Demand Skills

**File:** `3_top_demanded_skills.sql`

This query identifies the five most frequently mentioned skills across all Data Analyst postings. It does not filter by remote status or salary availability.

| Skill | Posting Count |
| --- | ---: |
| SQL | 92,628 |
| Excel | 67,031 |
| Python | 57,326 |
| Tableau | 46,554 |
| Power BI | 39,468 |

**Key insights:**

- **SQL leads demand**, highlighting the importance of working with structured data.
- **Excel ranks ahead of Python**, showing that spreadsheet skills remain prominent in these postings.
- **Tableau and Power BI both feature in the top five**, reflecting demand for dashboards and visual reporting.

### 4. Skills Associated with the Highest Average Salaries

**File:** `4_top_skills_salary.sql`

This query ranks skills by average annual salary for work-from-home Data Analyst postings with a recorded salary.

Selected results from the top 25:

| Skill | Average Annual Salary |
| --- | ---: |
| PySpark | 208,172 |
| Bitbucket | 189,155 |
| Couchbase | 160,515 |
| Watson | 160,515 |
| DataRobot | 155,486 |
| GitLab | 154,500 |
| Jupyter | 152,777 |
| Pandas | 151,821 |
| NumPy | 143,513 |
| Databricks | 141,907 |

**Key insights:**

- **Big-data skills feature prominently:** PySpark leads the ranking, with Databricks and Scala also appearing in the full results.
- **Python analysis and machine learning tools feature strongly:** Pandas, NumPy, and Jupyter support data analysis, while Watson, DataRobot, and scikit-learn support predictive modelling.
- **Some postings involve broader technical work:** development, infrastructure, and automation tools also appear.

This query has no minimum posting-count requirement. A high average salary could therefore be based on only a few jobs.

### 5. High-Paying Skills with a Minimum Demand Threshold

**File:** `5_optimal_skill.sql`

This query combines average salary and demand for work-from-home Data Analyst postings with recorded salaries. It keeps skills appearing in more than ten postings and returns the top 25 rows by average salary.

Selected results:

| Skill | Posting Count | Average Annual Salary |
| --- | ---: | ---: |
| Go | 27 | 115,320 |
| Confluence | 11 | 114,210 |
| Hadoop | 22 | 113,193 |
| Snowflake | 37 | 112,948 |
| Azure | 34 | 111,225 |
| AWS | 32 | 108,317 |
| Looker | 49 | 103,795 |
| Python | 236 | 101,397 |
| R | 148 | 100,499 |
| Tableau | 230 | 99,288 |

**Key insights:**

- **Python and Tableau combine strong demand with average salaries near 100,000.** They have the highest posting counts within this returned shortlist.
- **Cloud and big-data skills have higher average salaries but fewer postings.** Snowflake, Hadoop, and Azure appear in 22–37 postings.
- **The highest salary does not mean the most opportunities.** Go leads the salary ranking but appears in only 27 postings.

Despite the filename, this query does not calculate an “optimal” skill score. It ranks by salary after applying a minimum demand threshold; demand only breaks salary ties.

## Overall Findings

SQL is the most frequently mentioned skill in the broader demand results and appears in every matched job from the highest-paying sample.

Python and Tableau show a strong combination of demand and salary within the final remote-role shortlist. Excel also remains prominent across the broader job market.

Specialised cloud, big-data, and machine learning tools appear in high-salary results, but their posting counts and role requirements matter when interpreting those figures.

## Limitations

- **Different populations:** queries 1–2 use `job_location = 'Anywhere'`, while queries 4–5 use `job_work_from_home = TRUE`. Query 3 covers all Data Analyst postings.
- **Salary disclosure:** salary-based results exclude jobs without recorded annual salaries.
- **Seniority:** the Data Analyst category includes senior and leadership roles, so these figures are not entry-level salary benchmarks.
- **Small samples and outliers:** averages may be influenced by a few unusually high-paying postings.
- **Association:** these results describe salaries of jobs mentioning a skill, not the salary increase caused by learning it.
- **Counting assumptions:** posting counts assume each job–skill pair appears once in the bridge table.
- **Duplicate labels:** the final output contains two SAS rows under different skill IDs. These require investigation before combining them.
- **Skill naming:** `go` and `golang` appear under different labels across the results and need checking before comparison.
- **Historical data:** the ten highest-paying postings shown are dated in 2023. These results do not represent current vacancies.
- **Source and units:** the dataset source, full date coverage, and salary currency still need to be documented. Salary values here retain the dataset's numeric units.

## Running the Project

1. Load the source dataset into PostgreSQL.
2. Ensure the four tables and their original key constraints are available.
3. Open the SQL files in a PostgreSQL client.
4. Run the files in numbered order.
5. Export the outputs as CSV or JSON for comparison with the saved results.

The SQL files contain the questions, scope, queries, and saved JSON
results in comment blocks. The main findings are documented in this README.

## What I Learned

This project helped me practise joining related tables, breaking analysis into stages using CTEs, and calculating skill demand and average salaries.

It also showed me why interpreting a query matters as much as writing it. Filters change the population being analysed, high salaries may come from small samples, and a salary ranking alone does not identify the most useful skill to learn.