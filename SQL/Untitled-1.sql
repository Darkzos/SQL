SELECT * FROM(
    SELECT * FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;


SELECT skill_count,skill_count.skill_id,s.skills FROM(
    SELECT COUNT(skill_id) AS skill_count,
    skill_id 
    FROM skills_job_dim 
    GROUP BY skill_id
    ORDER BY skill_count DESC LIMIT 5
) AS skill_count
LEFT JOIN skills_dim AS s on skill_count.skill_id = s.skill_id;

SELECT 
    company_count.company_id, c.name,jobPost,
    CASE
        WHEN jobPost < 10 THEN 'Small'
        WHEN jobPost < 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
 FROM (
    SELECT COUNT(company_id) AS jobPost,
    company_id
    FROM job_postings_fact
    GROUP BY company_id
) AS company_count
LEFT JOIN company_dim AS c ON company_count.company_id = c.company_id;


WITH january_jobs AS(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT * FROM january_jobs;

SELECT 
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE 
    company_id IN(
        SELECT
            company_id
        FROM 
            job_postings_fact
        WHERE
            job_no_degree_mention = True
        ORDER BY
            company_id
);

WITH company_job_count AS(
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    d.name AS company_name,
    c.total_jobs
FROM 
    company_dim AS d
LEFT JOIN 
    company_job_count AS c ON c.company_id = d.company_id
ORDER BY
    total_jobs ;

WITH skill_count AS(
    SELECT skill_id, COUNT(*) AS count
    FROM skills_job_dim AS s
    GROUP BY skill_id
    ORDER BY count DESC
    LIMIT 5
);

SELECT skill_count,skill_count.skill_id,s.skills FROM(
    SELECT COUNT(skill_id) AS skill_count,
    skill_id , job_id
    FROM skills_job_dim 
    GROUP BY skill_id, job_id
    ORDER BY skill_count DESC LIMIT 5
) AS skill_count
LEFT JOIN skills_dim AS s on skill_count.skill_id = s.skill_id
LEFT JOIN job_postings_fact AS j on j.job_id = skills_count.job_id
WHERE job_work_from_home = true;


SELECT 
    d.name AS company_name,
    COUNT(j.company_id) AS total_jobs
FROM 
    company_dim AS d
LEFT JOIN 
    job_postings_fact AS j ON j.company_id = d.company_id
GROUP BY
    d.name
ORDER BY
    total_jobs DESC;


WITH remote_job_skills AS(
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN 
        job_postings_fact AS job_postings 
        ON job_postings.job_id = skills_to_job.job_id
    WHERE job_work_from_home = true
    GROUP BY
        skill_id
    ORDER BY skill_count DESC LIMIT 5
)

SELECT s.skill_id, skills, skill_count FROM remote_job_skills
JOIN skills_dim AS s ON remote_job_skills.skill_id = s.skill_id

