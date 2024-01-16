-- Write your PostgreSQL query statement below
Select user_id, 
Concat(Upper(Substring(name,1,1)),Lower(Substring(name,2,Length(name)))) as name
From Users
Order By user_id