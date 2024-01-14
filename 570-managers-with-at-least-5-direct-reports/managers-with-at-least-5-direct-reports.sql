-- Write your PostgreSQL query statement below
Select A.name
From Employee A, Employee B
Where A.id = B.managerId
Group By A.name, B.managerId
Having Count(B.managerId) >= 5;