-- Write your PostgreSQL query statement below
Select sell_date, Count(Distinct product) as num_sold,
(
    Select string_agg(Distinct product,',' Order By product) 
    From Activities A1
    Where A.sell_date = A1.sell_date
) as products
From Activities A
Group By sell_date