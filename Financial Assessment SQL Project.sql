SELECT *
FROM financial_risk_table;

# Case Study 1: Who’s High Risk?

-- Context: 
-- A financial institution wants to strengthen its lending criteria. You're tasked with profiling borrowers categorized as “High” risk.

# Business Questions:
-- What is the total Loan Amount, Average, Max?

-- Total Loan Amount:
SELECT SUM(`Loan Amount`) AS Total_Loan_Anount
FROM financial_risk_table;


-- Average Loan Amount:
SELECT AVG(`Loan Amount`) AS Average_Loan_Amount
FROM financial_risk_table;


-- Max Loan Amount:
SELECT Max(`Loan Amount`) AS Max_Loan_Amount
FROM financial_risk_table;




-- What is the total credit score?


SELECT SUM(`Credit Score`) AS Total_Credit_Score
FROM financial_risk_table;

-- How many people are employed and unemployed?


-- No. of People Employed:
SELECT COUNT(`Employment Status`) AS Employed
FROM financial_risk_table
WHERE `Employment Status` LIKE 'Employed';

-- No. of People Unemployed:
SELECT COUNT(`Employment Status`) AS Unemployed
FROM financial_risk_table
WHERE `Employment Status` LIKE 'Unemployed';




# Case Study 2: Loan Behavior by Age Group and Education Level

-- Context:
-- The bank is testing age-specific financial products. They want to know how loan amounts and Education Level vary across different age brackets.

# Business Question:
-- Which Education Level has the highest Loan Amount? :

#SQL Query:
SELECT `Education Level`, SUM(`Loan Amount`) AS TotalLoan
FROM financial_risk_table
GROUP BY `Education Level`
ORDER BY TotalLoan DESC;




# Case Study 3 Average Loan Amount for Education Level

-- Context: 
-- The bank also want to know the Average Loan Amount by their Education Level and Age

# Business Question:
-- Are there Average Loan Amount For Education Level?


SELECT  `Education Level`, AVG(`Loan Amount`) AS Average_Loan_Amount
FROM financial_risk_table
GROUP BY `Education Level`
ORDER BY Average_Loan_Amount DESC;




# Case Study 3: Max Loan Amount for Education Level and Age

-- Context: 
-- The CEO also want to know the Max Loan Amount by their Education Level

# Business Question:
--  What is the top 6 Education Level by age and their Max Loan Amount?:


SELECT  `Education Level`, MAX(`Loan Amount`) AS Max_Loan_Amount
FROM financial_risk_table
GROUP BY `Education Level`
LIMIT 6;



# Case Study 4: Marital Status with highest Credit Score

-- Context: 
-- Excutives want to know the Marital Status with highest credit score

# Business Question:
-- Which Marital Status has Highest Credit Score?


SELECT (`Marital Status`), SUM(`Credit Score`) AS TotalCreditScore
FROM financial_risk_table
GROUP BY `Marital Status`;


# Case study 5: Management wants to know the relationship between employment status, payment history, and risk rating

-- Context:
-- What patterns exist among high-risk clients?

# Business Question:
-- Are there relationships between employment status, payment history, and risk rating?


SELECT `Employment Status`, COUNT(`Risk Rating`) AS HighRisk
FROM financial_risk_table
WHERE `Risk Rating` = 'High'
GROUP BY `Employment Status`
ORDER BY 'HighRisk' DESC;



