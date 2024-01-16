-- Write your PostgreSQL query statement below
Select patient_id, patient_name, conditions
From Patients
Where Position('DIAB1' in conditions) > 0
And (Substring(conditions,Position('DIAB1' in conditions)-1,1) = ' ' Or Position('DIAB1' in conditions) = 1);