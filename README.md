# Crowdfunding-ETL
## Overview
Independent Funding is requesting to perform an ETL process for their new dataset containing information on backers' pledging live campaigns. Once the data is extracted, transfomed, and loaded into the database, live campaigns must be analyzed in SQL to determine their performance.

## Objectives
- Extract and transform the raw data into a DataFrame and format the data by dropping, splitting, and converting columns using Pandas in Jupyter Notebook
- Create an ERD to visualize table relationships and create a database schema in PostgreSQL and import the data using pgAdmin 
- Query tables that contain information of live campaign performances and email contact of backers

## Results
- Raw file to new DataFrame [code link](https://github.com/chrisc1777/Crowdfunding-ETL/blob/main/Extract-Transform_final_code.ipynb)

![etl1](https://user-images.githubusercontent.com/106359564/215354624-dc01f139-862a-4c88-82da-f61d2f56387c.png)
![etl2](https://user-images.githubusercontent.com/106359564/215354626-7f2d5e46-3684-4b8c-a916-a1878258b1f0.png)


- ERD tables and schema [code link](https://github.com/chrisc1777/Crowdfunding-ETL/blob/main/crowdfunding_db%20table_schema.sql)

![crowdfunding_db_relationships](https://user-images.githubusercontent.com/106359564/215353873-13f48248-fdd8-4288-b583-5f43a9ac9676.png)


- Table Queries [code link](https://github.com/chrisc1777/Crowdfunding-ETL/blob/main/crowdfunding_SQL_Analysis.sql)
  - SQL analysis of live campaigns' remaining goals
  
  
  ![etl5](https://user-images.githubusercontent.com/106359564/215355909-6dbdb731-8be6-4b86-a57f-2152b5166559.png)
  
  
  
  - SQL analysis of backers' contact info
  
  
  ![etl6](https://user-images.githubusercontent.com/106359564/215356001-b79a41a2-bcf2-46d5-b86f-c7b67ee90bd1.png)



## Summary
After performing the ETL process we were able to find there are 14 live campaigns left that still haven't reached their goal. The highest remaining goal left is $153,288 and the lowest is $426. Our query table provides a list of contacts to notify project creators how much funding they need to reach their goal. We also have 8,175 rows of contact from backers who pledged for the live campaigns.
