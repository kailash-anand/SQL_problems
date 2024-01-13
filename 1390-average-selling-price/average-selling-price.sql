-- Write your PostgreSQL query statement below
Select P.product_id,
Case
    When Round(Sum((units * price))/Sum(units)::float::numeric, 2) is Null Then 0
    Else Round(Sum((units * price))/Sum(units)::float::numeric, 2)
End as average_price
From Prices P
Left Join UnitsSold U On P.product_id = U.product_id 
And U.purchase_date Between P.start_date And P.end_date
Group By P.product_id;