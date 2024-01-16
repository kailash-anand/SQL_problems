-- Write your PostgreSQL query statement below
Select name as results
From
(
    Select U.name, Count(rating) as count
    From Users U
    Join MovieRating MR On U.user_id = MR.user_id
    Group By U.user_id, U.name
    Order By count desc, name
    Limit 1
)
Union All
Select title
From
(
    Select M.title, Avg(rating) as rating
    From Movies M
    Join MovieRating MR On M.movie_id = MR.movie_id
    And to_char(MR.created_at, 'YYYY-MM') = '2020-02'
    Group By MR.movie_id, M.title
    Order By rating desc, M.title
    Limit 1
)