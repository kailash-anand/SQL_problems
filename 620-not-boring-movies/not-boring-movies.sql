-- Write your PostgreSQL query statement below
Select id, movie, description, rating
From Cinema
Where mod(id, 2) = 1 And description != 'boring'
Order By rating desc;