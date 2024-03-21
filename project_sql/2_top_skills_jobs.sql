WITH top_paying_jobs AS ( 
    SELECT
        job_id ,
        c.name,
        job_title as Role,
        salary_year_avg AS salary
    FROM
        job_postings_fact AS j
    LEFT JOIN company_dim AS c 
    ON j.company_id = c.company_id
    WHERE job_title_short = 'Data Engineer' 
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
    ORDER BY salary DESC LIMIT 10
)


SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary DESC;

/* [
  {
    "job_id": 21321,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 157003,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "name": "Engtal",
    "role": "Data Engineer",
    "salary": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "name": "Durlston Partners",
    "role": "Data Engineer",
    "salary": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "name": "Durlston Partners",
    "role": "Data Engineer",
    "salary": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "name": "Twitch",
    "role": "Director of Engineering - Data Platform",
    "salary": "251000.0",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "name": "Twitch",
    "role": "Director of Engineering - Data Platform",
    "salary": "251000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "name": "Twitch",
    "role": "Director of Engineering - Data Platform",
    "salary": "251000.0",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "name": "Twitch",
    "role": "Director of Engineering - Data Platform",
    "salary": "251000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "name": "Twitch",
    "role": "Director of Engineering - Data Platform",
    "salary": "251000.0",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "name": "Twitch",
    "role": "Director of Engineering - Data Platform",
    "salary": "251000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 595768,
    "name": "Signify Technology",
    "role": "Principal Data Engineer",
    "salary": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "name": "Signify Technology",
    "role": "Principal Data Engineer",
    "salary": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "name": "Signify Technology",
    "role": "Principal Data Engineer",
    "salary": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "name": "Signify Technology",
    "role": "Principal Data Engineer",
    "salary": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 561728,
    "name": "AI Startup",
    "role": "Data Engineer",
    "salary": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "name": "AI Startup",
    "role": "Data Engineer",
    "salary": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "name": "AI Startup",
    "role": "Data Engineer",
    "salary": "250000.0",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "name": "AI Startup",
    "role": "Data Engineer",
    "salary": "250000.0",
    "skills": "azure"
  },
  {
    "job_id": 543728,
    "name": "Signify Technology",
    "role": "Staff Data Engineer",
    "salary": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "name": "Signify Technology",
    "role": "Staff Data Engineer",
    "salary": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "name": "Signify Technology",
    "role": "Staff Data Engineer",
    "salary": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "name": "Signify Technology",
    "role": "Staff Data Engineer",
    "salary": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 151972,
    "name": "Movable Ink",
    "role": "Principal Data Engineer (Remote)",
    "salary": "245000.0",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "name": "Movable Ink",
    "role": "Principal Data Engineer (Remote)",
    "salary": "245000.0",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "name": "Movable Ink",
    "role": "Principal Data Engineer (Remote)",
    "salary": "245000.0",
    "skills": "gcp"
  },
  {
    "job_id": 204320,
    "name": "Handshake",
    "role": "Staff Data Engineer",
    "salary": "245000.0",
    "skills": "go"
  },
  {
    "job_id": 609418,
    "name": "Meta",
    "role": "Data Engineering Manager",
    "salary": "242000.0",
    "skills": "sql"
  },
  {
    "job_id": 609418,
    "name": "Meta",
    "role": "Data Engineering Manager",
    "salary": "242000.0",
    "skills": "python"
  },
  {
    "job_id": 609418,
    "name": "Meta",
    "role": "Data Engineering Manager",
    "salary": "242000.0",
    "skills": "java"
  },
  {
    "job_id": 609418,
    "name": "Meta",
    "role": "Data Engineering Manager",
    "salary": "242000.0",
    "skills": "perl"
  }
]

*/ 