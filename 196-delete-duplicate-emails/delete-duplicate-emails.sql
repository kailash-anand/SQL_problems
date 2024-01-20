-- Write your PostgreSQL query statement below
Delete From Person
Where id Not In(
    Select Min(id)
    From Person
    Group By email
)