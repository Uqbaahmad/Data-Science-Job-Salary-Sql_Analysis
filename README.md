# Data Science Job Salary: Sql_Analysis
This repository demonstrates some common analysis and techniques using MySQL. For purpose of illustration the 
[Data Science Job Salary](https://www.kaggle.com/datasets/ruchi798/data-science-job-salaries) dataset has been taken from kaggle

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

In the project, I used the following SQL functions: **SELECT, FROM, WHERE, CASE STATEMENT, WINDOW CLAUSE, CTE, GROUP BY, ORDER BY, MAX, MIN, AVERAGE, ROUND, etc.**

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

![Screenshot (206)](https://user-images.githubusercontent.com/104266403/208470135-6e4ebc55-39b0-4ed7-9236-558431f4ab19.png)

![Screenshot (202)](https://user-images.githubusercontent.com/104266403/208464792-1dc59879-af94-4a1c-a53c-a465b77c6eb0.png)
![Screenshot (207)](https://user-images.githubusercontent.com/104266403/208470726-af03756d-6342-4fe7-a610-9e11b035c548.png)
