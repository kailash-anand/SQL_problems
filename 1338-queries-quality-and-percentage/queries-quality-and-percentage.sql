-- Write your PostgreSQL query statement below
Select query_name, 
Round
(
    (Sum(rating/position::float)/Count(rating)::float)::numeric,
    2 
) as quality,
Case
When Round
(
    (
        (
            Select Count(rating)
            From Queries Q1 
            Where rating < 3 And Q.query_name = Q1.query_name
            Group By query_name
        )/Count(rating)::float * 100
    )::numeric,
    2 
) is Null Then 0
Else
Round
(
    (
        (
            Select Count(rating)
            From Queries Q1 
            Where rating < 3 And Q.query_name = Q1.query_name
            Group By query_name
        )/Count(rating)::float * 100
    )::numeric,
    2 
)
End as poor_query_percentage
From Queries Q
Where Q.query_name Is Not Null
Group By query_name;