-- Write your PostgreSQL query statement below
Select S.user_id,
Case
    When 
    (
        Round(
        ((
            Select Count(action)
            From Confirmations C3
            Where C3.action = 'confirmed' And S.user_id = C3.user_id
            Group By C3.user_id
        )::float
        /
        (
            Select Count(action)
            From Confirmations C2
            Where S.user_id = C2.user_id
            Group By C2.user_id
        )::float)::numeric,2)
    ) is Null Then 0
    Else
    (
        Round(
        ((
            Select Count(action)
            From Confirmations C3
            Where C3.action = 'confirmed' And S.user_id = C3.user_id
            Group By C3.user_id
        )::float
        /
        (
            Select Count(action)
            From Confirmations C2
            Where S.user_id = C2.user_id
            Group By C2.user_id
        )::float)::numeric,2)
    )
End as confirmation_rate
From Signups S
Left Join Confirmations C On S.user_id = C.user_id
Group By S.user_id;
