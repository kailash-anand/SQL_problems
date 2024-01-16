-- Write your PostgreSQL query statement below
Select 
(
    Round(
        Count(Distinct A.player_id)/
        (
            Select Count(Distinct player_id)
            From Activity
        )::float::numeric
    , 2)
) as fraction
From 
(
    Select player_id, Min(event_date) as event_date
    From Activity
    Group By player_id
) as A
Join Activity A1 on A.player_id = A1.player_id
And A1.event_date - A.event_date = 1;

