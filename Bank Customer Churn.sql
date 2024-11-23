-- Data Cleaning

SELECT * 
FROM `customer-churn-records`

-- Checking for null Values
SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS MissingCreditScore,
    SUM(CASE WHEN Geography IS NULL THEN 1 ELSE 0 END) AS MissingGeography,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS MissingGender,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS MissingAge,
    SUM(CASE WHEN Tenure IS NULL THEN 1 ELSE 0 END) AS MissingTenure,
    SUM(CASE WHEN Balance IS NULL THEN 1 ELSE 0 END) AS MissingBalance,
    SUM(CASE WHEN NumOfProducts IS NULL THEN 1 ELSE 0 END) AS MissingNumOfProducts,
    SUM(CASE WHEN HasCrCard IS NULL THEN 1 ELSE 0 END) AS MissingHasCrCard,
    SUM(CASE WHEN IsActiveMember IS NULL THEN 1 ELSE 0 END) AS MissingIsActiveMember,
    SUM(CASE WHEN EstimatedSalary IS NULL THEN 1 ELSE 0 END) AS MissingEstimatedSalary,
    SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END) AS MissingExited
FROM 
   `customer-churn-records`
   
   -- Removing Duplicates
   SELECT 
    CustomerId, 
    COUNT(*) AS DuplicateCount
FROM 
   `customer-churn-records`
GROUP BY 
    CustomerId
HAVING COUNT(*) > 1;

-- Handling Outliers
SELECT * 
FROM 
   `customer-churn-records`
WHERE 
    Age > 100 OR Age < 18
    OR Balance < 0
    OR EstimatedSalary < 0;
-- There is no null Values, duplicates or Outliers.

-- Segmenting Customers by Age Group
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        WHEN Age > 50 THEN 'Above 50'
    END AS AgeGroup,
    COUNT(*) AS CustomerCount
FROM 
    `customer-churn-records`
GROUP BY 
    AgeGroup;
    
-- Segmenting Customers by Credit Score Range
SELECT 
    CASE 
        WHEN CreditScore < 600 THEN 'Low'
        WHEN CreditScore BETWEEN 600 AND 700 THEN 'Medium'
        WHEN CreditScore > 700 THEN 'High'
    END AS CreditScoreRange,
    COUNT(*) AS CustomerCount
FROM 
    `customer-churn-records`
GROUP BY 
    CreditScoreRange;
    
-- Segmenting Customers by Product Usage
SELECT 
    NumOfProducts,
    COUNT(*) AS CustomerCount
FROM 
    `customer-churn-records`
GROUP BY 
    NumOfProducts
ORDER BY 
    NumOfProducts;
    
-- Segmenting Customers by Geography
SELECT 
    Geography,
    COUNT(*) AS CustomerCount
FROM 
    `customer-churn-records`
GROUP BY 
    Geography;

-- Customer Churn Rate Analysis
-- Query to calculate the overall churn rate, which is the percentage of customers who have exited.
SELECT 
    (COUNT(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*)) * 100 AS ChurnRate
FROM 
   `customer-churn-records`
   
-- Churn Rate by Geography
-- Query to calculate the churn rate by geography, helping to identify regions with higher churn.
SELECT 
    Geography,
    COUNT(*) AS CustomerCount
FROM 
    `customer-churn-records`
GROUP BY 
    Geography;

-- Churn Rate by Gender
-- Query to determine if there is a significant difference in churn rates between genders. 
SELECT 
Gender,
(COUNT(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*)) * 100 AS ChurnRate
FROM 
`customer-churn-records`
GROUP BY 
Gender;

-- Churn Rate by Credit Score
-- Query to explore the churn rate based on customer credit scores, potentially correlating lower scores with higher churn.
SELECT 
    CASE 
        WHEN CreditScore < 600 THEN 'Low'
        WHEN CreditScore BETWEEN 600 AND 700 THEN 'Medium'
        WHEN CreditScore > 700 THEN 'High'
    END AS CreditScoreRange,
    (COUNT(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*)) * 100 AS ChurnRate
FROM 
    `customer-churn-records`
GROUP BY 
    CreditScoreRange;
    
-- Churn Rate by Age Group
-- Query to analyze how churn rates differ by age groups.
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        WHEN Age > 50 THEN 'Above 50'
    END AS AgeGroup,
    (COUNT(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*)) * 100 AS ChurnRate
FROM 
    `customer-churn-records`
GROUP BY 
    AgeGroup;
    
 -- Churn Rate by Number of Products
-- Query to check if customers with more products have a lower churn rate.   
SELECT 
    NumOfProducts,
    (COUNT(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*)) * 100 AS ChurnRate
FROM 
    `customer-churn-records`
GROUP BY 
    NumOfProducts;
    
-- Active vs Inactive Member Churn
-- Query to analyze churn between active and inactive members.
SELECT 
    IsActiveMember,
    (COUNT(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*)) * 100 AS ChurnRate
FROM 
    `customer-churn-records`
GROUP BY 
    IsActiveMember;
    
-- Correlation Between Salary and Churn
-- Query to see if there's any correlation between customer salary and churn.
SELECT 
    CASE 
        WHEN EstimatedSalary < 50000 THEN 'Low'
        WHEN EstimatedSalary BETWEEN 50000 AND 100000 THEN 'Medium'
        WHEN EstimatedSalary > 100000 THEN 'High'
    END AS SalaryRange,
    (COUNT(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*)) * 100 AS ChurnRate
FROM 
    `customer-churn-records`
GROUP BY 
    SalaryRange;
    
-- Retention Strategies: Customers with High Balance and Low Churn
-- Query to identify customers with a high balance and low churn rate, which can be targeted for retention efforts.
SELECT 
    CustomerId, 
    Surname, 
    Balance, 
    Exited
FROM 
    `customer-churn-records`
WHERE 
    Balance > 100000 AND Exited = 0;
    
-- Exiting Customers by Tenure
-- Query to analyze the impact of customer tenure on churn.
SELECT 
    Tenure,
    (COUNT(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*)) * 100 AS ChurnRate
FROM 
     `customer-churn-records`
GROUP BY 
    Tenure;
    
-- Identifying High-Risk Customers (Churn Predictive Model)
-- A query that identifies customers who might be at risk of churning based on attributes such as low credit score, low balance, and inactive status.
SELECT 
    CustomerId, 
    Surname, 
    CreditScore, 
    Balance, 
    IsActiveMember, 
    Exited
FROM 
    `customer-churn-records`
WHERE 
    CreditScore < 600 
    AND Balance < 50000 
    AND IsActiveMember = 0
    AND Exited = 0;







