-- Write your PostgreSQL query statement below
Select P.project_id, Round(Avg(experience_years)::numeric, 2) as average_years
From Project P
Join Employee E On P.employee_id = E.employee_id
Group By project_id;
