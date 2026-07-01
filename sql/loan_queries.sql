/*
===============================================================================
                            LOAN DEFAULT ANALYSIS
===============================================================================

Author      : Mercy Daramola
Tools Used  : MySQL Workbench, Power BI, Excel
Dataset     : Loan Data

Description:
This SQL script performs exploratory data analysis (EDA) on the
Loan Default dataset. The analysis investigates borrower
characteristics, loan performance, and default patterns to support
business decision-making.

===============================================================================
*/

-- ============================================================================
-- SECTION 1: DATA EXPLORATION
-- ============================================================================

-- 1. View the entire dataset
SELECT *
FROM loan_data;

-- 2. Count total records
SELECT COUNT(*) AS total_records
FROM loan_data;

-- 3. Display unique loan statuses
SELECT DISTINCT loan_status
FROM loan_data;

-- 4. Display unique loan grades
SELECT DISTINCT loan_grade
FROM loan_data;

-- 5. Display unique home ownership categories
SELECT DISTINCT home_ownership
FROM loan_data;

-- ============================================================================
-- SECTION 2: PORTFOLIO OVERVIEW
-- ============================================================================

-- 6. Total loan amount issued
SELECT
ROUND(SUM(loan_amnt),2) AS total_loan_amount
FROM loan_data;

-- 7. Average loan amount
SELECT
ROUND(AVG(loan_amnt),2) AS average_loan_amount
FROM loan_data;

-- 8. Average interest rate
SELECT
ROUND(AVG(interest_rate),2) AS average_interest_rate
FROM loan_data;

-- 9. Total outstanding principal balance
SELECT
ROUND(SUM(outstanding_principal_balance),2) AS outstanding_balance
FROM loan_data;

-- 10. Total repayments received
SELECT
ROUND(SUM(total_repaymnt),2) AS total_repayment
FROM loan_data;

-- ============================================================================
-- SECTION 3: LOAN STATUS ANALYSIS
-- ============================================================================

-- 11. Distribution of loan status
SELECT
loan_status,
COUNT(*) AS total_loans
FROM loan_data
GROUP BY loan_status
ORDER BY total_loans DESC;

-- 12. Percentage of each loan status
SELECT
loan_status,
COUNT(*) AS total_loans,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data),2) AS percentage
FROM loan_data
GROUP BY loan_status
ORDER BY percentage DESC;

-- ============================================================================
-- SECTION 4: LOAN GRADE ANALYSIS
-- ============================================================================

-- 13. Number of loans by grade
SELECT
loan_grade,
COUNT(*) AS total_loans
FROM loan_data
GROUP BY loan_grade
ORDER BY loan_grade;

-- 14. Average loan amount by grade
SELECT
loan_grade,
ROUND(AVG(loan_amnt),2) AS average_loan
FROM loan_data
GROUP BY loan_grade
ORDER BY loan_grade;

-- 15. Average interest rate by grade
SELECT
loan_grade,
ROUND(AVG(interest_rate),2) AS average_interest
FROM loan_data
GROUP BY loan_grade
ORDER BY loan_grade;

-- ============================================================================
-- SECTION 5: EMPLOYMENT ANALYSIS
-- ============================================================================

-- 16. Number of borrowers by employment length
SELECT
emp_length,
COUNT(*) AS borrowers
FROM loan_data
GROUP BY emp_length
ORDER BY borrowers DESC;

-- 17. Average annual income by employment length
SELECT
emp_length,
ROUND(AVG(annual_inc),2) AS average_income
FROM loan_data
GROUP BY emp_length
ORDER BY average_income DESC;

-- ============================================================================
-- SECTION 6: HOME OWNERSHIP ANALYSIS
-- ============================================================================

-- 18. Loan distribution by home ownership
SELECT
home_ownership,
COUNT(*) AS borrowers
FROM loan_data
GROUP BY home_ownership
ORDER BY borrowers DESC;

-- ============================================================================
-- SECTION 7: PURPOSE ANALYSIS
-- ============================================================================

-- 19. Loan purpose distribution
SELECT
purpose,
COUNT(*) AS total_loans
FROM loan_data
GROUP BY purpose
ORDER BY total_loans DESC;

-- ============================================================================
-- SECTION 8: VERIFICATION STATUS
-- ============================================================================

-- 20. Verification status distribution
SELECT
verification_status,
COUNT(*) AS borrowers
FROM loan_data
GROUP BY verification_status
ORDER BY borrowers DESC;

-- ============================================================================
-- SECTION 9: STATE ANALYSIS
-- ============================================================================

-- 21. Top 10 states with highest number of loans
SELECT
addr_state,
COUNT(*) AS total_loans
FROM loan_data
GROUP BY addr_state
ORDER BY total_loans DESC
LIMIT 10;

-- 22. Average loan amount by state
SELECT
addr_state,
ROUND(AVG(loan_amnt),2) AS average_loan
FROM loan_data
GROUP BY addr_state
ORDER BY average_loan DESC;

-- ============================================================================
-- SECTION 10: LOAN TERM ANALYSIS
-- ============================================================================

-- 23. Loan term distribution
SELECT
term,
COUNT(*) AS total_loans
FROM loan_data
GROUP BY term;

-- ============================================================================
-- SECTION 11: APPLICATION TYPE
-- ============================================================================

-- 24. Application type distribution
SELECT
application_type,
COUNT(*) AS borrowers
FROM loan_data
GROUP BY application_type;

-- ============================================================================
-- SECTION 12: FINANCIAL ANALYSIS
-- ============================================================================

-- 25. Average debt-to-income ratio
SELECT
ROUND(AVG(debt_income_ratio),2) AS average_dti
FROM loan_data;

-- 26. Highest loan amounts issued
SELECT
loan_id,
client_id,
loan_amnt,
annual_inc
FROM loan_data
ORDER BY loan_amnt DESC
LIMIT 10;

-- 27. Highest annual income borrowers
SELECT
client_id,
annual_inc,
loan_amnt
FROM loan_data
ORDER BY annual_inc DESC
LIMIT 10;

-- 28. Average repayment amount
SELECT
ROUND(AVG(total_repaymnt),2) AS average_repayment
FROM loan_data;

-- 29. Total installment amount
SELECT
ROUND(SUM(installment),2) AS total_installments
FROM loan_data;

-- ============================================================================
-- SECTION 13: BUSINESS INSIGHTS
-- ============================================================================

-- 30. Average loan amount by home ownership
SELECT
home_ownership,
ROUND(AVG(loan_amnt),2) AS average_loan_amount
FROM loan_data
GROUP BY home_ownership
ORDER BY average_loan_amount DESC;

-- 31. Average interest rate by verification status
SELECT
verification_status,
ROUND(AVG(interest_rate),2) AS average_interest_rate
FROM loan_data
GROUP BY verification_status
ORDER BY average_interest_rate DESC;

-- 32. Average outstanding balance by loan grade
SELECT
loan_grade,
ROUND(AVG(outstanding_principal_balance),2) AS average_balance
FROM loan_data
GROUP BY loan_grade
ORDER BY loan_grade;

-- 33. Top 10 largest outstanding balances
SELECT
loan_id,
client_id,
outstanding_principal_balance
FROM loan_data
ORDER BY outstanding_principal_balance DESC
LIMIT 10;
