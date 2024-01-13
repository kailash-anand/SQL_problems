-- Write your PostgreSQL query statement below
Select contest_id,
Round
(
    (
        Count(R.user_id) /
        (
            Select Count(user_id)
            From Users  
        )::float * 100
    )::numeric,
    2 
) as percentage
From Users U
Join Register R On U.user_id = R.user_id
Group By contest_id
Order By percentage desc, contest_id;





