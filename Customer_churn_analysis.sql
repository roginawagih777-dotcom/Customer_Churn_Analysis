Create database Telco_db;
use Telco_db;

SELECT 
    COUNT(customerID) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(customerID)) * 100, 2) AS Churn_Rate_Percentage
FROM cleaned_churn_data;

SELECT 
    Contract,
    COUNT(customerID) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(customerID)) * 100, 2) AS Churn_Rate
FROM cleaned_churn_data
GROUP BY Contract
ORDER BY Churn_Rate DESC;

SELECT 
    PaymentMethod,
    COUNT(customerID) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) / COUNT(customerID)) * 100, 2) AS Churn_Rate
FROM cleaned_churn_data
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

SELECT 
    customerID,
    Contract,
    PaymentMethod,
    MonthlyCharges,
    tenure
FROM cleaned_churn_data
WHERE Churn = 'No'
  AND Contract = 'Month-to-month'
  AND TechSupport = 'No';