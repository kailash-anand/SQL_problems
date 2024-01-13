-- Write your PostgreSQL query statement below
Select employee_id
From Employees
Where salary < 30000 And manager_id Is not Null
And manager_id != All
(
    Select employee_id
    From Employees
)
Order By employee_id;