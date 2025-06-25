-- Confirming the database connection
SELECT * FROM project_job_market_analysis.Market LIMIT 10;

-- States with most number of jobs
SELECT Job_Location, COUNT(*) AS Job_Count FROM project_job_market_analysis.Market
GROUP BY Job_Location ORDER BY Job_Count DESC LIMIT 10;

-- Average Minimal and Maximal Salaries in different states
SELECT Job_Location, ROUND(AVG(Lower_Salary)*1000,2) AS Avg_Min_Salary, ROUND(AVG(Upper_Salary)*1000,2) AS Avg_Max_Salary
FROM project_job_market_analysis.Market GROUP BY Job_Location;

-- Average Salary in different states
SELECT Job_Location, ROUND(AVG(Avg_SalaryK)*1000,2) AS Avg_Salary FROM project_job_market_analysis.Market 
GROUP BY Job_Location;

-- Top 5 industries with maximum nuber of data science related job postings
SELECT Industry, COUNT(*) AS job_count 
FROM project_job_market_analysis.Market WHERE LOWER(job_title_sim) LIKE '%data scientist%'
GROUP BY Industry ORDER BY job_count DESC LIMIT 5;

-- Companies with maximum nuber of job openings
SELECT Company_Name, COUNT(*) AS job_count FROM project_job_market_analysis.Market
GROUP BY Company_Name ORDER BY job_count DESC LIMIT 10;

-- Job titles with most number of jobs
SELECT job_title_sim, COUNT(*) AS job_count FROM project_job_market_analysis.Market
GROUP BY job_title_sim ORDER BY job_count DESC LIMIT 10;

-- Salary of job titles with most number of jobs
SELECT job_title_sim, COUNT(*) AS job_count, ROUND(AVG(Avg_SalaryK)*1000,2) AS Avg_salary 
FROM project_job_market_analysis.Market GROUP BY job_title_sim  ORDER BY job_count
DESC LIMIT 10;

-- Skills Required by Companies for Each Job Title
SELECT job_title_sim, SUM(Python) AS Python_Required, SUM(spark) AS Spark_Required , SUM(aws) AS AWS_Required, SUM(excel) AS Excel_Required, 
SUM(sql_) AS SQL_Required, SUM(sas) AS SAS_Required, SUM(keras) AS Keras_Required, SUM(pytorch) AS Pytorch_Required, 
SUM(scikit) AS Scikit_Required, SUM(tensor) AS Tensor_Required, SUM(hadoop) AS Hadoop_Required,
SUM(tableau) AS Tableau_Required, SUM(bi) AS BI_Required, SUM(flink) AS Flink_Required, 
SUM(mongo) AS Mongo_Required, SUM(google_an) AS Google_analytics_Required 
FROM project_job_market_analysis.Market
GROUP BY job_title_sim
ORDER BY COUNT(*) DESC;


