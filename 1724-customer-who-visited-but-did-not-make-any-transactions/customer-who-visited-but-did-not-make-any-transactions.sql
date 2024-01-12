-- Write your PostgreSQL query statement below
Select Visits.customer_id, Count(Visits.customer_id) as count_no_trans
From Visits
Where Not Exists (
    Select visit_id
    From Transactions
    Where Visits.visit_id = Transactions.visit_id
)
Group By Visits.customer_id;