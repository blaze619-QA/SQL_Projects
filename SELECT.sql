SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date ,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM 
    job_postings_fact
LIMIT 10;


SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;


SELECT 
    job_schedule_type,
    AVG(salary_year_avg) AS salary_year_avg,
    AVG(salary_hour_avg) AS salary_hour_avg
FROM
    job_postings_fact
WHERE 
    job_posted_date > '2023-06-01'
GROUP BY
    job_schedule_type
ORDER BY
    job_schedule_type;

SELECT
    EXTRACT(MONTH FROM(job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST')) AS job_posted_month,
    COUNT(job_id) AS job_posted_count,
    job_posted_date::DATE AS job_posted_d
FROM
    job_postings_fact
WHERE   
    EXTRACT(YEAR FROM job_posted_date) = 2023 
GROUP BY
    job_posted_month,job_posted_d
ORDER BY
    job_posted_month;


SELECT *
FROM job_postings_fact
LIMIT 10;


SELECT *
FROM company_dim
LIMIT 10;


SELECT DISTINCT
    cd.name AS company_name
FROM 
    job_postings_fact AS jpf
INNER JOIN
    company_dim AS cd ON
    jpf.company_id = cd.company_id
WHERE   
    jpf.job_health_insurance = 'TRUE' AND
    EXTRACT(YEAR FROM jpf.job_posted_date) = 2023 AND
    EXTRACT(QUARTER FROM jpf.job_posted_date) = 2
GROUP BY
    company_name;




