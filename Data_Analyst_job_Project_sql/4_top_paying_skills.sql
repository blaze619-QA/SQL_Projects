/*
Answer: What are the top skills based on salary?
- LOOK at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Here are the three most critical trends based on the top-paying skills for data analysts:

1. 🤖 The Overlap with AI and Deep Learning Engineering: The highest salaries are tied to skills like PyTorch, TensorFlow, Keras, and Hugging Face, indicating a massive salary premium for professionals who can build, train, and deploy advanced Machine Learning and Deep Learning models, rather than just performing traditional business intelligence.

2. ⚙️ High Value on Data Engineering & DevOps (MLOps): A majority of the high-paying skills are infrastructure and pipeline tools (Airflow, Kafka, Terraform, Ansible, Golang). This shows that the top roles require the ability to design, build, and maintain scalable systems for handling and deploying data, effectively merging the analyst role with Data and ML Engineering.

3. 🚀 Premium for Niche/Emerging Technologies: Highly specialized skills like Solidity (for Blockchain/Web3) and specific system/database tools (Couchbase, Cassandra) command top dollar, highlighting the demand for analysts willing to specialize deeply in bleeding-edge technologies or complex enterprise systems.
These trends suggest that Data Analysts aiming for top salaries should consider expanding their skill sets beyond traditional analysis to include advanced machine learning, data engineering, and emerging technologies.
*/  