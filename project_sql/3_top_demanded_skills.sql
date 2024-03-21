SELECT
    skills,
    COUNT(d.job_id) AS demand_count
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS d ON j.job_id = d.job_id
INNER JOIN skills_dim  AS s ON d.skill_id = s.skill_id
WHERE   
    job_title_short = 'Data Engineer'
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;