SELECT * FROM data_science_job.ds_salariess;

-- choose schema
USE data_science_job;

-- read table
SELECT COUNT(DISTINCT job_title) AS no_of_job FROM ds_salariess;

-- experience level has the highest salary            
SELECT CASE WHEN experience_level = 'MI' THEN 'Mid level'
            WHEN experience_level = 'SE' THEN 'Senior level'
            WHEN experience_level = 'EN' THEN 'Entry level'
            WHEN experience_level = 'EX' THEN 'Executive level'
            ELSE NULL END AS experience_category, count(1) AS no_of_category, 
            ROUND(MAX(salary_in_usd), 2) AS highest_salary            
FROM data_science_job.ds_salariess 
GROUP BY CASE WHEN experience_level = 'MI' THEN 'Mid level'
            WHEN experience_level = 'SE' THEN 'Senior level'
            WHEN experience_level = 'EN' THEN 'Entry level'
            WHEN experience_level = 'EX' THEN 'Executive level'
            ELSE NULL END
ORDER BY highest_salary DESC ;           

--  employment type affect salary
SELECT CASE WHEN employment_type = 'FT' THEN 'Full time'
            WHEN employment_type = 'PT' THEN 'Part time'
            WHEN employment_type = 'FL' THEN 'freelance'
            WHEN employment_type = 'CT' THEN 'Contract'
            ELSE NULL END AS employment_category, count(1) AS no_of_category, 
            ROUND(MAX(salary_in_usd), 2) AS highest_salary            
FROM data_science_job.ds_salariess 
GROUP BY CASE WHEN employment_type = 'FT' THEN 'Full time'
            WHEN employment_type = 'PT' THEN 'Part time'
            WHEN employment_type = 'FL' THEN 'Freelance'
            WHEN employment_type = 'CT' THEN 'Contract'
            ELSE NULL END
ORDER BY highest_salary DESC;

-- highest salary per job title in USD
SELECT job_title, ROUND(AVG(salary_in_usd), 2) AS Average_salary FROM  ds_salariess
GROUP BY job_title
ORDER BY average_salary DESC;

-- highest paying entry-level data science job
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'EN'
GROUP BY job_title
ORDER BY highest_salary DESC;

-- highest paying mid-level data science job 
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'MI'
GROUP BY job_title
ORDER BY highest_salary DESC;

--  highest paying senior-level data science job 
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'SE'
GROUP BY job_title
ORDER BY highest_salary DESC; 

-- highest paying Executive level data science job
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'EX'
GROUP BY job_title
ORDER BY highest_salary DESC; 

-- the average salary per experience level
SELECT CASE WHEN experience_level = 'MI' THEN 'Mid level'
            WHEN experience_level = 'SE' THEN 'Senior level'
            WHEN experience_level = 'EN' THEN 'Entry level'
            WHEN experience_level = 'EX' THEN 'Executive level'
            ELSE NULL END AS experience_category,
            ROUND(MAX(salary_in_usd), 2) AS highest_salary            
FROM data_science_job.ds_salariess 
GROUP BY CASE WHEN experience_level = 'MI' THEN 'Mid level'
            WHEN experience_level = 'SE' THEN 'Senior level'
            WHEN experience_level = 'EN' THEN 'Entry level'
            WHEN experience_level = 'EX' THEN 'Executive level'
            ELSE NULL END
ORDER BY highest_salary DESC ;   

-- lowest paying entry-level data science job
SELECT MIN(salary_in_usd) AS lowest_salary, job_title
FROM ds_salariess
WHERE experience_level = 'EN'
GROUP BY job_title
ORDER BY lowest_salary; 

-- lowest paying Mid-level Data Science Job
SELECT MIN(salary_in_usd) AS lowest_salary, job_title
FROM ds_salariess
WHERE experience_level = 'MI'
GROUP BY job_title
ORDER BY lowest_salary; 

--  lowest paying Senior level data science job
SELECT MIN(salary_in_usd) AS lowest_salary, job_title
FROM ds_salariess
WHERE experience_level = 'SE'
GROUP BY job_title
ORDER BY lowest_salary; 

-- lowest paying Executive level data science job
SELECT MIN(salary_in_usd) AS lowest_salary, job_title
FROM ds_salariess
WHERE experience_level = 'EX'
GROUP BY job_title
ORDER BY lowest_salary; 

-- company size affect salary
SELECT CASE WHEN company_size = 'L' THEN 'Large Company'
            WHEN company_size = 'M' THEN 'Medium Company'
            WHEN company_size = 'S' THEN 'Small Company'
            ELSE NULL END AS company_size,
            ROUND(MIN(salary_in_usd), 2) AS min_salary,
            ROUND(MAX(salary_in_usd), 2) AS max_salary            
FROM data_science_job.ds_salariess 
GROUP BY CASE WHEN company_size = 'L' THEN 'large Company'
            WHEN company_size = 'M' THEN 'Medium Company'
            WHEN company_size = 'S' THEN 'Small Company'
            ELSE NULL END;

-- company location affect Salary            
SELECT CASE WHEN company_location = 'US' THEN 'In the US'
       ELSE 'Not in US' END AS company_loc_category,
       ROUND(MIN(salary_in_usd), 2) AS min_salary,
	   ROUND(MAX(salary_in_usd), 2) AS max_salary 
FROM ds_salariess
GROUP BY CASE WHEN company_location = 'US' THEN 'In the US'
       ELSE 'Not in US' END       