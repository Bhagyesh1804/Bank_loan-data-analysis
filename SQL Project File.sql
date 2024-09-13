select * from finance_1_1;
select * from finance_2_2;

-- Year wise loan amount Stat
select year(issue_d) as year,
concat(format(round(sum(loan_amnt)/1000000,2),2),"M") as total_loan_amount
from finance_1_1
group by year
order by year;

-- Grade and sub grade wise revol_bal
select grade,sub_grade,sum(revol_bal) as total_revol_bal
from finance_1_1 inner join finance_2_2
on finance_1_1.id = finance_2_2.id
group by grade,sub_grade
order by grade,sub_grade;

-- Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status,
concat(format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance_1_1 inner join finance_2_2
on finance_1_1.id = finance_2_2.id
group by verification_status;

-- State wise and last_credit_pull_d wise loan status
select addr_state,last_credit_pull_d,loan_status
from finance_1_1 inner join finance_2_2
on finance_1_1.id = finance_2_2.id
group by addr_state,last_credit_pull_d,loan_status
order by loan_status,last_credit_pull_d;

-- Home ownership Vs last payment date stats
select home_ownership,last_pymnt_d
from finance_1_1 inner join finance_2_2
on finance_1_1.id = finance_2_2.id
group by home_ownership,last_pymnt_d
order by home_ownership,last_pymnt_d;






