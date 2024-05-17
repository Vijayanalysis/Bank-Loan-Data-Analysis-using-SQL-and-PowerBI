#Total Loan Applications
SELECT count(id) as 'Total Applications'
from loan_data;

#MTD Loan Applications
SELECT count(id) as 'total_applications'
from loan_data
where month(issue_date)=12;

#PMTD Loan Applications
SELECT count(id) as 'total_applications'
from loan_data
where month(issue_date)=11;

#Total Funded Amount
SELECT sum(loan_amount) as total_funded
from loan_data;

#MTD Total Funded Amount
SELECT sum(loan_amount) AS total_funded FROM loan_data
WHERE MONTH(issue_date) = 12;

#PMTD Total Funded Amount
SELECT SUM(loan_amount) AS total_funded FROM loan_data
WHERE MONTH(issue_date) = 11;

#Total Amount Received
SELECT SUM(total_payment) as total_received
from loan_data;

#MTD Total Amount Received
SELECT SUM(total_payment) AS total_received FROM loan_data
WHERE MONTH(issue_date) = 12;

#PMTD Total Amount Received
SELECT SUM(total_payment) AS total_received FROM loan_data
WHERE MONTH(issue_date) = 11;

#Average Interest Rate
SELECT round(avg(int_rate)*100,2) as 'avg_int_rate' from loan_data;

#MTD Average Interest
SELECT round(avg(int_rate)*100,2) as 'avg_int_rate' 
from loan_data
where MONTH(issue_date) = 12;

#PMTD Average Interest Rate
SELECT ROUND(AVG(int_rate)*100,2) as 'avg_int rate' from loan_data
where MONTH(issue_date) = 11;

#avg DTI
SELECT ROUND(AVG(dti)*100,2) AS avg_dti FROM loan_data;


#MTD Average DTI
SELECT ROUND(avg(dti)*100,2) as 'avg_dti' from loan_data
where MONTH(issue_date) = 12;

#PMTD Average DTI
SELECT ROUND(avg(dti)*100,2) as 'avg_dti' from loan_data
where MONTH(issue_date) = 11;

#Good Loan Percentage
SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) *100) / 
	COUNT(id) AS good_loan_percentage
from loan_data;

#Good Loan Applications
SELECT COUNT(id) as good_loan_applicaions from loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current';

#Good Loan Funded Amount
SELECT SUM(loan_amount) as good_loan_funded_amount from loan_data 
where loan_status = 'Fully Paid' OR loan_status = 'Current';

#Good Loan Amount Received
SELECT SUM(total_payment) as ‘good_loan_amount_received from loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current';

#Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM loan_data;

#Bad Loan Applications
SELECT COUNT(id) as bad_loan_applicaions from loan_data
where loan_status = 'Charged Off';

#Bad Loan Funded Amount
SELECT SUM(loan_amount) as bad_loan_funded_amount from loan_data
where loan_status = 'Charged Off';

#Good Loan Amount Received
SELECT SUM(total_payment) as bad_loan_amount_received from loan_data
where loan_status = 'Charged Off';

#LOAN STATUS
SELECT 
loan_status,
count(id) AS total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received,
round(avg(int_rate) *100,2) as average_interest_rate,
round(avg(dti) *100,2) as average_dti
from loan_data
group by loan_status;

SELECT 
loan_status, 
SUM(total_payment) AS MTD_Total_Amount_Received, 
SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;

SELECT 
MONTH(issue_date) AS Month_Number, 
MONTHNAME(issue_date) AS Month_name, 
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY Month_Number, Month_name
ORDER BY month(issue_date);

# TOP 10 STATE LOAN APPLICATION WISE
SELECT address_state as STATE,
COUNT(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from loan_data
group by STATE
order by total_loan_applications desc
limit 10;

#TERM
SELECT term, 
COUNT(id) as total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_amount_received
FROM loan_data
GROUP BY term
ORDER BY term;

#EMPLOYMENT LENGTH
SELECT emp_length,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_amount_received
FROM loan_data
GROUP BY emp_length
ORDER BY emp_length;

#PURPOSE

SELECT purpose,
COUNT(id) AS total_loan_applications,
SUM(loan_amount) AS total_funded_amount,
SUM(total_payment) AS total_amount_received
FROM loan_data
GROUP BY purpose
ORDER BY count(id) desc;

#HOME OWNERSHIP
SELECT home_ownership,
COUNT(id) AS total_loan_applications,
SUM(loan_amount) AS total_funded_amount,
SUM(total_payment) AS total_amount_received
FROM loan_data
GROUP BY home_ownership
ORDER BY count(id) desc;





