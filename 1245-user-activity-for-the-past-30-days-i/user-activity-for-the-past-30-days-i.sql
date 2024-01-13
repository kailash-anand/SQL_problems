-- Write your PostgreSQL query statement below
Select activity_date as day, Count(Distinct user_id) as active_users
From Activity
Where activity_date Between '2019-06-28' And '2019-07-27'
Group By activity_date; 