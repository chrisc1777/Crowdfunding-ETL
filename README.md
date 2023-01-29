# Crowdfunding-ETL
## Overview
Independent Funding is requesting to perform an ETL process for their new dataset containing information on backers' pledging live campaigns. Once the data is extracted, transfomed, and loaded into the database, live campaigns must be analyzed in SQL to determine their performance.

## Objectives
- Extract and transform the raw data into a DataFrame using Pandas in Jupyter Notebook
- Format the data by dropping, splitting, and converting columns
- Create an ERD to visualize table relationships
- Create a database in PostreSQL and import the data using pgAdmin 
- Query tables that contain information of live campaign performances and email contact of backers

## Results
- Raw file to new dataframe

![etl1](https://user-images.githubusercontent.com/106359564/215354624-dc01f139-862a-4c88-82da-f61d2f56387c.png)
![etl2](https://user-images.githubusercontent.com/106359564/215354626-7f2d5e46-3684-4b8c-a916-a1878258b1f0.png)


- ERD tables 

![crowdfunding_db_relationships](https://user-images.githubusercontent.com/106359564/215353873-13f48248-fdd8-4288-b583-5f43a9ac9676.png)


- SQL analysis of live campaigns' remaining goal

![etl5](https://user-images.githubusercontent.com/106359564/215355909-6dbdb731-8be6-4b86-a57f-2152b5166559.png)


- SQL analysis of backers' contact info

![etl6](https://user-images.githubusercontent.com/106359564/215355927-bd50ccdb-cf23-4cab-9e55-16b743a2cc5b.png)


## Summary
