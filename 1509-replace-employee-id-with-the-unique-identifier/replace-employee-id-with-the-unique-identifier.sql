-- Write your PostgreSQL query statement below
Select 
Case
    When EmployeeUNI.unique_id Is Not Null Then EmployeeUNI.unique_id
End As unique_id, Employees.name
From Employees
Left Join EmployeeUNI
On Employees.id = EmployeeUNI.id;