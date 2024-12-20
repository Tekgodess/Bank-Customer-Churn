# Bank-Customer-Churn
## Customer Churn Analysis and Retention Strategies

### Title: "Data-Driven Insights and Strategies for Reducing Customer Churn: A Comprehensive Analysis of Bank Customer Dynamics"

#### Introduction

In today’s competitive banking environment, retaining customers is critical to sustaining growth and profitability. Customer churn, the rate at which customers stop using a company’s services, poses significant challenges, particularly when it is driven by factors that can be addressed through targeted interventions.

This report comprehensively analyzes customer churn within our bank’s customer base using the 'Bank Customer Churn Dataset'. We have identified key trends and segments contributing to churn using data-driven insights, including demographic factors, product usage patterns, and activity levels. 

Our findings highlight areas of concern and opportunities for tailored retention strategies to enhance customer satisfaction and loyalty. This report delivers:
1. A detailed analysis of churn patterns across key segments.
2. Actionable recommendations based on the insights.
3. Strategic pathways for optimizing customer retention efforts.

#### Dataset Overview:
10,000 customer records from a bank.
Features include demographic information (age, geography, gender), financial details (balance, credit score, estimated salary), engagement metrics (tenure, number of products), and the churn label (Exited).

#### 1. Data Cleaning Summary

Missing Values: No missing values were found in the dataset.
Duplicate Rows: No duplicate rows based on `CustomerId`.
Outliers: No outliers in `Age` (values are between 18 and 100).
No negative values in `Balance` or `EstimatedSalary`.

The dataset is clean and ready for analysis.

#### 2. Key Insights
Churn Rate Overview
Overall Churn Rate: 20.37%
High-Risk Factors:
Age: Older customers are more likely to churn.
Balance: Both very low and very high balances are associated with churn.
Engagement: Customers with fewer products or inactive membership show higher churn rates.
Credit Score: Poor credit scores correlate with churn, though the effect is moderate.

#### Segmentation Analysis
##### 1. Geography
   Germany has the highest churn rate (32.44%), followed by Spain (16.67%) and France (16.15%).

##### 2. Gender
   Female customers churn at 25.07%, significantly higher than males (16.46%).

##### 3. Age Group:
 Churn increases with age.
    Under 30: 7.52%
    30-50: 19.58%
    Above 50: 44.65%


##### 4. Product Usage:
 Churn rate rises dramatically for customers with multiple products:
     1 Product: 27.71%
     2 Products: 7.58%
     3 Products: 82.71%
     4 Products: 100%

##### 5. Activity Level:
Inactive Members: 26.85%   
Active Members: 14.27%

##### 6. Salary Range:
 Churn rates are consistent across salary ranges:
  Low (< $50,000): 19.93%
  Medium ($50,000-$100,000): 19.87%
  High (> $100,000): 20.84%

### Feature Importance (From Model)
Age: The most critical factor influencing churn, highlighting the need for age-specific retention strategies.
Balance: Significant influence—customers with extreme balances (low or high) are at higher risk.
Estimated Salary: Impacts churn, possibly due to financial stability.
Number of Products: Strong engagement (more products) reduces churn risk.
Tenure and Active Membership: Loyalty and activity levels moderately affect churn.
Demographics (Geography and Gender): Less impactful but still notable.

#### Model and Performance Metrics
Machine Learning Model: A Random Forest Classifier was used to predict churn.
Data Split: The dataset was split into 80% training and 20% testing data.
Key Evaluation Metrics:
Accuracy: 86% overall model accuracy.
Precision: 79% for churn predictions, meaning most predicted churners were actual churners.
Recall: 46%, indicating the model missed some churners (false negatives).
AUC (Area Under ROC Curve): 0.85, reflecting strong predictive power in distinguishing churners from non-churners.

#### Confusion Matrix Observations
True Positives (187): Customers correctly identified as churners.
True Negatives (1542): Customers correctly identified as non-churners.
False Positives (51): Non-churners incorrectly flagged as churners.
False Negatives (220): Churners incorrectly labelled as non-churners (missed by the model).
Challenge: Improving recall (identifying more churners) to reduce false negatives.

#### ROC Curve Analysis
The ROC curve shows the trade-off between True Positive Rate (TPR) and False Positive Rate (FPR) at various classification thresholds.
AUC = 0.85: Indicates that the model has an 85% chance of correctly distinguishing churners from non-churners.
Implication: The model performs well, but threshold adjustments could prioritize recall if churn detection is more critical than reducing false positives.

#### 3. Recommendations
##### Focus on High-Churn Regions (Germany):
 Implement region-specific initiatives such as customer feedback programs, loyalty rewards, or personalized offers.
Investigate reasons for high churn in Germany through customer surveys.

##### Engage Female Customers:
Develop gender-specific campaigns like targeted promotions and enhanced service channels.
Address dissatisfaction drivers through detailed analysis of feedback from female customers.

##### Support Older Customers (above 50):
Offer tailored financial planning services and product bundles for older customers.
Simplify communication and improve accessibility of banking services for this demographic.

##### Optimize Product Offering:
Address dissatisfaction among customers with 3 or more products.
Simplify account management and reassess the product bundling strategy.

###### Activate Inactive Members:
Launch engagement campaigns, such as gamified incentives or personalized outreach.
Offer rewards for increased activity levels and participation in bank programs.

##### Customer Feedback Mechanisms:
Implement a feedback loop to collect insights directly from customers at risk of churning.
Use this feedback to tailor interventions and measure improvements.

##### Retention Analytics Dashboard:
Develop a real-time churn analytics dashboard for proactive risk identification.
Use predictive models to target at-risk customers before they decide to leave.

#### 5. Conclusion
##### Insights: Age, financial factors, and engagement are the primary drivers of churn.
##### Model Performance: The model performs well overall, with an AUC of 0.85, but improving recall is critical for detecting more churners.
##### Actionable Steps: Focused retention strategies and improved customer engagement will significantly reduce churn rates.
By addressing the identified areas of high churn and implementing the recommendations outlined above, the bank can significantly improve customer retention. Key focus areas include:
Enhancing engagement with older customers and inactive members.
Reducing churn among customers with multiple products through simplification and targeted outreach.
Addressing regional disparities, especially in Germany, through customized strategies.

This report equips the bank with actionable insights to build stronger customer relationships and drive long-term growth.

