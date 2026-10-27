CREATE DATABASE eda;
USE eda;

-- 1. Total customers, active customers vs churn customers, churn rate percentage 
SELECT 
    COUNT(DISTINCT user_id) AS total_users,
    SUM(CASE WHEN is_churn = 0 THEN 1 ELSE 0 END) AS active_users,
    SUM(CASE WHEN is_churn = 1 THEN 1 ELSE 0 END) AS churn_users,
    -- Churn Rate percentage
    (SUM(CASE WHEN is_churn = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT user_id)) AS churn_rate_percentage
FROM status;

-- 2. Churn rate percentage by acquisition channel and signup cohort. 
SELECT 
    u.acquisition_channel,
    -- Take the 4 digits on the far right of the year + “-” + the 2 digits in the middle representing the month
    CONCAT(RIGHT(u.signup_date, 4), '-', SUBSTRING(u.signup_date, 4, 2)) AS signup_cohort,
    COUNT(DISTINCT u.user_id) AS total_users_acquired,
    (SUM(s.is_churn) * 100.0 / COUNT(DISTINCT u.user_id)) AS churn_rate_percentage
FROM users u
JOIN status s ON u.user_id = s.user_id
GROUP BY u.acquisition_channel, signup_cohort
ORDER BY signup_cohort ASC, churn_rate_percentage DESC;

-- 3. Identify customers who have not logged in for the last 30 days but were previously active.
SELECT 
    user_id,
    days_since_last_activity,
    loan_count,
    avg_transaction_amount
FROM status
WHERE days_since_last_activity > 30 
  AND is_churn = 0
ORDER BY days_since_last_activity DESC;

-- 4. Identify top 3 acquisition channels with best retention and highest churn.
-- Best retention
SELECT 
    u.acquisition_channel,
    COUNT(DISTINCT u.user_id) AS total_users,
    (SUM(s.is_churn) * 100.0 / COUNT(DISTINCT u.user_id)) AS churn_rate_percentage,
    -- Retention formulas
    (100.0 - (SUM(s.is_churn) * 100.0 / COUNT(DISTINCT u.user_id))) AS retention_rate_percentage
FROM users u
JOIN status s ON u.user_id = s.user_id
GROUP BY u.acquisition_channel
ORDER BY retention_rate_percentage DESC
LIMIT 3;

-- Highest churn
SELECT 
    u.acquisition_channel,
    COUNT(DISTINCT u.user_id) AS total_users,
    (SUM(s.is_churn) * 100.0 / COUNT(DISTINCT u.user_id)) AS churn_rate_percentage,
    -- Retention formulas
    (100.0 - (SUM(s.is_churn) * 100.0 / COUNT(DISTINCT u.user_id))) AS retention_rate_percentage
FROM users u
JOIN status s ON u.user_id = s.user_id
GROUP BY u.acquisition_channel
ORDER BY churn_rate_percentage DESC
LIMIT 3;