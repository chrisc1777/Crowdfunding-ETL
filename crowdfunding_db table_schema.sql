-- Createe tables for crowdfunding_db
CREATE TABLE campaign (
    cf_id INT NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    goal NUMERIC(10,2) NOT NULL,
    pledged NUMERIC(10,2) NOT NULL,
    outcome VARCHAR(50) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(10) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(10) NOT NULL,
    subcategory_id VARCHAR(10) NOT NULL,
	PRIMARY KEY (cf_id)
);

CREATE TABLE category (
    category_id VARCHAR(10) NOT NULL,
    category_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE subcategory (
    subcategory_id varchar(10) NOT NULL,
    subcategory_name varchar(50) NOT NULL,
	PRIMARY KEY (subcategory_id)
);

CREATE TABLE contacts (
    contact_id int NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (contact_id)
);

CREATE TABLE backers (
    backer_id varchar(5) NOT NULL,
	cf_id int NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (backer_id)
);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_contact_id FOREIGN KEY(contact_id)
REFERENCES contacts (contact_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_category_id FOREIGN KEY(category_id)
REFERENCES category (category_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY(subcategory_id)
REFERENCES subcategory (subcategory_id);

ALTER TABLE backers ADD CONSTRAINT fk_backers_cf_id FOREIGN KEY(cf_id)
REFERENCES campaign (cf_id);

SELECT*
FROM backers;

-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT SUM(backers_count), cf_id
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY SUM(backers_count) DESC;



-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(backer_id), cf_id
FROM backers
GROUP BY cf_id
ORDER BY COUNT(backer_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT co.first_name, co.last_name, co.email, (ca.goal - ca.pledged) AS remaining_goal_amount
INTO email_contacts_remaining_goal_amount
FROM contacts AS co
INNER JOIN campaign AS ca
ON ca.contact_id  = co.contact_id
WHERE ca.outcome = 'live'
ORDER BY remaining_goal_amount DESC;


-- Check the table
SELECT *
FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email, b.first_name, b.last_name, b.cf_id, ca.company_name, ca.description, ca.end_date, (ca.goal-ca.goal) AS "left_of_goal"
INTO email_backers_remaining_goal_amount
FROM campaign AS ca 
LEFT JOIN backers AS b
ON b.cf_id = ca.cf_id
WHERE ca.outcome = 'live'
ORDER BY b.last_name;

-- Check the table
SELECT *
FROM email_backers_remaining_goal_amount
