# Write your MySQL query statement below
with cnt1 as (
    select e2.employee_id, count(e2.department_id) cnt from Employee e2
    group by e2.employee_id
    )
select e.employee_id, e.department_id
from Employee e
join cnt1 c1
on e.employee_id = c1.employee_id
where e.primary_flag = (case when c1.cnt = 1 then e.primary_flag else 'Y' end);