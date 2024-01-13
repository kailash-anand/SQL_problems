-- Write your PostgreSQL query statement below
Select machine_id, round(Avg(process)::numeric, 3) as processing_time
From(
    Select A.machine_id, A.process_id, (B.timestamp - A.timestamp) as process
    From Activity A, Activity B
    Where A.machine_id = B.machine_id And A.process_id = B.process_id 
    And B.activity_type = 'end'
    And A.activity_type = 'start'
)
Group By machine_id; 
