-- Write your PostgreSQL query statement below
Select Max(num) as num
From(
    Select num
    From MyNumbers
    Group By num
    Having Count(num) = 1
);