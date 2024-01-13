-- Write your PostgreSQL query statement below
Select S.student_id, S.student_name, Sbj.subject_name, Count(E.subject_name) as attended_exams
From Students S
Join Subjects Sbj On 1 = 1
Left Join Examinations E On S.student_id = E.student_id and E.subject_name = Sbj.subject_name
Group By S.student_id, S.student_name, Sbj.subject_name
Order By S.student_id, Sbj.subject_name; 
