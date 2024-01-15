-- Write your PostgreSQL query statement below
Select to_char(T.trans_date, 'YYYY-MM') as month, country, Count(id) as trans_count,
Count(
    Case 
        When state = 'approved' Then id 
    End
) as approved_count,
Sum(amount) as trans_total_amount,
Sum(
    Case 
        When state = 'approved' Then amount
        Else 0 
    End
) as approved_total_amount
From Transactions T
Group By country, month;
