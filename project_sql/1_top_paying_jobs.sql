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