create view dept_summary (dep, num, total_s, average_s)
as 
select dno, count(*), sum(salary), avg(salary) 
from employee 
group by dno;
