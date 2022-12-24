# Data Science Job Salary: Sql_Analysis
This repository demonstrates some common analysis and techniques using MySQL. For purpose of illustration the 
[Data Science Job Salary](https://www.kaggle.com/datasets/ruchi798/data-science-job-salaries) dataset has been taken from kaggle

This file contains analysis performed upon Data Science Job Salary dataset - [DS_job_salary_SQL_Analysis.sql](https://github.com/Uqbaahmad/Data-Science-Job-Salary-Sql_Analysis/blob/main/DS_job_salary_SQL_Analysis.sql) 

# Data Understanding and Cleaning
### STEP 1: Import the data into Excel
There were 11 columns and 608 rows in this dataset. It comprises the work year column, the experience level column, the employment type,
the job title, the wage, the salary in USD, and so on.
To better understand the data set, I used the filter feature. There is a salary column and another labelled salary in usd. The latter is essentially a USD conversion
of the former (US Dollars)
* I removed the first column which contained row number as I believe it is unnecessary for this analysis.
* I used the Remove duplicate function to check for duplicate rows. 42 duplicate rows were found and deleted. That is 566 rows left.
* I also checked for Blanks but there were no blanks
* I noticed that for the job title, there was a subtle repetition that could have affected the result of the analysis. Machine learning Engineer and ML Engineer were included in the dataset. This is basically the same job title written differently.
* I used the find and replace function to find ML Engineer in the dataset and replace with Machine Learning Engineer.

### STEP 2: Importing the data to SQL
For this analysis, I used MySQL Workbench. For the most part of this analysis, I will be working with the salary_in_usd column for the sake of uniformity.

In the project, I used the following SQL functions: **SELECT, FROM, WHERE, CASE STATEMENT, CTE, GROUP BY, ORDER BY, MAX, MIN, AVERAGE, ROUND, etc.**

# Analysis is about answering questions. Let's define some questions :
1. How many job title was included in the dataset?
2. Which experience level has the highest salary?
3. Does the employment type affect salary?
4. What is the average salary per job title in USD?
5. What is the highest salary per job title in USD?
6. What is the highest paying entry-level data science job?
7. What is the highest paying mid-level data science job?
8. What is the highest paying senior-level data science job?
9. What is the highest paying Executive level data science job?
10. What is the average salary per experience level?
11. What is the lowest paying entry-level data science job?
12. What is the lowest paying Mid-level Data Science Job?
13. What is the lowest paying Senior level data science job?
14. What is the lowest paying Executive level data science job?
15. Does company size affect salary?
16. Does company location affect Salary?

* Before I began the analysis, I needed to confirm that my dataset had been properly imported from Excel. I used the SELECT and asterisk functions to confirm it.

```
SELECT * FROM data_science_job.ds_salariess;
```

![Screenshot (202)](https://user-images.githubusercontent.com/104266403/208464792-1dc59879-af94-4a1c-a53c-a465b77c6eb0.png)

```
USE data_science_job;
```

### 1. How many job title was included in the dataset?
I used the COUNT function together with DISTINCT so as to get unique job_titles and to avoid duplicates in the course of the count.
```
SELECT COUNT(DISTINCT job_title) AS no_of_job FROM ds_salariess;
```
<p align="center">
  <img width="125" height="100" src="https://user-images.githubusercontent.com/104266403/208470726-af03756d-6342-4fe7-a610-9e11b035c548.png">
</p>

### 2. Which experience level has the highest salary?
I used the CASE Statement to separate the experience level into different categories of Mid-level, senior-level, entry-level, and executive-level. I used the Count function to count the number of jobs that belonged to each of the category. I used the Max function to find the highest salary and the Round function to round up the numbers to two decimal places so as to make it readable. I grouped by the Case statements and ordered by highest_salary in descending order to get the highest salary.

```
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
ORDER BY highest_salary DESC
```
<p align="center">
  <img width="400" height="50" src="https://user-images.githubusercontent.com/104266403/208496362-794479c2-c324-4105-877a-88a787e50b88.png">
</p>

### 3. Does the employment type affect salary?
I used the CASE Statement to separate the employment type into different categories: full-time, part-time, freelance, and contract. I used the Count function to count the number of jobs that belong to each category. I used the Average function to find the average salary per category and the Round function to round up the numbers to two decimal places so as to make it readable. I grouped by the Case statements and ordered by average_salary in descending order to get the result of the arranged in descending order


```
SELECT CASE WHEN experience_level = 'MI' THEN 'Mid level'
            WHEN experience_level = 'SE' THEN 'Senior level'
            WHEN experience_level = 'EN' THEN 'Entry level'
            WHEN experience_level = 'EX' THEN 'Executive level'
            ELSE NULL END AS experience_category, count(1),
            ROUND(AVG(salary_in_usd), 2) AS highest_salary            
FROM data_science_job.ds_salariess 
GROUP BY CASE WHEN experience_level = 'MI' THEN 'Mid level'
            WHEN experience_level = 'SE' THEN 'Senior level'
            WHEN experience_level = 'EN' THEN 'Entry level'
            WHEN experience_level = 'EX' THEN 'Executive level'
            ELSE NULL END
ORDER BY highest_salary DESC ;
```
<p align="center">
  <img width="296" height="113" src="https://user-images.githubusercontent.com/104266403/208595703-a8819dc7-e355-4504-bb74-664ffc44826a.png">
</p>

Contract staff get paid more on the average

### 4. What is the average salary per job title in USD?
I used the Average function to get the average salary per job title in USD. I used the Round function to round up the numbers to two decimal places so as to make it readable. I grouped by job title and ordered by the average salary in descending order.
```
SELECT job_title, ROUND(AVG(salary_in_usd), 2) AS Average_salary FROM  ds_salariess
GROUP BY job_title
ORDER BY average_salary DESC;
```
<p align="center">
  <img width="313" height="496" src="https://user-images.githubusercontent.com/104266403/208596554-73e9f29c-e029-43b6-8ec7-ddad0840dfb5.png">
</p>

### 5. What is the highest salary per job title in USD?
I used the Max function to get the highest salary in USD. I used the round function to round up the numbers to two decimal place so as to make it readable. I grouped by job_title and ordered by the highest salary in descending order.
```
SELECT job_title, ROUND(MAX(salary_in_usd), 2) AS Average_salary FROM  ds_salariess
GROUP BY job_title
ORDER BY average_salary DESC;
```

<p align="center">
  <img width="378" height="220" src="https://user-images.githubusercontent.com/104266403/208598452-9aee559a-29db-4a08-a093-a5ab29443667.png">
</p>
Principal Data Engineer at $600,000

### 6. What is the highest paying entry-level data science job?
 I used the Max function to get the highest salary in USD. I used the where function to filter the result and only return max salary for entry level. I grouped by job_title and ordered by the highest salary in descending order.

```
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'EN'
GROUP BY job_title
ORDER BY highest_salary DESC;
```

<p align="center">
  <img width="364" height="280" src="https://user-images.githubusercontent.com/104266403/208597200-609be970-daca-4d16-a966-aad8a6e1e1ce.png">
</p>

The  highest salary at the entry level is that of a Machine Learning Engineer is $250,000 (That’s a substantial entry-level salary)

### 7. What is the highest paying mid-level data science job?
 I used the Max function to get the highest salary in USD. I used where function to filter the result and only return max salary for mid-level. I grouped by job_title and ordered by the highest salary in descending order.
 ```
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'MI'
GROUP BY job_title
ORDER BY highest_salary DESC;
```
<p align="center">
  <img width="396" height="134" src="https://user-images.githubusercontent.com/104266403/208716054-9b82dd4c-c3c9-4eae-9db4-46afac78e8e0.png">
</p>
Financial Data Analyst and Research Scientist are same salary $450,000

### 8. What is the highest paying senior-level data science job?
I used the Max function to get the highest salary in USD. I used where function to filter the result and only return max salary for senior-level. I grouped by job_title and ordered by the highest salary in descending order.

 ```
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'SE'
GROUP BY job_title
ORDER BY highest_salary DESC;
```
<p align="center">
  <img width="324" height="197" src="https://user-images.githubusercontent.com/104266403/208714979-7102562f-088e-409a-bdc2-dbc9d428fbcd.png">
</p>
Data Scientist at $412,000 (Isn’t it surprising that some Mid-level roles get paid more than Senior-level roles?)

### 9. What is the highest paying Executive level data science job?
I used the Max function to get the highest salary in USD. I used where function to filter the result and only return max salary for executive-level. I grouped by job_title and ordered by the highest salary in descending order.

```
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'EX'
GROUP BY job_title
ORDER BY highest_salary DESC;
```
<p align="center">
  <img width="309" height="155" src="https://user-images.githubusercontent.com/104266403/208713715-39c59da3-8000-4ac6-90f0-4403aafd6e27.png">
</p>

Principal Data Engineer at $600,000 (Huge!)

### 10. What is the average salary per experience level?

I used the CASE Statement to separate the experience level into different categories: mid-level, senior-level, entry-level, and executive-level. I used the Count function to count the number of jobs that belonged to each category. I used the Average function to find the average salary per category and the Round function to round up the numbers to two decimal places so as to make it readable. I grouped by the Case statements and ordered by average_salary in descending order to get the result arranged in descending order.

```
SELECT CASE WHEN experience_level = 'MI' THEN 'Mid level'
            WHEN experience_level = 'SE' THEN 'Senior level'
            WHEN experience_level = 'EN' THEN 'Entry level'
            WHEN experience_level = 'EX' THEN 'Executive level'
            ELSE NULL END AS experience_category,
            ROUND(AVG(salary_in_usd), 2) AS highest_salary            
FROM data_science_job.ds_salariess 
GROUP BY CASE WHEN experience_level = 'MI' THEN 'Mid level'
            WHEN experience_level = 'SE' THEN 'Senior level'
            WHEN experience_level = 'EN' THEN 'Entry level'
            WHEN experience_level = 'EX' THEN 'Executive level'
            ELSE NULL END
ORDER BY highest_salary DESC ; 
```
<p align="center">
  <img width="293" height="114" src="https://user-images.githubusercontent.com/104266403/208714410-962d3af1-0e5c-423d-9cf1-54f02f7e7fe9.png">
</p>

### 11. What is the lowest paying entry-level data science job?
I used the Min function to get the lowest salary in USD. I used the where function to filter the result and only return the lowest salary for entry-level. I grouped by job_title and ordered by the lowest salary.

```
SELECT MIN(salary_in_usd) AS lowest_salary, job_title
FROM ds_salariess
WHERE experience_level = 'EN'
GROUP BY job_title
ORDER BY lowest_salary; 
```
<p align="center">
  <img width="318" height="50" src="https://user-images.githubusercontent.com/104266403/208710325-65c40dfe-623d-48ce-af37-52afd2836ef2.png">
</p>
At entry-level Data Scientist lowest salary is about $4000 (This is ridiculously low. An outlier maybe!).

### 12. What is the lowest paying Mid-level Data Science Job?

I used the Min function to get the lowest salary in USD. I used the where function to filter the result and only return the lowest salary for mid-level. I grouped by job_title and ordered by the lowest salary.
```
SELECT MIN(salary_in_usd) AS lowest_salary, job_title
FROM ds_salariess
WHERE experience_level = 'MI'
GROUP BY job_title
ORDER BY lowest_salary;
```
<p align="center">
  <img width="338" height="46" src="https://user-images.githubusercontent.com/104266403/208709328-dc939332-aa91-49bb-aed3-f480e56aff71.png">
</p>


At mid-level Data Scientist lowest salary is about $2859.

### 13. What is the lowest paying Senior level data science job?
```
SELECT MIN(salary_in_usd) AS lowest_salary, job_title
FROM ds_salariess
WHERE experience_level = 'SE'
GROUP BY job_title
ORDER BY lowest_salary;
```
<p align="center">
  <img width="318" height="48" src="https://user-images.githubusercontent.com/104266403/208708827-3f405933-4c31-4716-a046-265199695ff8.png">
</p>
 Computer Vision Engineer at $18,907
 
### 14. What is the lowest paying Executive level data science job?

I used the Min function to get the lowest salary in USD. I used the where function to filter the result and only return the lowest salary for the executive level. I grouped by job_title and ordered by the lowest salary.

```
SELECT MIN(salary_in_usd) AS lowest_salary, job_title
FROM ds_salariess
WHERE experience_level = 'EX'
GROUP BY job_title
ORDER BY lowest_salary;
```
<p align="center">
  <img width="315" height="49" src="https://user-images.githubusercontent.com/104266403/208708028-d720a8f9-2c80-4489-94af-b694a8cd53c4.png">
</p>

Data Science Consultant at $69,741


### 15. Does company size affect salary?
I used the CASE Statement to separate the company into different categories of a large, medium, and small companies. I used the Min and Max function to find the lowest and highest salary per company category and the Round function to round up the numbers to two decimal places so as to make it readable. I grouped them by the Case statements.<br/>

*Note -I used the Min and Max function here instead of Average because Averages are susceptible to outliers. Using average will not give us the right insight into how much companies pay.*

```
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'EX'
GROUP BY job_title
ORDER BY highest_salary DESC;
``` 
<p align="center">
  <img width="335" height="91" src="https://user-images.githubusercontent.com/104266403/208706977-128f62a4-1546-435a-bf45-0baf1c174937.png">
</p>
Yes, it does. Large companies tend to pay more

### 16. Does company location affect Salary?

I used the CASE Statement to separate the company location into Companies in the US and Companies not in the US. I used the Min and Max function to find the lowest and highest salary per location category and the Round function to round up the numbers to two decimal places so as to make it readable. I grouped them by the Case statements.
```
SELECT job_title, MAX(salary_in_usd) AS highest_salary
FROM ds_salariess
WHERE experience_level = 'EX'
GROUP BY job_title
ORDER BY highest_salary DESC;
```
<p align="center">
  <img width="370" height="71" src="https://user-images.githubusercontent.com/104266403/208706237-811fa9e9-4735-4925-8a07-0c81a345ad56.png">
</p>

Yes, it does. Companies in the US tend to pay more.

# Insights
From the above analysis, it can be concluded that companies in the US tend to pay more than their counterpart in other countries. 
