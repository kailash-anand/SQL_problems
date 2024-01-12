-- Write your PostgreSQL query statement below
Select E.name, B.bonus
From Employee E
Left Join Bonus B on E.empId = B.empId
Where B.bonus < 1000
Or B.bonus is Null;