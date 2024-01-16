-- Write your PostgreSQL query statement below
Select
(
    Round(
        ( 
            Count(D.order_date)::float/
            (
                Select Count(Distinct customer_id)
                From Delivery
            )::float * 100
        )::numeric
    , 2)
) as immediate_percentage
From
(
    Select customer_id, Min(order_date) as order_date
    From Delivery
    Group By customer_id
) as D
Join Delivery D1 on D.customer_id = D1.customer_id 
And D.order_date = D1.order_date 
And D.order_date = D1.customer_pref_delivery_date;

