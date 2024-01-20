-- Write your PostgreSQL query statement below
Select product_name, Sum(unit) as unit
From Products P
Join Orders O on P.product_id = O.product_id
Where to_char(O.order_date, 'YYYY-MM') = '2020-02'
Group By P.product_id, product_name
Having Sum(unit) >= 100