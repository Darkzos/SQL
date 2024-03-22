# Introduction
The data market is wild, Focusing on Data Engineer roles, this project explores the top paying jobs, in-demand sills, and where demands meets high salary in Data world.

The queries are in this location [project_sql folder](/project_sql/)

# Backgroung
This is a guided project that wanted to explore the actual data market effectively, to understand the salaries, skills and tools that are needed to success in this marker.

The data is in the following page [SQL Course](https://lukebarousse.com/sql)

# Tools Used
The main tools used in this project where:
- **SQL:** The main tool for the analysis of this project, making queries to retrieve the desired data.
- **PostgreSQL:** Chosen database management system, easy to use and install to handling the data.
- **Visual Studio Code:** Chosen IDE for the flexibility and wide catalog of extensions to use inside the IDE to execute queries and version control.
- **Git & GitHub:** Main tool for version control, connected to the VSCODE to make commits directly from the IDE.

# Analysis
Each query aimed to research specific aspects of the Data Engineer market.
### 1. Top Paying Data Engineer Jobs
To identify the highest-paying roles, the query filterede Data Engineer positions by average yearly salary and location.

```sql
SELECT 
    c.name,
    job_title as Role,
    job_location,
    job_schedule_type,
    salary_year_avg AS salary,
    job_posted_date
FROM
    job_postings_fact AS j
INNER JOIN company_dim AS c 
ON j.company_id = c.company_id
WHERE job_title_short = 'Data Engineer' 
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary DESC LIMIT 10;
```
# Learning
I learned a lot doing this, here are some results of the analysis and what I learned from there.

![Top Paying Roles](/assets/rolesalary.png)
*Bar graph that shows the average salary per rol*

![Salaries per Skill](/assets/Avgsalaryskill.png)
*Bar graph that shows the average salary per skill*

![Top Skills Required](/assets/skillcount.png)
*Bar graph that shows the required skills for top 10 jobs*

# Conclusions
Data Engineer is a top paying role that is on the top highest salaries and offers in the actual market and there are main tools to learn in order to success in this market.
