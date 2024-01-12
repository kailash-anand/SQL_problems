-- Write your PostgreSQL query statement below
Select B.id
From Weather A, Weather B
Where (B.recordDate - A.recordDate) = 1
And B.temperature > A.temperature;