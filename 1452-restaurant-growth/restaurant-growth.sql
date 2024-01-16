-- Write your PostgreSQL query statement below
Select Distinct C.visited_on, 
(
    Select Sum(amount)
    From Customer C1
    Where C1.visited_on Between C.visited_on - 6 And C.visited_on
) as amount,
(
    Round(
        (
            Select Sum(amount)
            From Customer C2
            Where C2.visited_on Between C.visited_on - 6 And C.visited_on
        )/7::float::numeric
    , 2)
) as average_amount
From Customer C
Where visited_on-6 = Any(
    Select visited_on
    From Customer
)
Group By visited_on
Order By visited_on;
